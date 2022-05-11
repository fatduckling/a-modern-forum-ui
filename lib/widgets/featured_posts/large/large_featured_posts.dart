import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:flutter/material.dart';

class LargeFeaturedPosts extends StatelessWidget {
  /// Number of featured posts to display
  static const int numberOfFeaturedPosts = 4;

  /// Add multiplier to flex to increase precision for flex widgets
  static const int multiplier = 100;

  /// Device screen size
  final ScreenSize screenSize;

  const LargeFeaturedPosts(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // @formatter:off
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    final int freeSpace = (100 * multiplier) - (multiplier * pageBoundsFlex * 2);
    final int featuredPostWidth = ((freeSpace / numberOfFeaturedPosts) * 0.99).round();
    final int featuredPostSpacerWidth = ((freeSpace - (featuredPostWidth * numberOfFeaturedPosts)) /
                (numberOfFeaturedPosts - 1)).round();
    // @formatter:on
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(
                  flex: pageBoundsFlex * multiplier,
                ),
                Expanded(
                  flex: freeSpace,
                  child: Text(
                    "Featured topics",
                    style: AppTextTheme.h3(context),
                  ),
                ),
                Spacer(
                  flex: pageBoundsFlex * multiplier,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: pageBoundsFlex * multiplier,
                    child: const Align(
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
                Expanded(
                    flex: pageBoundsFlex * multiplier,
                    child: const Align(
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
