import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/extensions/sintia_preview.dart';

void main() {
  group('SintiaPreview', () {
    test('constructor sets theme to _themeBuilder', () {
      // ignore: prefer_const_constructors — must avoid const to hit the constructor at runtime
      final preview = SintiaPreview(name: 'Test', group: 'Group');
      expect(preview.theme, isNotNull);
    });

    test('constructor works with all optional parameters', () {
      final preview = SintiaPreview(
        name: 'Test',
        group: 'Group',
        brightness: Brightness.dark,
      );
      expect(preview, isNotNull);
      expect(preview.theme, isNotNull);
    });

    test('theme builder returns non-null PreviewThemeData', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData, isNotNull);
    });

    test('theme builder produces a light material theme', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialLight, isNotNull);
    });

    test('theme builder produces a dark material theme', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialDark, isNotNull);
    });

    test('light theme has correct brightness', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialLight?.brightness, Brightness.light);
    });

    test('dark theme has correct brightness', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialDark?.brightness, Brightness.dark);
    });

    test('light theme uses blue as primary color from preview config', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialLight?.colorScheme.primary, Colors.blue);
    });

    test('dark theme uses blue as primary color from preview config', () {
      final preview = SintiaPreview(name: 'Test');
      final themeData = preview.theme?.call();
      expect(themeData?.materialDark?.colorScheme.primary, Colors.blue);
    });
  });
}
