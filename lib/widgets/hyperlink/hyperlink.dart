import 'package:flutter/material.dart';

/// Clickable text
class Hyperlink extends StatelessWidget {
  /// Hyperlink text
  final String _text;

  /// On-click function of the hyperlink
  final VoidCallback _callback;

  const Hyperlink({required String text, required VoidCallback onTap, Key? key})
      : _text = text,
        _callback = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          _text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: _callback);
  }
}
