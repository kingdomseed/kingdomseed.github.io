/// Certification model for the MCP-2099 Portfolio
class Certification {
  final String id;
  final String name;
  final String issuer;
  final String category; // Cloud, Mobile, Dev Tools, Adobe Creative Suite
  final DateTime issueDate;
  final DateTime? expiryDate;
  final String? credentialId;
  final String? credentialUrl;
  final String? iconAsset;
  final List<String>? skills;

  const Certification({
    required this.id,
    required this.name,
    required this.issuer,
    required this.category,
    required this.issueDate,
    this.expiryDate,
    this.credentialId,
    this.credentialUrl,
    this.iconAsset,
    this.skills,
  });

  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());

  bool get isValid => expiryDate == null || expiryDate!.isAfter(DateTime.now());

  String get formattedIssueDate => _formatDate(issueDate);

  String? get formattedExpiryDate =>
      expiryDate != null ? _formatDate(expiryDate!) : null;

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Certification copyWith({
    String? id,
    String? name,
    String? issuer,
    String? category,
    DateTime? issueDate,
    DateTime? expiryDate,
    String? credentialId,
    String? credentialUrl,
    String? iconAsset,
    List<String>? skills,
  }) {
    return Certification(
      id: id ?? this.id,
      name: name ?? this.name,
      issuer: issuer ?? this.issuer,
      category: category ?? this.category,
      issueDate: issueDate ?? this.issueDate,
      expiryDate: expiryDate ?? this.expiryDate,
      credentialId: credentialId ?? this.credentialId,
      credentialUrl: credentialUrl ?? this.credentialUrl,
      iconAsset: iconAsset ?? this.iconAsset,
      skills: skills ?? this.skills,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Certification &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
