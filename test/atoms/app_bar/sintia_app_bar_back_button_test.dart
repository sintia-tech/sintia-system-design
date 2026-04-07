import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_back_button.dart';

void main() {
  group('SintiaAppBarBackButton', () {
    testWidgets('renders arrow_back icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SintiaAppBarBackButton(color: Colors.black)),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarBackButton(
              color: Colors.black,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(pressed, isTrue);
    });

    testWidgets('calls Navigator.pop when onPressed is null', (tester) async {
      bool popped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onDidRemovePage: (route) {
              popped = true;
            },
            pages: [
              const MaterialPage(child: Scaffold()),
              MaterialPage(
                child: Scaffold(
                  body: SintiaAppBarBackButton(
                    color: Colors.black,
                    onPressed: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(popped, isTrue);
    });

    testWidgets('applies color to icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SintiaAppBarBackButton(color: Colors.red)),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_back));
      expect(icon.color, Colors.red);
    });
  });
}
