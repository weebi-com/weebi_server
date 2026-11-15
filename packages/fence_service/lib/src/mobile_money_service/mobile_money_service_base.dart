import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/grpc.dart' show ServiceCall;
import 'package:protos_weebi/protos_weebi_io.dart';

/// Global mobile-money operator catalog. Not chain-scoped.
class MobileMoneyService extends MobileMoneyServiceBase {
  final MongoDbPoolService _poolService;

  static const String collectionName = 'mobile_money_operator';

  MobileMoneyService(this._poolService);

  @override
  Future<ListMobileMoneyOperatorsResponse> listOperators(
    ServiceCall? call,
    ListMobileMoneyOperatorsRequest request,
  ) {
    return databaseMiddleware<ListMobileMoneyOperatorsResponse>(
      _poolService,
      (db) async {
        final collection = db.collection(collectionName);
        final docs = await collection.find(where.eq('active', true)).toList();
        final country = request.countryCode.trim().toUpperCase();
        final filtered = docs.where((doc) {
          final codes = _countryCodesOf(doc);
          if (codes.isEmpty) return true; // global
          if (country.isEmpty) return false;
          return codes.contains(country);
        }).toList();

        final response = ListMobileMoneyOperatorsResponse();
        for (final doc in filtered) {
          final json = Map<String, dynamic>.from(doc)..remove('_id');
          // Proto3 JSON expects base64 for bytes; strip raw BSON blobs.
          final logo = json['logo'];
          if (logo != null && logo is! String) {
            json['logo'] = '';
          }
          // Tolerate legacy singular countryCode until data is migrated.
          if (json['countryCodes'] == null && json['countryCode'] != null) {
            final legacy = '${json['countryCode']}'.trim();
            json['countryCodes'] = legacy.isEmpty ? <String>[] : [legacy];
            json.remove('countryCode');
          }
          final op = MobileMoneyOperatorPb()
            ..mergeFromProto3Json(json, ignoreUnknownFields: true);
          response.operators.add(op);
        }
        return response;
      },
    );
  }

  /// Empty list = global. Accepts `countryCodes` or legacy `countryCode`.
  static List<String> _countryCodesOf(Map<String, dynamic> doc) {
    final raw = doc['countryCodes'];
    if (raw is List) {
      return raw
          .map((e) => '$e'.trim().toUpperCase())
          .where((e) => e.isNotEmpty)
          .toList();
    }
    final legacy = (doc['countryCode'] as String? ?? '').trim().toUpperCase();
    if (legacy.isEmpty) return const [];
    return [legacy];
  }
}
