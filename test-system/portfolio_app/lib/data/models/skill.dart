/// Skill model for the MCP-2099 Portfolio
class Skill {
  final String id;
  final String name;
  final String category;
  final double proficiency; // 0-100
  final List<String> technologies;
  final String? icon;

  const Skill({
    required this.id,
    required this.name,
    required this.category,
    required this.proficiency,
    required this.technologies,
    this.icon,
  });

  Skill copyWith({
    String? id,
    String? name,
    String? category,
    double? proficiency,
    List<String>? technologies,
    String? icon,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      proficiency: proficiency ?? this.proficiency,
      technologies: technologies ?? this.technologies,
      icon: icon ?? this.icon,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Skill && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
