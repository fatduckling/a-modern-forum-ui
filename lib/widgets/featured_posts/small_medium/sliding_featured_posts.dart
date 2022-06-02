import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/page_title.dart';
import 'package:flutter/material.dart';

/// Sliding featured posts for small/medium devices
class SlidingFeaturedPosts extends StatelessWidget {
  /// Device screen size
  final ScreenSize screenSize;

  /// Height and width of the featured post on an extraSmall or small deviceA
  static const smallPostSize = 150.0;

  /// Height and width of the featured post on a medium device
  static const mediumPostSize = 300.0;

  const SlidingFeaturedPosts(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    List<Widget> featuredPosts =
        List.generate(8, (index) => buildFeaturedPost());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(text: "Trending today", screenSize: screenSize),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Flexible(
                flex: 100 - (2 * pageBoundsFlex),
                child: SizedBox(
                    height: screenSize == ScreenSize.medium
                        ? mediumPostSize
                        : smallPostSize,
                    child: ListView.separated(
                      itemBuilder: (context, index) => featuredPosts[index],
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: featuredPosts.length,
                    ))),
            Spacer(
              flex: pageBoundsFlex,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFeaturedPost() {
    if (screenSize == ScreenSize.extraSmall || screenSize == ScreenSize.small) {
      return const FeaturedPost(
        width: smallPostSize,
        height: smallPostSize,
        showControls: false,
        maxLines: 2,
        titleFont: AppTextStyle.body1,
        descriptionFont: AppTextStyle.body3,
      );
    } else if (screenSize == ScreenSize.medium) {
      return const FeaturedPost(
        width: mediumPostSize,
        height: mediumPostSize,
        // showControls: true,
        // maxLines: 4,
        // titleFont: AppTextStyle.body1,
        // descriptionFont: AppTextStyle.body3,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
