import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Shows an icon with text
class IconWithText extends StatelessWidget {
  /// Icon to display
  final IconData icon;

  /// Text to display
  final String text;

  /// Icon size
  final double iconSize;

  /// Icon and text colour
  final Color? colour;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize = 24,
    this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          icon,
          color: colour,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: AppTextTheme.body2(context)
              ?.merge(TextStyle(height: 1, color: colour)),
        ),
      ],
    );
  }
}
