import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';

class LargeFeaturedPosts extends StatelessWidget {
  /// Number of featured posts to display
  static const int numberOfFeaturedPosts = 4;

  /// Add multiplier to flex to increase precision
  static const int multiplier = 100;

  const LargeFeaturedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int freeSpace = (100 * multiplier) -
        (multiplier * ResponsiveDisplay.pageBoundsFlex * 2);
    final int featuredPostWidth =
        ((freeSpace / numberOfFeaturedPosts) * 0.99).round();
    final int featuredPostSpacerWidth =
        ((freeSpace - (featuredPostWidth * numberOfFeaturedPosts)) /
                (numberOfFeaturedPosts - 1))
            .round();
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                Spacer(
                  flex: ResponsiveDisplay.pageBoundsFlex * multiplier,
                ),
                Expanded(
                  flex: freeSpace,
                  child: H1("Featured topics"),
                ),
                Spacer(
                  flex: ResponsiveDisplay.pageBoundsFlex * multiplier,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                    flex: ResponsiveDisplay.pageBoundsFlex * multiplier,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.chevron_left_sharp,
                        size: 96,
                      ),
                    )),
                // first featured post
                Spacer(flex: featuredPostSpacerWidth),
                Expanded(
                  child: const FeaturedPost(),
                  flex: featuredPostWidth,
                ),
                Spacer(flex: featuredPostSpacerWidth),
                // second featured post
                Spacer(flex: featuredPostSpacerWidth),
                Expanded(
                  child: const FeaturedPost(),
                  flex: featuredPostWidth,
                ),
                Spacer(flex: featuredPostSpacerWidth),
                // third featured post
                Spacer(flex: featuredPostSpacerWidth),
                Expanded(
                  child: const FeaturedPost(),
                  flex: featuredPostWidth,
                ),
                Spacer(flex: featuredPostSpacerWidth),
                // fourth featured post
                Spacer(flex: featuredPostSpacerWidth),
                Expanded(
                  child: const FeaturedPost(),
                  flex: featuredPostWidth,
                ),
                const Expanded(
                    flex: ResponsiveDisplay.pageBoundsFlex * multiplier,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.chevron_right_sharp,
                        size: 96,
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}
