import 'package:flutter/material.dart';
import 'package:sintia_system_design/sintia_system_design.dart';

/// Atom — Title text with optional prefix and suffix for the SintiaAppBar.
///
/// If [onPressed] is provided, the entire title area becomes tappable.
class SintiaAppBarTitle extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onPressed;

  const SintiaAppBarTitle({
    super.key,
    required this.text,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) ...[prefix!, const SizedBox(width: 4)],
        Flexible(
          child: SintiaText(
            text,
            style: textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (suffix != null) ...[const SizedBox(width: 4), suffix!],
      ],
    );

    if (onPressed != null) {
      return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(SintiaSizes.radius1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: content,
        ),
      );
    }

    return content;
  }
}