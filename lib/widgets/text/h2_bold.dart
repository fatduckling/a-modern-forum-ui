import 'package:flutter/material.dart';

/// Heading 2 (bold)
class H2Bold extends StatelessWidget {
  /// Text
  final String text;

  /// Color
  final Color? color;

  const H2Bold(this.text, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30, height: 1, fontWeight: FontWeight.bold, color: color),
    );
  }
}
