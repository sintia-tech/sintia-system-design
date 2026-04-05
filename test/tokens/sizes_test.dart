import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/tokens/sizes.dart';

void main() {
  group('SintiaSizes', () {
    test('size values increase sequentially', () {
      expect(SintiaSizes.size1 < SintiaSizes.size2, isTrue);
      expect(SintiaSizes.size2 < SintiaSizes.size3, isTrue);
      expect(SintiaSizes.size3 < SintiaSizes.size4, isTrue);
      expect(SintiaSizes.size4 < SintiaSizes.size5, isTrue);
      expect(SintiaSizes.size5 < SintiaSizes.size6, isTrue);
      expect(SintiaSizes.size6 < SintiaSizes.size7, isTrue);
      expect(SintiaSizes.size7 < SintiaSizes.size8, isTrue);
      expect(SintiaSizes.size8 < SintiaSizes.size9, isTrue);
    });

    test('size1 is 10 and size2 is 20', () {
      expect(SintiaSizes.size1, 10);
      expect(SintiaSizes.size2, 20);
    });

    test('radius values are positive', () {
      expect(SintiaSizes.radius1, greaterThan(0));
      expect(SintiaSizes.radius2, greaterThan(0));
    });

    test('radius2 is greater than radius1', () {
      expect(SintiaSizes.radius2 > SintiaSizes.radius1, isTrue);
    });
  });
}
