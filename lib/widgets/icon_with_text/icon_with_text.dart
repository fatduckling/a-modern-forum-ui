import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Shows an icon with text
class IconWithText extends StatelessWidget {
  /// Icon to display
  final IconData _icon;

  /// Text to display
  final String _text;

  /// Icon size
  final double iconSize;

  const IconWithText(
      {Key? key,
      required IconData icon,
      required String text,
      this.iconSize = 28})
      : _icon = icon,
        _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          _icon,
          color: Colors.blue,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          _text,
          style: AppTextTheme.body1(context)?.merge(const TextStyle(height: 1)),
        ),
      ],
    );
  }
}
