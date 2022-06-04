import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Custom button themes
class AppButtonTheme {
  /// Border radius
  static double borderRadius = 20;

  /// Normal button theme
  static ButtonStyle normalButtonTheme(BuildContext context) {
    return TextButton.styleFrom(
        textStyle: AppTextTheme.body2bold(context)
            ?.merge(const TextStyle(color: AppColourTheme.light, height: 1)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)));
  }

  /// Outline button theme
  static ButtonStyle borderedButtonTheme(BuildContext context) {
    return ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          AppTextTheme.body2bold(context)?.merge(const TextStyle(height: 1)),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius));
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(color: Colors.grey);
          } else {
            return BorderSide(color: Theme.of(context).primaryColor);
          }
        }));
  }

  /// Plain button theme
  static ButtonStyle plainButtonTheme(BuildContext context) {
    return ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        textStyle: MaterialStateProperty.all<TextStyle?>(
          AppTextTheme.body2bold(context)?.merge(const TextStyle(height: 1)),
        ));
  }
}
