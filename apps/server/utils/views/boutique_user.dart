import 'package:fence_service/fence_service.dart';

import 'view_definition.dart';

/// View: boutique_user
/// Joins chain/boutique data with user info for reporting.
const ViewDefinition boutiqueUserView = ViewDefinition(
  name: 'boutique_user',
  source: FenceService.boutiqueCollectionName,
  pipeline: [
    {'\$unwind': '\$boutiques'},
    {
      '\$project': {
        'firmId': 1,
        'boutiqueName': '\$boutiques.name',
        'boutiquePhone': {
          '\$concat': [
            '+',
            {'\$toString': '\$boutiques.boutique.phone.countryCode'},
            ' ',
            '\$boutiques.boutique.phone.number'
          ]
        },
        'boutiqueAddress': {
          '\$concat': [
            '\$boutiques.boutique.addressFull.street',
            ' - ',
            '\$boutiques.boutique.addressFull.city',
            ' - ',
            '\$boutiques.boutique.addressFull.country.code2Letters'
          ]
        }
      }
    },
    {
      '\$lookup': {
        'from': 'user',
        'localField': 'firmId',
        'foreignField': 'firmId',
        'as': 'user_info'
      }
    },
    {'\$unwind': '\$user_info'},
    {
      '\$project': {
        'userName': {
          '\$concat': [
            '\$user_info.firstname',
            ' ',
            '\$user_info.lastname'
          ]
        },
        'userMail': '\$user_info.mail',
        'userId': '\$user_info.userId',
        'userFirmId': '\$user_info.firmId',
        'boutiquePhone': 1,
        'boutiqueAddress': 1,
        'boutiqueName': 1
      }
    }
  ],
);
