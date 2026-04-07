import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_title.dart';
import 'package:sintia_system_design/atoms/sintia_text.dart';

void main() {
  group('SintiaAppBarTitle', () {
    testWidgets('renders title text via SintiaText', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(text: 'Mi tienda'),
          ),
        ),
      );

      expect(find.byType(SintiaText), findsOneWidget);
      expect(find.text('Mi tienda'), findsOneWidget);
    });

    testWidgets('renders prefix when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(
              text: 'Mi tienda',
              prefix: Icon(Icons.store),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.store), findsOneWidget);
    });

    testWidgets('renders suffix when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(
              text: 'Mi tienda',
              suffix: Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('wraps in InkWell when onPressed is provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(
              text: 'Mi tienda',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('does not wrap in InkWell when onPressed is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(text: 'Mi tienda'),
          ),
        ),
      );

      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTitle(
              text: 'Mi tienda',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      expect(pressed, isTrue);
    });
  });
}