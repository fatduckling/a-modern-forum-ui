import 'package:flutter/material.dart';

/// Small rounded outline button
class SmallOutlineButton extends StatelessWidget {
  /// Button text
  final String text;

  /// Button callback
  final VoidCallback? onTap;

  /// Color
  final Color? colour;

  /// Icon
  final IconData? icon;

  const SmallOutlineButton(
      {required this.text, Key? key, this.onTap, this.colour, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: icon == null ? 30 : 30,
        child: OutlinedButton(
          style: ButtonStyle(
            foregroundColor: colour == null
                ? null
                : MaterialStateProperty.all<Color>(colour!),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Row(
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
              Text(text)
            ],
          ),
          onPressed: onTap ?? () {},
        ));
  }
}
