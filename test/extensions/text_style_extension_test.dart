import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/extensions/text_style_extension.dart';

void main() {
  const baseStyle = TextStyle(fontSize: 16);

  Widget buildTestApp({
    required Widget child,
    Color primary = Colors.blue,
    Color secondary = Colors.green,
  }) =>
      MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: primary,
            secondary: secondary,
          ),
        ),
        home: Scaffold(body: child),
      );

  group('AppTextStyleExtension', () {
    testWidgets('primary() applies colorScheme.primary color', (tester) async {
      late TextStyle result;

      await tester.pumpWidget(buildTestApp(
        primary: Colors.blue,
        child: Builder(builder: (context) {
          result = baseStyle.primary(context);
          return const SizedBox();
        }),
      ));

      expect(result.color, Colors.blue);
    });

    testWidgets('secondary() applies colorScheme.secondary color', (tester) async {
      late TextStyle result;

      await tester.pumpWidget(buildTestApp(
        secondary: Colors.green,
        child: Builder(builder: (context) {
          result = baseStyle.secondary(context);
          return const SizedBox();
        }),
      ));

      expect(result.color, Colors.green);
    });

    test('withColor() applies the given color', () {
      final result = baseStyle.withColor(Colors.red);
      expect(result.color, Colors.red);
    });

    test('withColor() preserves other style properties', () {
      final result = baseStyle.withColor(Colors.red);
      expect(result.fontSize, 16);
    });
  });
}
