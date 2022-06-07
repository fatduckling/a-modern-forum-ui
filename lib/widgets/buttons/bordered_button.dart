import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  const BorderedButton({required this.text,
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
          style: AppButtonTheme.borderedButtonTheme(context).copyWith(
            side: colour == null
                ? null
                : MaterialStateProperty.resolveWith<BorderSide?>(
                    (states) => BorderSide(color: colour!)),
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
                  : FaIcon(
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
