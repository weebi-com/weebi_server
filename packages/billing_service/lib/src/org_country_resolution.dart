/// Weebi firm / chain / boutique Mongo helpers for resolving ISO 3166-1 alpha-2.
///
/// ISO country ↔ currency tables live in `package:country_currency_iso`.
library org_country_resolution;

String? _alpha2FromCountryNode(dynamic country) {
  if (country is! Map) return null;
  final raw = country['code2Letters']?.toString().trim() ?? '';
  if (raw.length == 2) return raw.toUpperCase();
  return null;
}

String? _alpha2FromAddressFull(dynamic addressFull) {
  if (addressFull is! Map) return null;
  return _alpha2FromCountryNode(addressFull['country']);
}

/// Reads optional country on a firm/chain-shaped Mongo document.
String? countryAlpha2FromOrgDoc(Map<String, dynamic>? doc) {
  if (doc == null) return null;
  return _alpha2FromCountryNode(doc['country']) ??
      _alpha2FromAddressFull(doc['addressFull']);
}

/// BoutiqueMongo / nested boutique country (alpha-2).
String? countryAlpha2FromBoutiqueMongo(Map<dynamic, dynamic>? boutiqueMongo) {
  if (boutiqueMongo == null) return null;
  final nested = boutiqueMongo['boutique'];
  if (nested is Map) {
    final fromNested = _alpha2FromAddressFull(nested['addressFull']);
    if (fromNested != null) return fromNested;
  }
  return _alpha2FromAddressFull(boutiqueMongo['addressFull']);
}

/// Boutique / chain / firm currency hint used when address country is missing.
///
/// DRC shops may store ISO 4217 `CDF` or the country code `CD` in the currency field.
bool isDrcCurrencyHint(dynamic raw) {
  final u = raw?.toString().trim().toUpperCase() ?? '';
  return u == 'CDF' || u == 'CD';
}

String? _currencyFromMap(Map<dynamic, dynamic>? doc) {
  if (doc == null) return null;
  final raw = doc['currency']?.toString().trim() ?? '';
  return raw.isEmpty ? null : raw;
}

String? currencyFromBoutiqueMongo(Map<dynamic, dynamic>? boutiqueMongo) {
  if (boutiqueMongo == null) return null;
  final nested = boutiqueMongo['boutique'];
  if (nested is Map) {
    final fromNested = _currencyFromMap(Map<dynamic, dynamic>.from(nested));
    if (fromNested != null) return fromNested;
  }
  return _currencyFromMap(boutiqueMongo);
}

int _preferIdRank(String? id, List<String> preferred) {
  if (id == null || id.isEmpty || preferred.isEmpty) return 1;
  return preferred.contains(id) ? 0 : 1;
}

/// Firm → chain → boutique waterfall (first non-empty alpha-2 wins).
///
/// Today only boutiques store [addressFull.country.code2Letters]; firm/chain
/// country fields are read if present for forward compatibility.
String? resolveOrgCountryAlpha2({
  Map<String, dynamic>? firmDoc,
  required Iterable<Map<String, dynamic>> chainDocs,
  List<String> preferredChainIds = const [],
  List<String> preferredBoutiqueIds = const [],
}) {
  final firmCountry = countryAlpha2FromOrgDoc(firmDoc);
  if (firmCountry != null) return firmCountry;

  final chains = chainDocs.toList();
  chains.sort((a, b) {
    final ra = _preferIdRank(a['chainId']?.toString(), preferredChainIds);
    final rb = _preferIdRank(b['chainId']?.toString(), preferredChainIds);
    return ra.compareTo(rb);
  });

  for (final chain in chains) {
    final chainCountry = countryAlpha2FromOrgDoc(chain);
    if (chainCountry != null) return chainCountry;

    final boutiques = chain['boutiques'];
    if (boutiques is! List) continue;
    final btqs =
        boutiques.whereType<Map>().map((e) => Map<dynamic, dynamic>.from(e)).toList();
    btqs.sort((a, b) {
      final idA = a['boutiqueId']?.toString() ??
          (a['boutique'] is Map
              ? (a['boutique'] as Map)['boutiqueId']?.toString()
              : null);
      final idB = b['boutiqueId']?.toString() ??
          (b['boutique'] is Map
              ? (b['boutique'] as Map)['boutiqueId']?.toString()
              : null);
      return _preferIdRank(idA, preferredBoutiqueIds)
          .compareTo(_preferIdRank(idB, preferredBoutiqueIds));
    });
    for (final b in btqs) {
      final code = countryAlpha2FromBoutiqueMongo(b);
      if (code != null) return code;
    }
  }
  return null;
}

/// Same waterfall as [resolveOrgCountryAlpha2], then DRC from currency `CDF` / `CD`.
String? resolveOrgPawapayCountryAlpha2({
  Map<String, dynamic>? firmDoc,
  required Iterable<Map<String, dynamic>> chainDocs,
  List<String> preferredChainIds = const [],
  List<String> preferredBoutiqueIds = const [],
}) {
  final fromAddress = resolveOrgCountryAlpha2(
    firmDoc: firmDoc,
    chainDocs: chainDocs,
    preferredChainIds: preferredChainIds,
    preferredBoutiqueIds: preferredBoutiqueIds,
  );
  if (fromAddress != null) return fromAddress;
  return inferDrcCountryFromOrgCurrency(
    firmDoc: firmDoc,
    chainDocs: chainDocs,
    preferredChainIds: preferredChainIds,
    preferredBoutiqueIds: preferredBoutiqueIds,
  );
}

/// When address country is missing, treat boutique/chain/firm currency CDF or CD as DRC.
String? inferDrcCountryFromOrgCurrency({
  Map<String, dynamic>? firmDoc,
  required Iterable<Map<String, dynamic>> chainDocs,
  List<String> preferredChainIds = const [],
  List<String> preferredBoutiqueIds = const [],
}) {
  if (isDrcCurrencyHint(firmDoc?['currency'])) return 'CD';

  final chains = chainDocs.toList();
  chains.sort((a, b) {
    final ra = _preferIdRank(a['chainId']?.toString(), preferredChainIds);
    final rb = _preferIdRank(b['chainId']?.toString(), preferredChainIds);
    return ra.compareTo(rb);
  });

  for (final chain in chains) {
    if (isDrcCurrencyHint(chain['currency'])) return 'CD';

    final boutiques = chain['boutiques'];
    if (boutiques is! List) continue;
    final btqs =
        boutiques.whereType<Map>().map((e) => Map<dynamic, dynamic>.from(e)).toList();
    btqs.sort((a, b) {
      final idA = a['boutiqueId']?.toString() ??
          (a['boutique'] is Map
              ? (a['boutique'] as Map)['boutiqueId']?.toString()
              : null);
      final idB = b['boutiqueId']?.toString() ??
          (b['boutique'] is Map
              ? (b['boutique'] as Map)['boutiqueId']?.toString()
              : null);
      return _preferIdRank(idA, preferredBoutiqueIds)
          .compareTo(_preferIdRank(idB, preferredBoutiqueIds));
    });
    for (final b in btqs) {
      if (isDrcCurrencyHint(currencyFromBoutiqueMongo(b))) return 'CD';
    }
  }
  return null;
}

/// Contact fields from the first boutique on a firm's chain documents (ops emails).
class BoutiqueContactMeta {
  final String name;
  final String mail;
  final String phone;

  const BoutiqueContactMeta({
    this.name = '',
    this.mail = '',
    this.phone = '',
  });

  bool get isEmpty => name.isEmpty && mail.isEmpty && phone.isEmpty;
}

String _phoneDisplayFromMap(dynamic phone) {
  if (phone is! Map) return '';
  final number = phone['number']?.toString().trim() ?? '';
  if (number.isEmpty) return '';
  final ccRaw = phone['countryCode'];
  final cc = ccRaw is num ? ccRaw.toInt() : int.tryParse('$ccRaw') ?? 0;
  if (cc == 0) return number;
  return '+$cc $number';
}

/// Reads name / mail / phone from the first boutique found on [chainDocs].
BoutiqueContactMeta firstBoutiqueContactFromChains(
  Iterable<Map<String, dynamic>> chainDocs,
) {
  for (final chain in chainDocs) {
    final boutiques = chain['boutiques'];
    if (boutiques is! List || boutiques.isEmpty) continue;
    final first = boutiques.first;
    if (first is! Map) continue;
    final wrapper = Map<String, dynamic>.from(first);
    final nested = wrapper['boutique'];
    final boutique = nested is Map
        ? Map<String, dynamic>.from(nested)
        : <String, dynamic>{};

    final nestedName = boutique['name']?.toString().trim() ?? '';
    final wrapperName = wrapper['name']?.toString().trim() ?? '';
    final name = nestedName.isNotEmpty ? nestedName : wrapperName;
    final mail = boutique['mail']?.toString().trim() ?? '';
    final phone = _phoneDisplayFromMap(boutique['phone']);
    return BoutiqueContactMeta(name: name, mail: mail, phone: phone);
  }
  return const BoutiqueContactMeta();
}
