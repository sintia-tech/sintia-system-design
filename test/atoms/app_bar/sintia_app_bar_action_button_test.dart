import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_action_button.dart';

void main() {
  group('SintiaAppBarActionButton', () {
    testWidgets('renders given icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarActionButton(
              icon: Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarActionButton(
              icon: Icons.search,
              color: Colors.black,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      expect(pressed, isTrue);
    });

    testWidgets('applies color to icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarActionButton(
              icon: Icons.search,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.search));
      expect(icon.color, Colors.blue);
    });

    testWidgets('renders tooltip when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarActionButton(
              icon: Icons.search,
              color: Colors.black,
              tooltip: 'Buscar',
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.tooltip, 'Buscar');
    });
  });
}