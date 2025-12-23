/// Experience model for the MCP-2099 Portfolio
class Experience {
  final String id;
  final String role;
  final String company;
  final String location;
  final DateTime startDate;
  final DateTime? endDate; // null for current position
  final String description;
  final List<String> responsibilities;
  final List<String> achievements;
  final String? companyLogo;

  const Experience({
    required this.id,
    required this.role,
    required this.company,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.responsibilities,
    required this.achievements,
    this.companyLogo,
  });

  bool get isCurrent => endDate == null;

  String get dateRange {
    final start = _formatDate(startDate);
    final end = endDate != null ? _formatDate(endDate!) : 'Present';
    return '$start - $end';
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Experience copyWith({
    String? id,
    String? role,
    String? company,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    List<String>? responsibilities,
    List<String>? achievements,
    String? companyLogo,
  }) {
    return Experience(
      id: id ?? this.id,
      role: role ?? this.role,
      company: company ?? this.company,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
      companyLogo: companyLogo ?? this.companyLogo,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Experience &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
