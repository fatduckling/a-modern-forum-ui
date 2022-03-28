import 'package:flutter/material.dart';

class MediumRoundedButton extends StatelessWidget {
  final String text;

  const MediumRoundedButton(this.text, {Key? key}) : super(key: key);

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
          onPressed: () {},
        ));
  }
}
