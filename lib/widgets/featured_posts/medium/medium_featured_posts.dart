import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/page_title.dart';
import 'package:flutter/material.dart';

class MediumFeaturedPosts extends StatelessWidget {
  /// Add multiplier to flex to increase precision for flex widgets
  static const int multiplier = 100;

  /// Device screen size
  final ScreenSize screenSize;

  const MediumFeaturedPosts(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    List<Widget> featuredPosts =
        List.generate(4, (index) => const FeaturedPost());
    return Column(
      children: [
        PageTitle(text: "Trending today", screenSize: screenSize),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
              flex: 100 - (pageBoundsFlex * 2),
              child: GridView.count(
                childAspectRatio: 32.0 / 30.0,
                crossAxisCount: 2,
                // horizontal
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: featuredPosts,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            Spacer(
              flex: pageBoundsFlex,
            ),
          ],
        ),
      ],
    );
  }
}
