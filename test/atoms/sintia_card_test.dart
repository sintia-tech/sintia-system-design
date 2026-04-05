import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/sintia_card.dart';
import 'package:sintia_system_design/tokens/sizes.dart';

void main() {
  Widget buildTestApp(Widget child) => MaterialApp(
        home: Scaffold(body: child),
      );

  group('SintiaCard', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaCard(child: Text('Content')),
      ));

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('applies default padding', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaCard(child: SizedBox()),
      ));

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding, const EdgeInsets.all(SintiaSizes.size1));
    });

    testWidgets('applies custom padding', (tester) async {
      const customPadding = EdgeInsets.all(20);

      await tester.pumpWidget(buildTestApp(
        const SintiaCard(padding: customPadding, child: SizedBox()),
      ));

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding, customPadding);
    });

    testWidgets('has BoxDecoration with rounded corners', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaCard(child: SizedBox()),
      ));

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(SintiaSizes.radius1));
    });

    testWidgets('has a border', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaCard(child: SizedBox()),
      ));

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
    });
  });
}
