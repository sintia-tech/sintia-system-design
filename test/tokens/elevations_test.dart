import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/tokens/elevations.dart';

void main() {
  group('SintiaElevations', () {
    test('elevation values are positive', () {
      expect(SintiaElevations.s1, greaterThan(0));
      expect(SintiaElevations.s2, greaterThan(0));
      expect(SintiaElevations.s3, greaterThan(0));
      expect(SintiaElevations.s4, greaterThan(0));
      expect(SintiaElevations.s5, greaterThan(0));
      expect(SintiaElevations.s6, greaterThan(0));
    });

    test('elevation values increase sequentially', () {
      expect(SintiaElevations.s1 < SintiaElevations.s2, isTrue);
      expect(SintiaElevations.s2 < SintiaElevations.s3, isTrue);
      expect(SintiaElevations.s3 < SintiaElevations.s4, isTrue);
      expect(SintiaElevations.s4 < SintiaElevations.s5, isTrue);
      expect(SintiaElevations.s5 < SintiaElevations.s6, isTrue);
    });

    test('s1 is 2 and s6 is 12', () {
      expect(SintiaElevations.s1, 2);
      expect(SintiaElevations.s6, 12);
    });
  });
}
