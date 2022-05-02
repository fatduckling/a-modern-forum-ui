import 'package:a_modern_forum_project/widgets/text/body2_bold.dart';
import 'package:flutter/material.dart';

class MediumRoundedButton extends StatelessWidget {
  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  /// Adjust the border radius
  final double borderRadius;

  const MediumRoundedButton(
      {required this.text, this.borderRadius = 25, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          child: TextBody2Bold(text),
          onPressed: onTap ?? () {},
        ));
  }
}
