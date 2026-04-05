import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sintia_system_design/tokens/colors.dart';

void main() {
  group('AppColors', () {
    test('status colors are fully opaque', () {
      expect((AppColors.statusDanger01.a * 255.0).round(), 255);
      expect((AppColors.statusSuccess01.a * 255.0).round(), 255);
      expect((AppColors.statusWarning.a * 255.0).round(), 255);
      expect((AppColors.statusInfo.a * 255.0).round(), 255);
    });

    test('statusDisabled has correct hex value', () {
      expect(AppColors.statusDisabled, const Color(0xFFCCCCCC));
    });

    test('scale colors go from light to dark', () {
      // scale00 is white, scale06 is darkest
      expect(AppColors.scale00, const Color(0xFFFFFFFF));
      expect(AppColors.scale06, const Color(0xFF292929));
    });

    test('bgWhite is pure white', () {
      expect(AppColors.bgWhite, const Color(0xFFFFFFFF));
    });
  });
}
