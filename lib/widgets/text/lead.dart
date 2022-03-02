import 'package:flutter/material.dart';

class Lead extends StatelessWidget {
  final String _text;

  const Lead(String text, {Key? key, required})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      softWrap: false,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
