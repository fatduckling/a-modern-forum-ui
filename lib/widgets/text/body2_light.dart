import 'package:flutter/material.dart';

/// Body 2 (light)
class TextBody2Light extends StatelessWidget {
  /// Text
  final String text;

  /// Color
  final Color? color;

  const TextBody2Light(this.text, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, height: 1, fontWeight: FontWeight.w300, color: color),
    );
  }
}
