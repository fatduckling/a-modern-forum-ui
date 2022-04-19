import 'package:flutter/material.dart';

class MediumRoundedButton extends StatelessWidget {
  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  const MediumRoundedButton({required this.text, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          child: Text(text),
          onPressed: onTap ?? () {},
        ));
  }
}
