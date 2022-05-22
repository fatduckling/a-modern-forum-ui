import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Shows an icon with text
class IconWithText extends StatelessWidget {
  /// Icon to display
  final IconData icon;

  /// Text to display
  final String text;

  /// Icon size
  final double iconSize;

  /// Icon and text colour
  final Color? color;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize = 28,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color ?? AppColourTheme.primary.normal,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: AppTextTheme.body1(context)?.merge(TextStyle(
              height: 1, color: color ?? AppColourTheme.primary.normal)),
        ),
      ],
    );
  }
}
