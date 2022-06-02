import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/large/fixed_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/small_medium/sliding_featured_posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveFeaturedPosts extends StatelessWidget {
  const ResponsiveFeaturedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.extraSmall:
      case ScreenSize.small:
      case ScreenSize.medium:
        return SlidingFeaturedPosts(screenSize);
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return FixedFeaturedPosts(screenSize);
    }
  }
}
