import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.blue, // Button color
        child: InkWell(
          hoverColor: Colors.green,
          splashColor: Colors.red, // Splash color
          onTap: () {},
          child: const SizedBox(
              width: 28, height: 28, child: Icon(Icons.keyboard_arrow_up)),
        ),
      ),
    );
  }
}
