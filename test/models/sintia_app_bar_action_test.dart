import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/models/sintia_app_bar_action.dart';

void main() {
  group('SintiaAppBarAction', () {
    test('creates instance with required fields', () {
      const action = SintiaAppBarAction(icon: Icons.search);

      expect(action.icon, Icons.search);
      expect(action.onPressed, isNull);
      expect(action.badgeCount, isNull);
      expect(action.tooltip, isNull);
    });

    test('creates instance with all fields', () {
      void onPressed() {}

      final action = SintiaAppBarAction(
        icon: Icons.search,
        onPressed: onPressed,
        badgeCount: 5,
        tooltip: 'Buscar',
      );

      expect(action.icon, Icons.search);
      expect(action.onPressed, onPressed);
      expect(action.badgeCount, 5);
      expect(action.tooltip, 'Buscar');
    });

    group('factory cart', () {
      test('sets cart icon and tooltip', () {
        final action = SintiaAppBarAction.cart(onPressed: () {});

        expect(action.icon, Icons.shopping_cart_outlined);
        expect(action.tooltip, 'Cart');
      });

      test('sets itemCount as badgeCount', () {
        final action = SintiaAppBarAction.cart(
          onPressed: () {},
          itemCount: 4,
        );

        expect(action.badgeCount, 4);
      });

      test('badgeCount is null when itemCount is not provided', () {
        final action = SintiaAppBarAction.cart(onPressed: () {});

        expect(action.badgeCount, isNull);
      });
    });
  });
}