import 'package:flutter/material.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_action_button.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_badge_button.dart';
import 'package:sintia_system_design/models/sintia_app_bar_action.dart';

/// Molecule — Resolves which trailing widget to render based on [action].
///
/// Renders [SintiaAppBarBadgeButton] if [action.badgeCount] > 0.
/// Otherwise renders [SintiaAppBarActionButton].
class SintiaAppBarTrailing extends StatelessWidget {
  final SintiaAppBarAction action;
  final Color color;

  const SintiaAppBarTrailing({
    super.key,
    required this.action,
    required this.color,
  });

  bool get _hasBadge => action.badgeCount != null && action.badgeCount! > 0;

  @override
  Widget build(BuildContext context) {
    if (_hasBadge) {
      return SintiaAppBarBadgeButton(
        icon: action.icon,
        onPressed: action.onPressed,
        color: color,
        badgeCount: action.badgeCount,
        tooltip: action.tooltip,
      );
    }

    return SintiaAppBarActionButton(
      icon: action.icon,
      onPressed: action.onPressed,
      color: color,
      tooltip: action.tooltip,
    );
  }
}