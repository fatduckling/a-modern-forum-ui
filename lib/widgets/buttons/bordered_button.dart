import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/utils/text_theme.dart';
import 'package:flutter/material.dart';

/// Bordered button: border without background color
class BorderedButton extends StatelessWidget {
  /// Size of the button
  final ScreenSize size;

  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  /// Color
  final Color? colour;

  /// Icon
  final IconData? icon;

  const BorderedButton(
      {required this.text,
      this.size = ScreenSize.medium,
      Key? key,
      this.onTap,
      this.colour,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResponsiveDisplay.getButtonHeight(size),
        child: OutlinedButton(
          style: Theme.of(context).outlinedButtonTheme.style?.merge(ButtonStyle(
                foregroundColor: colour == null
                    ? null
                    : MaterialStateProperty.all<Color>(colour!),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon == null
                  ? const SizedBox.shrink()
                  : Icon(
                      icon,
                      size: 18,
                      color: colour,
                    ),
              SizedBox(
                width: icon == null ? 0 : 5,
              ),
              Text(
                text,
                style: AppTextTheme.body2(context)
                    ?.merge(const TextStyle(height: 1)),
              )
            ],
          ),
          onPressed: onTap,
        ));
  }
}
