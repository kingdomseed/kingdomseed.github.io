// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Repository provider

@ProviderFor(portfolioRepository)
const portfolioRepositoryProvider = PortfolioRepositoryProvider._();

/// Repository provider

final class PortfolioRepositoryProvider
    extends
        $FunctionalProvider<
          PortfolioRepository,
          PortfolioRepository,
          PortfolioRepository
        >
    with $Provider<PortfolioRepository> {
  /// Repository provider
  const PortfolioRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portfolioRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portfolioRepositoryHash();

  @$internal
  @override
  $ProviderElement<PortfolioRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PortfolioRepository create(Ref ref) {
    return portfolioRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PortfolioRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PortfolioRepository>(value),
    );
  }
}

String _$portfolioRepositoryHash() =>
    r'e4a4e4241f3ead78c3fb7ee2d5c7eae713134808';

/// All projects provider

@ProviderFor(projects)
const projectsProvider = ProjectsProvider._();

/// All projects provider

final class ProjectsProvider
    extends $FunctionalProvider<List<Project>, List<Project>, List<Project>>
    with $Provider<List<Project>> {
  /// All projects provider
  const ProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectsHash();

  @$internal
  @override
  $ProviderElement<List<Project>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Project> create(Ref ref) {
    return projects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Project> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Project>>(value),
    );
  }
}

String _$projectsHash() => r'c2b072922f349a1b0e7fb0016b7602e71ca25fc8';

/// Project filter state provider

@ProviderFor(ProjectFilter)
const projectFilterProvider = ProjectFilterProvider._();

/// Project filter state provider
final class ProjectFilterProvider
    extends $NotifierProvider<ProjectFilter, String> {
  /// Project filter state provider
  const ProjectFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectFilterHash();

  @$internal
  @override
  ProjectFilter create() => ProjectFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$projectFilterHash() => r'bee08f34db44ea96fb94cc97f71579c35bb3dadf';

/// Project filter state provider

abstract class _$ProjectFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Filtered projects provider

@ProviderFor(filteredProjects)
const filteredProjectsProvider = FilteredProjectsProvider._();

/// Filtered projects provider

final class FilteredProjectsProvider
    extends $FunctionalProvider<List<Project>, List<Project>, List<Project>>
    with $Provider<List<Project>> {
  /// Filtered projects provider
  const FilteredProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredProjectsHash();

  @$internal
  @override
  $ProviderElement<List<Project>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Project> create(Ref ref) {
    return filteredProjects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Project> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Project>>(value),
    );
  }
}

String _$filteredProjectsHash() => r'377076723f86a50fa7c4b91be98aba43c4cb0320';

/// Project categories provider

@ProviderFor(projectCategories)
const projectCategoriesProvider = ProjectCategoriesProvider._();

/// Project categories provider

final class ProjectCategoriesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  /// Project categories provider
  const ProjectCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return projectCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$projectCategoriesHash() => r'b71793703f437d4848b66fe43f325aba8c20add5';

/// All skills provider

@ProviderFor(skills)
const skillsProvider = SkillsProvider._();

/// All skills provider

final class SkillsProvider
    extends $FunctionalProvider<List<Skill>, List<Skill>, List<Skill>>
    with $Provider<List<Skill>> {
  /// All skills provider
  const SkillsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skillsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skillsHash();

  @$internal
  @override
  $ProviderElement<List<Skill>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Skill> create(Ref ref) {
    return skills(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Skill> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Skill>>(value),
    );
  }
}

String _$skillsHash() => r'5304682502cd32ffd6db490f08780e210a8d7249';

/// All experiences provider

@ProviderFor(experiences)
const experiencesProvider = ExperiencesProvider._();

/// All experiences provider

final class ExperiencesProvider
    extends
        $FunctionalProvider<
          List<Experience>,
          List<Experience>,
          List<Experience>
        >
    with $Provider<List<Experience>> {
  /// All experiences provider
  const ExperiencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'experiencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$experiencesHash();

  @$internal
  @override
  $ProviderElement<List<Experience>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Experience> create(Ref ref) {
    return experiences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Experience> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Experience>>(value),
    );
  }
}

String _$experiencesHash() => r'8c7c2deb9865d3cd7027dfcc572683b29eb205a6';

/// All certifications provider

@ProviderFor(certifications)
const certificationsProvider = CertificationsProvider._();

/// All certifications provider

final class CertificationsProvider
    extends
        $FunctionalProvider<
          List<Certification>,
          List<Certification>,
          List<Certification>
        >
    with $Provider<List<Certification>> {
  /// All certifications provider
  const CertificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificationsHash();

  @$internal
  @override
  $ProviderElement<List<Certification>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Certification> create(Ref ref) {
    return certifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Certification> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Certification>>(value),
    );
  }
}

String _$certificationsHash() => r'e7dd5a113ec6b34f1b81133e7b71e23db4fc4b02';

/// Certification filter state provider

@ProviderFor(CertificationFilter)
const certificationFilterProvider = CertificationFilterProvider._();

/// Certification filter state provider
final class CertificationFilterProvider
    extends $NotifierProvider<CertificationFilter, String> {
  /// Certification filter state provider
  const CertificationFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificationFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificationFilterHash();

  @$internal
  @override
  CertificationFilter create() => CertificationFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$certificationFilterHash() =>
    r'902841d5c02284219bb53b06a688bb08f754f731';

/// Certification filter state provider

abstract class _$CertificationFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Filtered certifications provider

@ProviderFor(filteredCertifications)
const filteredCertificationsProvider = FilteredCertificationsProvider._();

/// Filtered certifications provider

final class FilteredCertificationsProvider
    extends
        $FunctionalProvider<
          List<Certification>,
          List<Certification>,
          List<Certification>
        >
    with $Provider<List<Certification>> {
  /// Filtered certifications provider
  const FilteredCertificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredCertificationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredCertificationsHash();

  @$internal
  @override
  $ProviderElement<List<Certification>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Certification> create(Ref ref) {
    return filteredCertifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Certification> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Certification>>(value),
    );
  }
}

String _$filteredCertificationsHash() =>
    r'27b8a44b718c0991727963c9b72cd566aaead8ae';

/// Certification categories provider

@ProviderFor(certificationCategories)
const certificationCategoriesProvider = CertificationCategoriesProvider._();

/// Certification categories provider

final class CertificationCategoriesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  /// Certification categories provider
  const CertificationCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificationCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificationCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return certificationCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$certificationCategoriesHash() =>
    r'97b1ecf6ff29fb02851e56b61417ee280ea20758';
