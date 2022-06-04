import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/plain_button.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/large/fixed_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/small_medium/sliding_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/text/page_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveFeaturedPosts extends StatelessWidget {
  const ResponsiveFeaturedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    PageTitle pageTitle = PageTitle(
        text: "Trending today",
        trailing: PlainButton(
          icon: Icons.read_more_outlined,
          text: "See more",
          colour: AppColourTheme.secondary.normal,
          onTap: () {},
        ),
        screenSize: screenSize);
    switch (screenSize) {
      case ScreenSize.extraSmall:
      case ScreenSize.small:
      case ScreenSize.medium:
        return SlidingFeaturedPosts(
            pageTitle: pageTitle, screenSize: screenSize);
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return FixedFeaturedPosts(pageTitle: pageTitle, screenSize: screenSize);
    }
  }
}
