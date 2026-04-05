import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/extensions/build_context_extension.dart';

void main() {
  final theme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
    ),
  );

  Widget buildTestApp(Widget child) => MaterialApp(
        theme: theme,
        home: Scaffold(body: child),
      );

  group('BuildContextThemeExtension', () {
    testWidgets('theme returns current ThemeData', (tester) async {
      late ThemeData capturedTheme;

      await tester.pumpWidget(buildTestApp(Builder(builder: (context) {
        capturedTheme = context.theme;
        return const SizedBox();
      })));

      expect(capturedTheme, isNotNull);
    });

    testWidgets('colorScheme returns theme colorScheme', (tester) async {
      late ColorScheme capturedScheme;

      await tester.pumpWidget(buildTestApp(Builder(builder: (context) {
        capturedScheme = context.colorScheme;
        return const SizedBox();
      })));

      expect(capturedScheme.primary, Colors.blue);
    });

    testWidgets('primaryColor returns colorScheme.primary', (tester) async {
      late Color capturedColor;

      await tester.pumpWidget(buildTestApp(Builder(builder: (context) {
        capturedColor = context.primaryColor;
        return const SizedBox();
      })));

      expect(capturedColor, Colors.blue);
    });

    testWidgets('onPrimaryColor returns colorScheme.onPrimary', (tester) async {
      late Color capturedColor;

      await tester.pumpWidget(buildTestApp(Builder(builder: (context) {
        capturedColor = context.onPrimaryColor;
        return const SizedBox();
      })));

      expect(capturedColor, Colors.white);
    });

    testWidgets('errorColor returns colorScheme.error', (tester) async {
      late Color capturedError;
      late Color schemeError;

      await tester.pumpWidget(buildTestApp(Builder(builder: (context) {
        capturedError = context.errorColor;
        schemeError = context.colorScheme.error;
        return const SizedBox();
      })));

      expect(capturedError, schemeError);
    });
  });
}
