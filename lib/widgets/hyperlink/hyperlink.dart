import 'package:flutter/material.dart';

/// Clickable text
class Hyperlink extends StatelessWidget {
  /// Hyperlink text
  final String text;

  /// On-click function of the hyperlink
  final VoidCallback onTap;

  const Hyperlink({required this.text, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: onTap);
  }
}
