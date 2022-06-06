import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/thread_view/large/large_thread_view.dart';
import 'package:a_modern_forum_project/widgets/thread_view/small/small_thread_view.dart';
import 'package:a_modern_forum_project/widgets/unhandled_widget/unhandled_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveThreadView extends StatelessWidget {
  const ResponsiveThreadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.extraSmall:
      case ScreenSize.small:
        return SmallThreadView(screenSize);
      case ScreenSize.medium:
      return const UnhandledWidget("ResponsiveThreadView");
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return LargeThreadView(screenSize);
    }
  }
}
