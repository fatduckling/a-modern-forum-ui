import 'package:flutter/material.dart';

class Lead extends StatelessWidget {
  final String _text;

  const Lead({Key? key, required String text})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
