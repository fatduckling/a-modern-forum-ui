import 'package:flutter/material.dart';

/// Heading 3 (bold)
class H3Bold extends StatelessWidget {
  final String text;

  const H3Bold(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          const TextStyle(fontSize: 25, height: 1, fontWeight: FontWeight.bold),
    );
  }
}
