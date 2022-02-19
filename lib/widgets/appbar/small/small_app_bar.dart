import 'package:flutter/material.dart';

class SmallAppBar extends StatelessWidget {
  /// height of the app bar for small devices (mobiles)
  static const double appBarHeight = kToolbarHeight;

  const SmallAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      title: const Text("Forum small"),
    );
  }
}
