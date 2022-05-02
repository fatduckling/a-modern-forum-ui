import 'package:a_modern_forum_project/widgets/text/body2.dart';
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
            child: TextBody2(
              text,
              color: Colors.black45,
            ),
          )),
    );
  }
}
