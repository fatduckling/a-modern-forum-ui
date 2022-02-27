import 'package:flutter/material.dart';

class MediumRoundedButton extends StatelessWidget {
  final String _text;

  const MediumRoundedButton(this._text, {Key? key}) : super(key: key);

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
          child: Text(_text),
          onPressed: () {},
        ));
  }
}
