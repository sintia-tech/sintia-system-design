import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/sintia_text.dart';

void main() {
  Widget buildTestApp(Widget child) => MaterialApp(
        home: Scaffold(body: child),
      );

  group('SintiaText', () {
    testWidgets('renders the given text', (tester) async {
      await tester.pumpWidget(buildTestApp(const SintiaText('Hello')));
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('applies the given TextStyle', (tester) async {
      const style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
      await tester.pumpWidget(buildTestApp(const SintiaText('Hello', style: style)));

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, 24);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies textAlign', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const SintiaText('Hello', textAlign: TextAlign.center)),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('applies maxLines and overflow', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaText(
          'Long text',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ));

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.maxLines, 1);
      expect(text.overflow, TextOverflow.ellipsis);
    });

    testWidgets('renders without optional parameters', (tester) async {
      await tester.pumpWidget(buildTestApp(const SintiaText('Simple')));
      expect(find.text('Simple'), findsOneWidget);
    });
  });
}
