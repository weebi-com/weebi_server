import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:test/test.dart';

/// Unit tests for Chain proto parsing (mergeFromProto3Json).
/// Validates the round-trip used by _chainsMongoToChainsProto.
void main() {
  test('Chain mergeFromProto3Json round-trip', () {
    final chainMongo = Dummy.chain.toProto3Json() as Map<String, dynamic>;
    final chain = Chain.create()
      ..mergeFromProto3Json(chainMongo, ignoreUnknownFields: true);

    expect(chain.chainId, Dummy.chain.chainId);
    expect(chain.firmId, Dummy.chain.firmId);
    expect(chain.name, Dummy.chain.name);
    expect(chain.boutiques.length, Dummy.chain.boutiques.length);
    expect(chain.boutiques.first.boutiqueId, Dummy.chain.boutiques.first.boutiqueId);
    expect(chain.boutiques.first.boutique.boutiqueId,
        Dummy.chain.boutiques.first.boutique.boutiqueId);
    expect(chain.boutiques.first.boutique.name,
        Dummy.chain.boutiques.first.boutique.name);
  });
}
