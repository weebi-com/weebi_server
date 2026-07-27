/// ISO 3166-1 alpha-2 → alpha-3 for PawaPay checkout `country` fields.
///
/// Weebi stores [Country.code2Letters] (alpha-2). PawaPay expects alpha-3.
/// Focused on Africa, with OHADA / WAEMU / CEMAC members complete.
const Map<String, String> kIso3166Alpha2ToAlpha3Africa = {
  // OHADA / WAEMU (XOF)
  'BJ': 'BEN',
  'BF': 'BFA',
  'CI': 'CIV',
  'GW': 'GNB',
  'ML': 'MLI',
  'NE': 'NER',
  'SN': 'SEN',
  'TG': 'TGO',
  // OHADA / CEMAC (XAF)
  'CM': 'CMR',
  'CF': 'CAF',
  'TD': 'TCD',
  'CG': 'COG',
  'GQ': 'GNQ',
  'GA': 'GAB',
  // OHADA other
  'GN': 'GIN',
  'KM': 'COM',
  'CD': 'COD',
  // Broader Africa (common PawaPay corridors)
  'AO': 'AGO',
  'BW': 'BWA',
  'CV': 'CPV',
  'DJ': 'DJI',
  'EG': 'EGY',
  'ET': 'ETH',
  'GH': 'GHA',
  'KE': 'KEN',
  'LR': 'LBR',
  'LS': 'LSO',
  'MG': 'MDG',
  'MW': 'MWI',
  'MA': 'MAR',
  'MR': 'MRT',
  'MU': 'MUS',
  'MZ': 'MOZ',
  'NA': 'NAM',
  'NG': 'NGA',
  'RW': 'RWA',
  'ST': 'STP',
  'SC': 'SYC',
  'SL': 'SLE',
  'SO': 'SOM',
  'ZA': 'ZAF',
  'SS': 'SSD',
  'SD': 'SDN',
  'TZ': 'TZA',
  'UG': 'UGA',
  'ZM': 'ZMB',
  'ZW': 'ZWE',
};

/// ISO 4217 currencies we can price for v1 licence checkouts (FCFA list prices).
const Set<String> kPawapayFcfaCurrencies = {'XOF', 'XAF'};

/// PawaPay currency for an alpha-3 country code (OHADA FCFA + a few others).
String? pawapayCurrencyForCountryIso3(String countryIso3) {
  switch (countryIso3.trim().toUpperCase()) {
    case 'BEN':
    case 'BFA':
    case 'CIV':
    case 'GNB':
    case 'MLI':
    case 'NER':
    case 'SEN':
    case 'TGO':
      return 'XOF';
    case 'CMR':
    case 'CAF':
    case 'TCD':
    case 'COG':
    case 'GNQ':
    case 'GAB':
      return 'XAF';
    case 'GIN':
      return 'GNF';
    case 'COM':
      return 'KMF';
    case 'COD':
      return 'CDF';
    case 'GHA':
      return 'GHS';
    case 'NGA':
      return 'NGN';
    case 'KEN':
      return 'KES';
    case 'RWA':
      return 'RWF';
    case 'UGA':
      return 'UGX';
    case 'TZA':
      return 'TZS';
    case 'ZMB':
      return 'ZMW';
    case 'MWI':
      return 'MWK';
    case 'MOZ':
      return 'MZN';
    case 'AGO':
      return 'AOA';
    case 'ZAF':
      return 'ZAR';
    case 'EGY':
      return 'EGP';
    case 'MAR':
      return 'MAD';
    default:
      return null;
  }
}

/// Converts Weebi alpha-2 to PawaPay alpha-3, or null if unknown / unsupported map.
String? iso2ToIso3Africa(String? alpha2) {
  final code = alpha2?.trim().toUpperCase() ?? '';
  if (code.isEmpty) return null;
  if (code.length == 3) {
    // Already alpha-3 (or mistaken); accept if we know a currency for it.
    return pawapayCurrencyForCountryIso3(code) != null ? code : null;
  }
  if (code.length != 2) return null;
  return kIso3166Alpha2ToAlpha3Africa[code];
}

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
    final btqs = boutiques.whereType<Map>().map((e) => Map<dynamic, dynamic>.from(e)).toList();
    btqs.sort((a, b) {
      final idA = a['boutiqueId']?.toString() ??
          (a['boutique'] is Map ? (a['boutique'] as Map)['boutiqueId']?.toString() : null);
      final idB = b['boutiqueId']?.toString() ??
          (b['boutique'] is Map ? (b['boutique'] as Map)['boutiqueId']?.toString() : null);
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
