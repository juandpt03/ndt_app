import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/config/config.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});
//Controller o Notifier

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme()) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = AppTheme().isDark;
    final colorSchemeSeed = AppTheme().colorSchemeSeed;
    state = state.copyWith(
      isDark: isDark,
      colorSchemeSeed: colorSchemeSeed,
    );
  }

  Future<void> toggleDarkMode() async {
    state = state.copyWith(
      isDark: !state.isDark,
    );
  }

  // Future<void> toggleTheme( color) async {}
}
