import 'package:flutter/material.dart';

/// Body 2 (bold)
class TextBody2Bold extends StatelessWidget {
  /// Text contents
  final String text;

  /// Text align
  final TextAlign? textAlign;

  /// Text colour
  final MaterialColor? color;

  const TextBody2Bold(this.text, {Key? key, this.textAlign, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: 16, height: 1, fontWeight: FontWeight.bold, color: color),
    );
  }
}
