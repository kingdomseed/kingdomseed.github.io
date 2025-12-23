/// Project model for the MCP-2099 Portfolio
class Project {
  final String id;
  final String name;
  final String description;
  final String category; // Mobile, EdTech, Tool
  final List<String> techStack;
  final String? iconAsset;
  final List<String>? screenshots;
  final double? rating;
  final Map<String, dynamic>? stats; // e.g., {"platforms": 5, "retention": 0.85}
  final String? externalLink;
  final List<String>? achievements;

  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.techStack,
    this.iconAsset,
    this.screenshots,
    this.rating,
    this.stats,
    this.externalLink,
    this.achievements,
  });

  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    List<String>? techStack,
    String? iconAsset,
    List<String>? screenshots,
    double? rating,
    Map<String, dynamic>? stats,
    String? externalLink,
    List<String>? achievements,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      techStack: techStack ?? this.techStack,
      iconAsset: iconAsset ?? this.iconAsset,
      screenshots: screenshots ?? this.screenshots,
      rating: rating ?? this.rating,
      stats: stats ?? this.stats,
      externalLink: externalLink ?? this.externalLink,
      achievements: achievements ?? this.achievements,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Project && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
