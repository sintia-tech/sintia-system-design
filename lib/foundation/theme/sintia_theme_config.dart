import 'package:flutter/material.dart';

class SintiaThemeConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final String primaryFont;
  final String secondaryFont;
  final String? tertiaryFont;

  const SintiaThemeConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryFont,
    required this.secondaryFont,
    this.tertiaryFont,
  });
}
