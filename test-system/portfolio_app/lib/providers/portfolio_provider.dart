import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/models.dart';
import '../data/repositories/portfolio_repository.dart';

part 'portfolio_provider.g.dart';

/// Repository provider
@Riverpod(keepAlive: true)
PortfolioRepository portfolioRepository(Ref ref) {
  return PortfolioRepository();
}

// ============================================
// PROJECTS PROVIDERS
// ============================================

/// All projects provider
@riverpod
List<Project> projects(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getProjects();
}

/// Project filter state provider
@riverpod
class ProjectFilter extends _$ProjectFilter {
  @override
  String build() => 'All';

  void setFilter(String filter) => state = filter;
}

/// Filtered projects provider
@riverpod
List<Project> filteredProjects(Ref ref) {
  final filter = ref.watch(projectFilterProvider);
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getProjectsByCategory(filter);
}

/// Project categories provider
@riverpod
List<String> projectCategories(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getProjectCategories();
}

// ============================================
// SKILLS PROVIDERS
// ============================================

/// All skills provider
@riverpod
List<Skill> skills(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getSkills();
}

// ============================================
// EXPERIENCE PROVIDERS
// ============================================

/// All experiences provider
@riverpod
List<Experience> experiences(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getExperiences();
}

// ============================================
// CERTIFICATIONS PROVIDERS
// ============================================

/// All certifications provider
@riverpod
List<Certification> certifications(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getCertifications();
}

/// Certification filter state provider
@riverpod
class CertificationFilter extends _$CertificationFilter {
  @override
  String build() => 'All';

  void setFilter(String filter) => state = filter;
}

/// Filtered certifications provider
@riverpod
List<Certification> filteredCertifications(Ref ref) {
  final filter = ref.watch(certificationFilterProvider);
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getCertificationsByCategory(filter);
}

/// Certification categories provider
@riverpod
List<String> certificationCategories(Ref ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getCertificationCategories();
}
