import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/foundation/theme/sintia_theme_config.dart';
import 'package:sintia_system_design/foundation/theme/sintia_themes.dart';

void main() {
  const config = SintiaThemeConfig(
    primaryColor: Colors.blue,
    secondaryColor: Colors.indigo,
    primaryFont: 'Montserrat',
    secondaryFont: 'OpenSans',
  );

  group('SintiaTheme.light', () {
    test('returns a ThemeData with light brightness', () {
      final theme = SintiaTheme.light(config);
      expect(theme.brightness, Brightness.light);
    });

    test('applies primary and secondary colors', () {
      final theme = SintiaTheme.light(config);
      expect(theme.colorScheme.primary, Colors.blue);
      expect(theme.colorScheme.secondary, Colors.indigo);
    });

    test('text theme uses primary font for displayLarge', () {
      final theme = SintiaTheme.light(config);
      expect(theme.textTheme.displayLarge?.fontFamily, 'Montserrat');
    });

    test('text theme uses secondary font for bodyLarge', () {
      final theme = SintiaTheme.light(config);
      expect(theme.textTheme.bodyLarge?.fontFamily, 'OpenSans');
    });
  });

  group('SintiaTheme.dark', () {
    test('returns a ThemeData with dark brightness', () {
      final theme = SintiaTheme.dark(config);
      expect(theme.brightness, Brightness.dark);
    });

    test('applies primary and secondary colors', () {
      final theme = SintiaTheme.dark(config);
      expect(theme.colorScheme.primary, Colors.blue);
      expect(theme.colorScheme.secondary, Colors.indigo);
    });

    test('text theme uses primary font for displayLarge', () {
      final theme = SintiaTheme.dark(config);
      expect(theme.textTheme.displayLarge?.fontFamily, 'Montserrat');
    });
  });
}
