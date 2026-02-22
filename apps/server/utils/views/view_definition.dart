/// Definition of a MongoDB view to be created by the indexes setup script.
class ViewDefinition {
  final String name;
  final String source;
  final List<Map<String, dynamic>> pipeline;

  const ViewDefinition({
    required this.name,
    required this.source,
    required this.pipeline,
  });
}
