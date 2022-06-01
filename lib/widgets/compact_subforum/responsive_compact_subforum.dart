import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/compact_subforum/large/large_compact_subforum.dart';
import 'package:a_modern_forum_project/widgets/unhandled_widget/unhandled_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Responsive compact sub-forum widget
class ResponsiveCompactSubforum extends StatelessWidget {
  const ResponsiveCompactSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.extraSmall: // TODO test me
      case ScreenSize.small:
      case ScreenSize.medium:
      return const UnhandledWidget("ResponsiveCompactSubforum");
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return const LargeCompactSubforum();
    }
  }
}
