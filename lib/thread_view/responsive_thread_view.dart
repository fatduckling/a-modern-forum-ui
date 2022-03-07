import 'package:a_modern_forum_project/thread_view/large/large_text_view.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

class ResponsiveThreadView extends StatelessWidget {
  final ScreenSize _screenSize;

  const ResponsiveThreadView(ScreenSize screenSize, {Key? key})
      : _screenSize = screenSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(
          child: Text("Not yet implemented"),
        );
      case ScreenSize.large:
        return const LargeTextView();
    }
  }
}
