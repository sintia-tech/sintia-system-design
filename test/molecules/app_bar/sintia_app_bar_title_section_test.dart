import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_title.dart';
import 'package:sintia_system_design/molecules/app_bar/sintia_app_bar_title_section.dart';

void main() {
  group('SintiaAppBarTitleSection', () {
    testWidgets('renders SintiaAppBarTitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitleSection(title: 'Pedidos'),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarTitle), findsOneWidget);
      expect(find.text('Pedidos'), findsOneWidget);
    });

    testWidgets('wraps in Align when centerTitle is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitleSection(
              title: 'Pedidos',
              centerTitle: false,
            ),
          ),
        ),
      );

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerLeft);
    });

    testWidgets('does not wrap in Align when centerTitle is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitleSection(
              title: 'Pedidos',
              centerTitle: true,
            ),
          ),
        ),
      );

      expect(find.byType(Align), findsNothing);
    });

    testWidgets('defaults centerTitle to false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitleSection(title: 'Pedidos'),
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    });

    testWidgets('passes prefix, suffix and onTitlePressed to SintiaAppBarTitle', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitleSection(
              title: 'Mi tienda',
              prefix: const Icon(Icons.store),
              suffix: const Icon(Icons.keyboard_arrow_down),
              onTitlePressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.store), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      expect(pressed, isTrue);
    });
  });
}