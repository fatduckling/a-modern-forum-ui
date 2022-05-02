import 'package:flutter/material.dart';

/// Heading 3
class H3 extends StatelessWidget {
  final String text;

  const H3(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 25, height: 1),
    );
  }
}
