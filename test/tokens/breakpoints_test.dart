import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/tokens/breakpoints.dart';

void main() {
  group('SintiaBreakpoints', () {
    test('mobile breakpoint is 600', () {
      expect(SintiaBreakpoints.mobile, 600);
    });

    test('tablet breakpoint is 900', () {
      expect(SintiaBreakpoints.tablet, 900);
    });

    test('desktop breakpoint is 1200', () {
      expect(SintiaBreakpoints.desktop, 1200);
    });

    test('breakpoints are in ascending order', () {
      expect(SintiaBreakpoints.mobile < SintiaBreakpoints.tablet, isTrue);
      expect(SintiaBreakpoints.tablet < SintiaBreakpoints.desktop, isTrue);
    });
  });
}
