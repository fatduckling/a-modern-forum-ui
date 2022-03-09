import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/compact_subforum/large/large_compact_subforum.dart';
import 'package:flutter/material.dart';

/// Responsive compact sub-forum widget
class ResponsiveCompactSubforum extends StatelessWidget {
  const ResponsiveCompactSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize =
        ResponsiveDisplay.getScreenSizeFromBuildContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return const LargeCompactSubforum();
    }
  }
}
