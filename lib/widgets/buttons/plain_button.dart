import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Plain button: no border and background
class PlainButton extends StatelessWidget {

  /// button text
  final String text;

  /// On-click function of the hyperlink
  final VoidCallback? onTap;

  /// Icon
  final IconData? icon;

  /// Color
  final Color? colour;

  const PlainButton(
      {required this.text,
      this.icon,
      this.onTap,
      this.colour,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: AppButtonTheme.plainButtonTheme(context),
      onPressed: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon == null
              ? const SizedBox.shrink()
              : Icon(
            icon,
                  size: 18,
                  color: colour ?? AppColourTheme.defaultTextColour,
                ),
          SizedBox(
            width: icon == null ? 0 : 5,
          ),
          Flexible(
              child: Text(
                text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.body2bold(context)
                ?.merge(TextStyle(height: 1, color: colour)),
          ))
        ],
      ),
    );
  }
}
