import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class SintiaText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const SintiaText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

// coverage:ignore-start
@Preview(name: 'Display Large', group: 'SintiaText')
Widget sintiaTextStylesPreview() => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    SintiaText(
      'Display Largee',
      style: TextStyle(fontSize: 47, fontWeight: FontWeight.w400),
    ),
    SintiaText(
      'Headline Medium',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    ),
    SintiaText(
      'Body Large',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    SintiaText(
      'Body Small',
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    SintiaText(
      'Label Large',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
  ],
);
// coverage:ignore-end
