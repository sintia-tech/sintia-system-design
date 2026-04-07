import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_badge_button.dart';

void main() {
  group('SintiaAppBarBadgeButton', () {
    testWidgets('renders given icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBadgeButton(
              icon: Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
    });

    testWidgets('shows badge when badgeCount > 0', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBadgeButton(
              icon: Icons.shopping_cart_outlined,
              color: Colors.black,
              badgeCount: 3,
            ),
          ),
        ),
      );

      final badge = tester.widget<Badge>(find.byType(Badge));
      expect(badge.isLabelVisible, isTrue);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('hides badge when badgeCount is 0', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBadgeButton(
              icon: Icons.shopping_cart_outlined,
              color: Colors.black,
              badgeCount: 0,
            ),
          ),
        ),
      );

      final badge = tester.widget<Badge>(find.byType(Badge));
      expect(badge.isLabelVisible, isFalse);
    });

    testWidgets('hides badge when badgeCount is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBadgeButton(
              icon: Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ),
      );

      final badge = tester.widget<Badge>(find.byType(Badge));
      expect(badge.isLabelVisible, isFalse);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBadgeButton(
              icon: Icons.shopping_cart_outlined,
              color: Colors.black,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      expect(pressed, isTrue);
    });
  });
}