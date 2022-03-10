import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

class SmallAppBar extends StatelessWidget {
  /// height of the app bar for small devices (mobiles)
  static const double appBarHeight = kToolbarHeight;

  const SmallAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      toolbarHeight: appBarHeight,
      title: Text(
          'Forum Name: $width ${ResponsiveDisplay.getScreenSizeFromBuildContext(context).name}'),
    );
  }
}
