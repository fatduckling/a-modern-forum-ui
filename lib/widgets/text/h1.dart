import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String _text;

  const H1(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
