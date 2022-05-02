import 'package:flutter/material.dart';

/// Heading 2
class H2 extends StatelessWidget {
  final String text;

  const H2(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30, height: 1),
    );
  }
}
