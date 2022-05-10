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

  const NormalButton(
      {required this.text,
      this.borderRadius = 25,
      this.size = ScreenSize.medium,
      Key? key,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResponsiveDisplay.getButtonHeight(size),
        child: ElevatedButton(
          child: Text(
            text,
          ),
          onPressed: onTap ?? () {},
        ));
  }
}
