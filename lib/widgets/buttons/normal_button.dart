import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

/// Normal button: border with background colour
class NormalButton extends StatelessWidget {
  /// Size of the button
  final ScreenSize size;

  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  /// Adjust the border radius
  final double borderRadius;

  /// Icon
  final IconData? icon;

  /// Color
  final Color? colour;

  const NormalButton(
      {required this.text,
      this.borderRadius = 25,
      this.size = ScreenSize.medium,
      this.icon,
      this.colour,
      Key? key,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResponsiveDisplay.getButtonHeight(size),
        child: ElevatedButton(
          style: AppButtonTheme.normalButtonTheme(context).copyWith(
            foregroundColor: colour == null
                ? null
                : MaterialStateProperty.all<Color>(colour!),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              )
            ],
          ),
          onPressed: onTap,
        ));
  }
}
