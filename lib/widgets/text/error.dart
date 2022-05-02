import 'package:a_modern_forum_project/widgets/text/body2_bold.dart';
import 'package:flutter/material.dart';

/// Used to display an error text in the middle
class ErrorText extends StatelessWidget {
  /// Error message
  final String text;

  const ErrorText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBody2Bold(
      text,
      textAlign: TextAlign.center,
      color: Colors.red,
    );
  }
}
