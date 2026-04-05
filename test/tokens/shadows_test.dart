import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/tokens/shadows.dart';

void main() {
  group('SintiaShadows', () {
    test('each shadow level has exactly one BoxShadow', () {
      expect(SintiaShadows.s1.length, 1);
      expect(SintiaShadows.s2.length, 1);
      expect(SintiaShadows.s3.length, 1);
    });

    test('s3 has greater blur radius than s1', () {
      expect(
        SintiaShadows.s1.first.blurRadius < SintiaShadows.s3.first.blurRadius,
        isTrue,
      );
    });

    test('offset Y increases with shadow level', () {
      expect(
        SintiaShadows.s1.first.offset.dy < SintiaShadows.s2.first.offset.dy,
        isTrue,
      );
      expect(
        SintiaShadows.s2.first.offset.dy < SintiaShadows.s3.first.offset.dy,
        isTrue,
      );
    });

    test('shadows have zero horizontal offset', () {
      expect(SintiaShadows.s1.first.offset.dx, 0);
      expect(SintiaShadows.s2.first.offset.dx, 0);
      expect(SintiaShadows.s3.first.offset.dx, 0);
    });
  });
}
