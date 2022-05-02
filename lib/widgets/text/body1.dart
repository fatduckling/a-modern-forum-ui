import 'package:flutter/material.dart';

/// Body 1
class TextBody extends StatelessWidget {
  /// Text
  final String text;

  /// Max lines
  final int? maxLines;

  /// Soft wrap
  final bool? softWrap;

  /// Text overflow
  final TextOverflow? overflow;

  /// Text color
  final Color? color;

  const TextBody(this.text,
      {Key? key, this.maxLines, this.softWrap, this.overflow, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(fontSize: 18, height: 1, color: color),
    );
  }
}
