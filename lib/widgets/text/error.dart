import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Used to display an error text in the middle
class ErrorText extends StatelessWidget {
  /// Error message
  final String text;

  const ErrorText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: AppTextTheme.body2bold(context)?.apply(color: Colors.red));
  }
}
