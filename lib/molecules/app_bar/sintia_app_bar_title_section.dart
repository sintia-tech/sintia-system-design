import 'package:flutter/material.dart';
import 'package:sintia_system_design/atoms/app_bar/sintia_app_bar_title.dart';

/// Molecule — Wraps [SintiaAppBarTitle] and handles alignment within the AppBar.
///
/// When [centerTitle] is false, the title expands to fill the available
/// space and aligns to the start (typical for screens without a back button).
/// When [centerTitle] is true, it lets the AppBar center it naturally.
class SintiaAppBarTitleSection extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTitlePressed;
  final bool centerTitle;

  const SintiaAppBarTitleSection({
    super.key,
    required this.title,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onTitlePressed,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleWidget = SintiaAppBarTitle(
      text: title,
      textStyle: textStyle,
      prefix: prefix,
      suffix: suffix,
      onPressed: onTitlePressed,
    );

    if (!centerTitle) {
      return Align(alignment: Alignment.centerLeft, child: titleWidget);
    }

    return titleWidget;
  }
}
