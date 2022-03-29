import 'package:flutter/material.dart';

/// Rounded text button
class RoundedTextButton extends StatelessWidget {
  /// Hyperlink text
  final String text;

  /// On-click function of the hyperlink
  final VoidCallback? callback;

  const RoundedTextButton({required this.text, this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: callback,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black45),
            ),
          )),
    );
  }
}
