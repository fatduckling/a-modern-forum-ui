import 'package:flutter/material.dart';

/// Body 3
class TextBody3 extends StatelessWidget {
  final String text;

  /// Text decoration (eg underline)
  final TextDecoration? decoration;

  /// Max lines
  final int? maxLines;

  /// Soft wrap
  final bool? softWrap;

  /// Text overflow
  final TextOverflow? overflow;

  /// Color
  final Color? color;

  const TextBody3(this.text,
      {Key? key,
      this.decoration,
      this.maxLines,
      this.softWrap,
      this.overflow,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
          fontSize: 14, height: 1.6, decoration: decoration, color: color),
    );
  }
}
