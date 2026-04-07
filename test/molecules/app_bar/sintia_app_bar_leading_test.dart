import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_back_button.dart';
import 'package:sintia_system_design/molecules/app_bar/sintia_app_bar_leading.dart';

void main() {
  group('SintiaAppBarLeading', () {
    testWidgets('renders SizedBox.shrink when leadingType is none', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarLeading(
              leadingType: SintiaAppBarLeadingType.none,
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarBackButton), findsNothing);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('renders SintiaAppBarBackButton when leadingType is back', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SintiaAppBarLeading(
              leadingType: SintiaAppBarLeadingType.back,
              color: Colors.black,
            ),
          ),
        ),
      );

      expect(find.byType(SintiaAppBarBackButton), findsOneWidget);
    });

    testWidgets('passes onPressed to back button', (tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SintiaAppBarLeading(
              leadingType: SintiaAppBarLeadingType.back,
              color: Colors.black,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(pressed, isTrue);
    });

    testWidgets('defaults to none when leadingType is not provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SintiaAppBarLeading(color: Colors.black)),
        ),
      );

      expect(find.byType(SintiaAppBarBackButton), findsNothing);
    });
  });
}
