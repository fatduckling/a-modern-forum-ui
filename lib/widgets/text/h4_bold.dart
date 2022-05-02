import 'package:flutter/material.dart';

/// Heading 4 (bold)
class H4 extends StatelessWidget {
  final String text;

  const H4(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, height: 1.4, fontWeight: FontWeight.bold),
    );
  }
}
