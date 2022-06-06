import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
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

  /// Background colour
  final Color? backgroundColour;

  /// Text colour
  final Color textColour;

  /// Main axis size
  final MainAxisSize mainAxisSize;

  const NormalButton(
      {required this.text,
      this.borderRadius = AppButtonTheme.borderRadius,
      this.size = ScreenSize.medium,
      this.icon,
      this.backgroundColour,
      this.textColour = AppColourTheme.light,
      this.mainAxisSize = MainAxisSize.min,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResponsiveDisplay.getButtonHeight(size),
        child: ElevatedButton(
          style: AppButtonTheme.normalButtonTheme(context).copyWith(
            backgroundColor: backgroundColour == null
                ? null
                : MaterialStateProperty.all<Color>(backgroundColour!),
            foregroundColor: MaterialStateProperty.all<Color>(textColour),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius));
            }),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: mainAxisSize == MainAxisSize.min
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            mainAxisSize: mainAxisSize,
            children: [
              icon == null
                  ? const SizedBox.shrink()
                  : Icon(
                      icon,
                      size: 18,
                      color: textColour,
                    ),
              SizedBox(
                width: icon == null ? 0 : 5,
              ),
              Flexible(
                  child: Text(
                text,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.body3(context)?.merge(TextStyle(
                    height: 1, color: textColour, fontWeight: FontWeight.bold)),
              ))
            ],
          ),
          onPressed: onTap,
        ));
  }
}
