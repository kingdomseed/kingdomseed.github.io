import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

/// Current navigation index provider for bottom navigation
@riverpod
class NavigationIndex extends _$NavigationIndex {
  @override
  int build() => 0; // Home screen index

  void setIndex(int index) => state = index;
}

/// Navigation routes
enum AppRoute {
  home('/'),
  skills('/skills'),
  projects('/projects'),
  experience('/experience'),
  certifications('/certifications'),
  contact('/contact');

  const AppRoute(this.path);
  final String path;
}
