import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  final String _text;

  final VoidCallback? _onPressed;

  const SmallRoundedButton(this._text, {Key? key, VoidCallback? onPressed})
      : _onPressed = onPressed,
        super(key: key);

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
          child: Text(_text),
          onPressed: _onPressed ?? () {},
        ));
  }
}
