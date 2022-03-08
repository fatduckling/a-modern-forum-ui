import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/collapsed_subforum/large/large_collapsed_subforum.dart';
import 'package:flutter/material.dart';

/// Responsive collapsed sub-forum widget
class ResponsiveCollapsedSubforum extends StatefulWidget {
  const ResponsiveCollapsedSubforum({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsiveCollapsedSubforum();
}

class _ResponsiveCollapsedSubforum extends State<ResponsiveCollapsedSubforum> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize =
        ResponsiveDisplay.getScreenSizeFromBuildContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return const LargeCollapsedSubforum();
    }
  }
}
