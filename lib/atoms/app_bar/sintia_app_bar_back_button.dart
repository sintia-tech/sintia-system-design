import 'package:flutter/material.dart';

/// Atom — Back button for the SintiaAppBar.
/// If [onPressed] is null, defaults to [Navigator.pop].
class SintiaAppBarBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;

  const SintiaAppBarBackButton({
    super.key,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.arrow_back, color: color),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      tooltip: 'Back',
    );
  }
}