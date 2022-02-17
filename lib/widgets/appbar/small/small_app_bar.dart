import 'package:flutter/material.dart';

class SmallAppBar extends StatelessWidget {
  const SmallAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Forum small"),
    );
  }
}
