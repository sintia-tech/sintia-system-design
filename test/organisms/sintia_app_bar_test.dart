import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_back_button.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_badge_button.dart';
import 'package:sintia_system_design/models/sintia_app_bar_action.dart';
import 'package:sintia_system_design/molecules/app_bar/sintia_app_bar_leading.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

void main() {
  Widget buildSubject({
    String title = 'Test',
    SintiaAppBarLeadingType leadingType = SintiaAppBarLeadingType.none,
    VoidCallback? onLeadingPressed,
    List<SintiaAppBarAction>? trailingActions,
    VoidCallback? onTitlePressed,
    Widget? titlePrefix,
    Widget? titleSuffix,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return MaterialApp(
      home: Scaffold(
        appBar: SintiaAppBar(
          title: title,
          leadingType: leadingType,
          onLeadingPressed: onLeadingPressed,
          trailingActions: trailingActions,
          onTitlePressed: onTitlePressed,
          titlePrefix: titlePrefix,
          titleSuffix: titleSuffix,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
      ),
    );
  }

  group('SintiaAppBar', () {
    group('preferredSize', () {
      test('returns kToolbarHeight', () {
        const appBar = SintiaAppBar(title: 'Test');
        expect(appBar.preferredSize.height, kToolbarHeight);
      });
    });

    group('title', () {
      testWidgets('renders title text', (tester) async {
        await tester.pumpWidget(buildSubject(title: 'Mi tienda'));
        expect(find.text('Mi tienda'), findsOneWidget);
      });

      testWidgets('renders titlePrefix when provided', (tester) async {
        await tester.pumpWidget(
          buildSubject(titlePrefix: const Icon(Icons.store)),
        );
        expect(find.byIcon(Icons.store), findsOneWidget);
      });

      testWidgets('renders titleSuffix when provided', (tester) async {
        await tester.pumpWidget(
          buildSubject(titleSuffix: const Icon(Icons.keyboard_arrow_down)),
        );
        expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
      });

      testWidgets('calls onTitlePressed when title is tapped', (tester) async {
        bool pressed = false;

        await tester.pumpWidget(
          buildSubject(onTitlePressed: () => pressed = true),
        );

        await tester.tap(find.byType(InkWell));
        expect(pressed, isTrue);
      });
    });

    group('leading', () {
      testWidgets('does not render back button when leadingType is none', (
        tester,
      ) async {
        await tester.pumpWidget(buildSubject());
        expect(find.byType(SintiaAppBarBackButton), findsNothing);
      });

      testWidgets('renders back button when leadingType is back', (
        tester,
      ) async {
        await tester.pumpWidget(
          buildSubject(leadingType: SintiaAppBarLeadingType.back),
        );
        expect(find.byType(SintiaAppBarBackButton), findsOneWidget);
      });

      testWidgets('calls onLeadingPressed when back button is tapped', (
        tester,
      ) async {
        bool pressed = false;

        await tester.pumpWidget(
          buildSubject(
            leadingType: SintiaAppBarLeadingType.back,
            onLeadingPressed: () => pressed = true,
          ),
        );

        await tester.tap(find.byIcon(Icons.arrow_back));
        expect(pressed, isTrue);
      });

      testWidgets('centerTitle is true when leadingType is back', (
        tester,
      ) async {
        await tester.pumpWidget(
          buildSubject(leadingType: SintiaAppBarLeadingType.back),
        );

        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        expect(appBar.centerTitle, isTrue);
      });

      testWidgets('centerTitle is false when leadingType is none', (
        tester,
      ) async {
        await tester.pumpWidget(buildSubject());

        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        expect(appBar.centerTitle, isFalse);
      });
    });

    group('trailing', () {
      testWidgets('renders no trailing when trailingAction is null', (
        tester,
      ) async {
        await tester.pumpWidget(buildSubject());
        expect(find.byType(SintiaAppBarBadgeButton), findsNothing);
      });

      testWidgets('renders trailing with badge when badgeCount > 0', (
        tester,
      ) async {
        await tester.pumpWidget(
          buildSubject(
            trailingActions: [
              SintiaAppBarAction.cart(onPressed: () {}, itemCount: 2),
            ],
          ),
        );

        expect(find.byType(SintiaAppBarBadgeButton), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
      });

      testWidgets('calls trailing onPressed when tapped', (tester) async {
        bool pressed = false;

        await tester.pumpWidget(
          buildSubject(
            trailingActions: [
              SintiaAppBarAction(
                icon: Icons.search,
                onPressed: () => pressed = true,
              ),
            ],
          ),
        );

        await tester.tap(find.byIcon(Icons.search));
        expect(pressed, isTrue);
      });
    });

    group('colors', () {
      testWidgets('uses colorScheme.surface as default backgroundColor', (
        tester,
      ) async {
        await tester.pumpWidget(buildSubject());

        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        final colorScheme = tester
            .element(find.byType(AppBar))
            .theme
            .colorScheme;

        expect(appBar.backgroundColor, colorScheme.surface);
      });

      testWidgets('uses provided backgroundColor over theme default', (
        tester,
      ) async {
        await tester.pumpWidget(buildSubject(backgroundColor: Colors.red));

        final appBar = tester.widget<AppBar>(find.byType(AppBar));
        expect(appBar.backgroundColor, Colors.red);
      });
    });
  });
}
