import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/expanded_subforum/large/large_expanded_subforum.dart';
import 'package:flutter/material.dart';

/// Responsive expanded sub-forum widget
class ResponsiveExpandedSubforum extends StatelessWidget {
  const ResponsiveExpandedSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ResponsiveDisplay.getScreenSizeFromContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return const LargeExpandedSubforum();
    }
  }
}
