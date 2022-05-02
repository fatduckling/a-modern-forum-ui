import 'package:flutter/material.dart';

/// Body 2
class TextBody2 extends StatelessWidget {
  /// Text
  final String text;

  /// Max lines
  final int? maxLines;

  /// Soft wrap
  final bool? softWrap;

  /// Text overflow
  final TextOverflow? overflow;

  /// Color
  final Color? color;

  const TextBody2(this.text,
      {Key? key, this.maxLines, this.softWrap, this.overflow, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(fontSize: 16, height: 1.6, color: color),
    );
  }
}
