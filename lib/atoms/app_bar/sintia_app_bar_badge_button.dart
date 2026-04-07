import 'package:flutter/material.dart';

/// Atom — Action button with an optional badge count for the SintiaAppBar.
/// Badge is only shown if [badgeCount] is not null AND greater than 0.
class SintiaAppBarBadgeButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final int? badgeCount;
  final String? tooltip;

  const SintiaAppBarBadgeButton({
    super.key,
    required this.icon,
    this.onPressed,
    required this.color,
    this.badgeCount,
    this.tooltip,
  });

  bool get _showBadge => badgeCount != null && badgeCount! > 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Badge(
        isLabelVisible: _showBadge,
        label: _showBadge ? Text('$badgeCount') : null,
        child: Icon(icon, color: color),
      ),
    );
  }
}