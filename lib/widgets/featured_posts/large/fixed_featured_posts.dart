import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:flutter/material.dart';

/// Fixed featured posts will display a fixed number of featured posts on the
/// page without a scroller
class FixedFeaturedPosts extends StatelessWidget {
  /// Page title
  final Widget pageTitle;

  /// Device screen size
  final ScreenSize screenSize;

  const FixedFeaturedPosts(
      {required this.pageTitle, required this.screenSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    List<Widget> featuredPosts =
        List.generate(4, (index) => const FeaturedPost());
    return Column(
      children: [
        pageTitle,
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
              flex: 100 - (2 * pageBoundsFlex),
              child: GridView.count(
                children: featuredPosts,
                crossAxisSpacing: 20,
                crossAxisCount: featuredPosts.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
            Spacer(
              flex: pageBoundsFlex,
            ),
          ],
        )
      ],
    );
  }
}
