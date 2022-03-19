import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/thread_view/large/large_thread_view.dart';
import 'package:flutter/material.dart';

class ResponsiveThreadView extends StatelessWidget {
  const ResponsiveThreadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ResponsiveDisplay.getScreenSizeFromContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(
          child: Text("Not yet implemented"),
        );
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return const LargeThreadView();
    }
  }
}
