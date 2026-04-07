import 'package:flutter/material.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_back_button.dart';

/// Defines the type of leading widget in the SintiaAppBar.
enum SintiaAppBarLeadingType { none, back }

/// Molecule — Resolves which leading widget to render based on [leadingType].
class SintiaAppBarLeading extends StatelessWidget {
  final SintiaAppBarLeadingType leadingType;
  final VoidCallback? onPressed;
  final Color color;

  const SintiaAppBarLeading({
    super.key,
    this.leadingType = SintiaAppBarLeadingType.none,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return switch (leadingType) {
      SintiaAppBarLeadingType.back => SintiaAppBarBackButton(
        onPressed: onPressed,
        color: color,
      ),
      SintiaAppBarLeadingType.none => const SizedBox.shrink(),
    };
  }
}