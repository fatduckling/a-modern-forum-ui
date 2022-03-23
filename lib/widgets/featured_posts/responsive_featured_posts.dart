import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/large/large_featured_posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveFeaturedPosts extends StatelessWidget {
  const ResponsiveFeaturedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return LargeFeaturedPosts(screenSize);
    }
  }
}
