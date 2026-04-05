import 'package:flutter/material.dart';

extension AppTextStyleExtension on TextStyle {
  TextStyle primary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.primary);
  }

  TextStyle secondary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.secondary);
  }

  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}
