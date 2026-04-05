import 'package:flutter/material.dart';

/// Extension to facilitate access to the theme from the [BuildContext].
extension BuildContextThemeExtension on BuildContext {
  /// Gets the current [ThemeData].
  ThemeData get theme => Theme.of(this);
  
  /// Gets the current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;
  
  /// Gets the current [TextTheme].
  TextTheme get textTheme => theme.textTheme;
  
  /// Gets the [primary] color of the current [ColorScheme].
  Color get primaryColor => colorScheme.primary;
  
  /// Gets the [onPrimary] color of the current [ColorScheme].
  Color get onPrimaryColor => colorScheme.onPrimary;
  
  /// Gets the [error] color of the current [ColorScheme].
  Color get errorColor => colorScheme.error;
}
