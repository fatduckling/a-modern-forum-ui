import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/threads/text/large/large_text_thread.dart';
import 'package:flutter/material.dart';

class ResponsiveTextThread extends StatelessWidget {
  final ScreenSize _screenSize;

  const ResponsiveTextThread(ScreenSize screenSize, {Key? key})
      : _screenSize = screenSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return const LargeTextThread();
    }
  }
}
