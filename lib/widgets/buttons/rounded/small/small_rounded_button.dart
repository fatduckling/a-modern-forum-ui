import 'package:a_modern_forum_project/widgets/text/body2_bold.dart';
import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  const SmallRoundedButton({required this.text, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          child: TextBody2Bold(text),
          onPressed: onTap ?? () {},
        ));
  }
}
