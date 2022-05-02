import 'package:flutter/material.dart';

/// Heading 1
class H1 extends StatelessWidget {
  final String text;

  const H1(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 35, height: 1),
    );
  }
}
