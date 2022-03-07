import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/large/large_featured_posts.dart';
import 'package:flutter/material.dart';

class ResponsiveFeaturedPosts extends StatefulWidget {
  const ResponsiveFeaturedPosts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsiveFeaturedPosts();
}

class _ResponsiveFeaturedPosts extends State<ResponsiveFeaturedPosts> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize =
        ResponsiveDisplay.getScreenSizeFromBuildContext(context);
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return const LargeFeaturedPosts();
    }
  }
}
