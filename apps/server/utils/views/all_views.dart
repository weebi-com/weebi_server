import 'boutique_user.dart';
import 'view_definition.dart';

/// All MongoDB views to be created by the indexes setup script.
/// Add new views here after defining them in their own file.
final List<ViewDefinition> allViews = [
  boutiqueUserView,
];
