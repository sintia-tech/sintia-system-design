import 'dart:async' show Completer;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/molecules/sintia_button.dart';

void main() {
  Widget buildTestApp(Widget child) => MaterialApp(
        home: Scaffold(body: Center(child: child)),
      );

  group('SintiaButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(onPressed: () async {}, label: 'Press me'),
      ));

      expect(find.text('Press me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var called = false;

      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async => called = true,
          label: 'Tap',
        ),
      ));

      await tester.tap(find.byType(SintiaButton));
      await tester.pumpAndSettle();

      expect(called, isTrue);
    });

    testWidgets('is disabled when onPressed is null', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SintiaButton(onPressed: null, label: 'Disabled'),
      ));

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('is disabled when enabled is false', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async {},
          label: 'Disabled',
          enabled: false,
        ),
      ));

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('shows loading state after tap', (tester) async {
      final completer = Completer<void>();

      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () => completer.future,
          label: 'Loading',
          loadingLabel: 'Saving...',
        ),
      ));

      await tester.tap(find.byType(SintiaButton));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      completer.complete();
      await tester.pumpAndSettle();
    });

    testWidgets('renders left icon when provided', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async {},
          label: 'With icon',
          leftIcon: Icons.add,
        ),
      ));

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('renders right icon when provided', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async {},
          label: 'With icon',
          rightIcon: Icons.arrow_forward,
        ),
      ));

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('has correct semantics identifier by default', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async {},
          label: 'Primary',
          variant: SintiaButtonVariant.primary,
        ),
      ));

      final semantics = tester.widget<Semantics>(
        find.ancestor(
          of: find.byType(TextButton),
          matching: find.byType(Semantics),
        ).first,
      );
      expect(semantics.properties.identifier, 'sintia_button_primary');
    });

    testWidgets('uses custom semanticId when provided', (tester) async {
      await tester.pumpWidget(buildTestApp(
        SintiaButton(
          onPressed: () async {},
          label: 'Submit',
          semanticId: 'submit_btn',
        ),
      ));

      final semantics = tester.widget<Semantics>(
        find.ancestor(
          of: find.byType(TextButton),
          matching: find.byType(Semantics),
        ).first,
      );
      expect(semantics.properties.identifier, 'submit_btn');
    });
  });

  group('SintiaButtonVariant', () {
    test('has all expected variants', () {
      expect(SintiaButtonVariant.values, containsAll([
        SintiaButtonVariant.primary,
        SintiaButtonVariant.secondary,
        SintiaButtonVariant.destructive,
        SintiaButtonVariant.text,
      ]));
    });
  });

  group('SintiaButtonSize', () {
    test('has all expected sizes', () {
      expect(SintiaButtonSize.values, containsAll([
        SintiaButtonSize.small,
        SintiaButtonSize.medium,
        SintiaButtonSize.large,
      ]));
    });
  });
}
