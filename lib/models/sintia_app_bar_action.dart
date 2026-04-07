import 'package:flutter/material.dart';

/// Model that represents an action in the SintiaAppBar (trailing or leading).
///
/// If [badgeCount] is provided and > 0, the action will render with a badge.
class SintiaAppBarAction {
  final IconData icon;
  final VoidCallback? onPressed;
  final int? badgeCount;
  final String? tooltip;

  const SintiaAppBarAction({
    required this.icon,
    this.onPressed,
    this.badgeCount,
    this.tooltip,
  });

  /// Convenience constructor for cart action.
  factory SintiaAppBarAction.cart({
    required VoidCallback onPressed,
    int? itemCount,
  }) {
    return SintiaAppBarAction(
      icon: Icons.shopping_cart_outlined,
      onPressed: onPressed,
      badgeCount: itemCount,
      tooltip: 'Cart',
    );
  }
}