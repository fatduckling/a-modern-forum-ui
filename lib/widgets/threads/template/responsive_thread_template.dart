import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/threads/template/large/large_thread_template.dart';
import 'package:flutter/material.dart';

/// Widget that holds the thread's header and footer
class ResponsiveThreadTemplate extends StatelessWidget {
  /// The body of the thread
  final Widget _threadBody;

  const ResponsiveThreadTemplate({required Widget threadBody, Key? key})
      : _threadBody = threadBody,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize =
        ResponsiveDisplay.getScreenSizeFromBuildContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return LargeThreadTemplate(_threadBody);
    }
  }
}
