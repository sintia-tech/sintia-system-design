import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/foundation/theme/sintia_theme_config.dart';

void main() {
  group('SintiaThemeConfig', () {
    test('stores required fields correctly', () {
      const config = SintiaThemeConfig(
        primaryColor: Colors.blue,
        secondaryColor: Colors.indigo,
        primaryFont: 'Montserrat',
        secondaryFont: 'OpenSans',
      );

      expect(config.primaryColor, Colors.blue);
      expect(config.secondaryColor, Colors.indigo);
      expect(config.primaryFont, 'Montserrat');
      expect(config.secondaryFont, 'OpenSans');
    });

    test('tertiaryFont defaults to null', () {
      const config = SintiaThemeConfig(
        primaryColor: Colors.blue,
        secondaryColor: Colors.indigo,
        primaryFont: 'Montserrat',
        secondaryFont: 'OpenSans',
      );

      expect(config.tertiaryFont, isNull);
    });

    test('tertiaryFont can be set', () {
      const config = SintiaThemeConfig(
        primaryColor: Colors.blue,
        secondaryColor: Colors.indigo,
        primaryFont: 'Montserrat',
        secondaryFont: 'OpenSans',
        tertiaryFont: 'Roboto',
      );

      expect(config.tertiaryFont, 'Roboto');
    });
  });
}
