import 'package:flutter/material.dart';

/// Atom — Generic action button for the SintiaAppBar (no badge).
class SintiaAppBarActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final String? tooltip;

  const SintiaAppBarActionButton({
    super.key,
    required this.icon,
    this.onPressed,
    required this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(icon, color: color),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}