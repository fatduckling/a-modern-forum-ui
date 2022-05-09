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
          child: Text(text),
          onPressed: onTap ?? () {},
        ));
  }
}
