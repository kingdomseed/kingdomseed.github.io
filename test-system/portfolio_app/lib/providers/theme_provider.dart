import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// Theme mode provider for dark/light mode toggle
@riverpod
class ThemeMode extends _$ThemeMode {
  @override
  bool build() => true; // Default to dark mode

  void toggle() => state = !state;

  void setDarkMode() => state = true;

  void setLightMode() => state = false;
}
