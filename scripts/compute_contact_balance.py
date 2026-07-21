#!/usr/bin/env python3
"""
Compute contact balances from a ticket export (Mongo / prd.ticket.json shape).

Mirrors historic models_weebi logic:
  packages/models/lib/src/extensions/tickets_purchasing_power.dart
    contactTicketsPurchasingPowerDateEnd

Formula (ticket contribution only; no closing ledger / overdraft):
  clientBalance    = sum(sellCovered)  - sum(sellDeferred)
  supplierBalance  = sum(spendCovered) - sum(spendDeferred)
  balance          = clientBalance - supplierBalance - sum(wage)

Where ticket amounts match TicketWeebi.total / TicketPb.totalComputed:
  sell / sellDeferred   -> items price − promo − discount + tax
  spend / spendDeferred -> items cost  − promo − discount + tax
  sellCovered / spendCovered / wage -> received

Only active tickets are counted (status != false). Soft-deleted rows
(isDeleted == true) are skipped as well.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


def _round4(v: float) -> float:
    return round(v * 10000) / 10000


def _article_price(item: dict[str, Any]) -> float:
    retail = item.get("articleRetail") or {}
    if retail.get("calibreId") is not None or retail.get("id") is not None or retail.get("price") is not None:
        if retail:
            return float(retail.get("price") or 0)
    uncountable = item.get("articleUncountable") or {}
    if uncountable:
        return float(uncountable.get("price") or 0)
    basket = item.get("articleBasket") or {}
    if basket:
        # proxiesWorth not present in this export; fall back to 0
        worth = 0.0
        for p in item.get("proxiesWorth") or []:
            worth += round(float(p.get("price") or 0) * float(p.get("minimumUnitPerBasket") or 0))
        return worth - float(basket.get("discountAmount") or 0) + float(basket.get("markupAmount") or 0)
    return 0.0


def _article_cost(item: dict[str, Any]) -> float:
    retail = item.get("articleRetail") or {}
    if retail:
        return float(retail.get("cost") or 0)
    uncountable = item.get("articleUncountable") or {}
    if uncountable:
        return float(uncountable.get("cost") or 0)
    basket = item.get("articleBasket") or {}
    if basket:
        worth = 0.0
        for p in item.get("proxiesWorth") or []:
            worth += round(float(p.get("cost") or 0) * float(p.get("minimumUnitPerBasket") or 0))
        return worth
    return 0.0


def ticket_total(ticket: dict[str, Any]) -> float:
    """Same semantics as TicketPb.totalComputed / TicketWeebi.total."""
    ticket_type = ticket.get("ticketType") or ""
    received = float(ticket.get("received") or 0)

    if ticket_type in ("sellCovered", "spendCovered", "wage"):
        return received

    items = ticket.get("items") or []
    promo = float(ticket.get("promo") or 0)
    discount = float(ticket.get("discountAmount") or 0)
    tax_pct = float((ticket.get("taxe") or {}).get("percentage") or 0)

    if ticket_type in ("sell", "sellDeferred"):
        items_only = sum(_article_price(i) * float(i.get("quantity") or 0) for i in items)
    elif ticket_type in ("spend", "spendDeferred"):
        items_only = sum(_article_cost(i) * float(i.get("quantity") or 0) for i in items)
    else:
        return 0.0

    promo_val = _round4(items_only * promo / 100)
    markdowns_included = items_only - (promo_val + discount)
    taxes = _round4(markdowns_included * (tax_pct / 100)) if tax_pct > 0 else 0.0
    return markdowns_included + taxes


def is_active(wrap: dict[str, Any]) -> bool:
    if wrap.get("isDeleted") is True:
        return False
    ticket = wrap.get("ticket") or {}
    # Missing status is treated as active (same as ticketIsActive in stats_service).
    return ticket.get("status") is not False


@dataclass
class ContactAgg:
    contact_id: int
    first_name: str = ""
    last_name: str = ""
    phone: str = ""
    by_type: dict[str, float] = field(default_factory=lambda: defaultdict(float))
    counts: dict[str, int] = field(default_factory=lambda: defaultdict(int))

    @property
    def sell_deferred(self) -> float:
        return self.by_type.get("sellDeferred", 0.0)

    @property
    def sell_covered(self) -> float:
        return self.by_type.get("sellCovered", 0.0)

    @property
    def spend_deferred(self) -> float:
        return self.by_type.get("spendDeferred", 0.0)

    @property
    def spend_covered(self) -> float:
        return self.by_type.get("spendCovered", 0.0)

    @property
    def wage(self) -> float:
        return self.by_type.get("wage", 0.0)

    @property
    def balance(self) -> float:
        client = self.sell_covered - self.sell_deferred
        supplier = self.spend_covered - self.spend_deferred
        return client - supplier - self.wage


def compute(rows: list[dict[str, Any]], contact_id: int | None = None) -> list[ContactAgg]:
    aggs: dict[int, ContactAgg] = {}
    for wrap in rows:
        if not is_active(wrap):
            continue
        ticket = wrap.get("ticket") or {}
        cid = ticket.get("contactId")
        if cid is None:
            continue
        cid = int(cid)
        if contact_id is not None and cid != contact_id:
            continue

        agg = aggs.get(cid)
        if agg is None:
            agg = ContactAgg(
                contact_id=cid,
                first_name=str(ticket.get("contactFirstName") or ""),
                last_name=str(ticket.get("contactLastName") or ""),
                phone=str(ticket.get("contactPhone") or ""),
            )
            aggs[cid] = agg

        ttype = str(ticket.get("ticketType") or "unknown")
        amount = ticket_total(ticket)
        agg.by_type[ttype] += amount
        agg.counts[ttype] += 1

    return sorted(aggs.values(), key=lambda a: a.contact_id)


def _fmt(n: float) -> str:
    # Prices in this export are often in smallest currency units (e.g. GNF).
    if abs(n - round(n)) < 1e-9:
        return f"{int(round(n)):,}"
    return f"{n:,.4f}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "json_path",
        nargs="?",
        default=str(Path(__file__).with_name("prd.ticket.json")),
        help="Path to ticket export JSON (default: scripts/prd.ticket.json)",
    )
    parser.add_argument("--contact-id", type=int, default=None, help="Filter one contactId")
    parser.add_argument("--detail", action="store_true", help="Print every contributing ticket")
    args = parser.parse_args()

    path = Path(args.json_path)
    rows = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(rows, list):
        print("Expected a JSON array of ticket wrappers", file=sys.stderr)
        return 1

    if args.detail:
        print(f"{'id':>6}  {'type':<14}  {'status':<6}  {'amount':>14}  contact")
        for wrap in rows:
            ticket = wrap.get("ticket") or {}
            if args.contact_id is not None and int(ticket.get("contactId") or -1) != args.contact_id:
                continue
            active = is_active(wrap)
            amount = ticket_total(ticket) if active else 0.0
            flag = "OK" if active else "SKIP"
            print(
                f"{ticket.get('id', '?'):>6}  {str(ticket.get('ticketType')):<14}  "
                f"{flag:<6}  {_fmt(amount):>14}  {ticket.get('contactId')}"
            )
        print()

    aggs = compute(rows, contact_id=args.contact_id)
    if not aggs:
        print("No active tickets found.")
        return 0

    for a in aggs:
        name = f"{a.first_name} {a.last_name}".strip() or "(no name)"
        print(f"contactId={a.contact_id}  {name}  {a.phone}")
        print(f"  sellCovered    ({a.counts.get('sellCovered', 0):3d})  {_fmt(a.sell_covered)}")
        print(f"  sellDeferred   ({a.counts.get('sellDeferred', 0):3d})  {_fmt(a.sell_deferred)}")
        print(f"  spendCovered   ({a.counts.get('spendCovered', 0):3d})  {_fmt(a.spend_covered)}")
        print(f"  spendDeferred  ({a.counts.get('spendDeferred', 0):3d})  {_fmt(a.spend_deferred)}")
        print(f"  wage           ({a.counts.get('wage', 0):3d})  {_fmt(a.wage)}")
        print(
            "  balance = (sellCovered - sellDeferred)"
            " - (spendCovered - spendDeferred) - wage"
        )
        print(f"  BALANCE        {_fmt(a.balance)}")
        print()

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
