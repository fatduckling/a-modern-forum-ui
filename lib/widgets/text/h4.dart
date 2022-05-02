import 'package:flutter/material.dart';

/// Heading 4
class H4 extends StatelessWidget {
  /// Text
  final String text;

  /// Max lines
  final int? maxLines;

  /// Soft wrap
  final bool? softWrap;

  /// Text overflow
  final TextOverflow? overflow;

  const H4(this.text, {Key? key, this.maxLines, this.softWrap, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: const TextStyle(fontSize: 20, height: 1.4),
    );
  }
}
