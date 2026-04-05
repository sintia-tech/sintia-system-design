import 'package:flutter/material.dart';
import 'sintia_theme_config.dart';

class SintiaTheme {
  static ThemeData light(SintiaThemeConfig config) {
    final colorScheme = ColorScheme.light(
      primary: config.primaryColor,
      secondary: config.secondaryColor,
    );
    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(config, Colors.black87),
    );
  }

  static ThemeData dark(SintiaThemeConfig config) {
    final colorScheme = ColorScheme.dark(
      primary: config.primaryColor,
      secondary: config.secondaryColor,
    );
    return ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(config, Colors.white),
    );
  }

  static TextTheme _buildTextTheme(SintiaThemeConfig config, Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: config.primaryFont, color: textColor),
      displayMedium: TextStyle(
        fontFamily: config.primaryFont,
        color: textColor,
      ),
      displaySmall: TextStyle(fontFamily: config.primaryFont, color: textColor),
      headlineLarge: TextStyle(
        fontFamily: config.primaryFont,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: config.primaryFont,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: config.primaryFont,
        color: textColor,
      ),
      titleLarge: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      titleMedium: TextStyle(
        fontFamily: config.secondaryFont,
        color: textColor,
      ),
      titleSmall: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      bodyLarge: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      bodyMedium: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      bodySmall: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      labelLarge: TextStyle(fontFamily: config.secondaryFont, color: textColor),
      labelMedium: TextStyle(
        fontFamily: config.secondaryFont,
        color: textColor,
      ),
      labelSmall: TextStyle(fontFamily: config.secondaryFont, color: textColor),
    );
  }
}
