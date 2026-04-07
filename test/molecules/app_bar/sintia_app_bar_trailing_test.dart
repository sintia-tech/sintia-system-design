import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_action_button.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_badge_button.dart';
import 'package:sintia_system_design/models/sintia_app_bar_action.dart';
import 'package:sintia_system_design/molecules/app_bar/sintia_app_bar_trailing.dart';

void main() {
  group('SintiaAppBarTrailing', () {
    testWidgets('renders SintiaAppBarActionButton when badgeCount is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTrailing(
              action: const SintiaAppBarAction(icon: Icons.search),
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarActionButton), findsOneWidget);
      expect(find.byType(SintiaAppBarBadgeButton), findsNothing);
    });

    testWidgets('renders SintiaAppBarActionButton when badgeCount is 0', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTrailing(
              action: const SintiaAppBarAction(
                icon: Icons.shopping_cart_outlined,
                badgeCount: 0,
              ),
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarActionButton), findsOneWidget);
      expect(find.byType(SintiaAppBarBadgeButton), findsNothing);
    });

    testWidgets('renders SintiaAppBarBadgeButton when badgeCount > 0', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTrailing(
              action: const SintiaAppBarAction(
                icon: Icons.shopping_cart_outlined,
                badgeCount: 2,
              ),
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarBadgeButton), findsOneWidget);
      expect(find.byType(SintiaAppBarActionButton), findsNothing);
    });

    testWidgets('passes color to child widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarTrailing(
              action: const SintiaAppBarAction(icon: Icons.search),
              color: Colors.red,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.search));
      expect(icon.color, Colors.red);
    });
  });
}