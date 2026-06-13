# Charts Service

A service for generating SVG charts for Weebi.

This package was rebranded from `weebi_charts` to `charts_service` as part of its integration into the `weebi_server` monorepo.

## Purpose

- Aggregates financial data (tickets) from MongoDB.
- Renders SVG charts using `d4` packages.
- Supports various financial metrics (income, spending, cashflow) and time granularities (day, week, month).

## Integration

Used by the `stats_service` gRPC service to deliver charts to clients.

## Development

To run tests:
```bash
dart test
```

To run the sample application:
```bash
dart bin/main.dart
```
