import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:flutter/material.dart';

/// Sliding featured posts for small/medium devices
class SlidingFeaturedPosts extends StatelessWidget {
  /// Page title
  final Widget pageTitle;

  /// Device screen size
  final ScreenSize screenSize;

  const SlidingFeaturedPosts(
      {required this.pageTitle, required this.screenSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    List<Widget> featuredPosts = List.generate(
        8,
        (index) => FeaturedPost(
            showControls: false,
            maxLines: 2,
            titleFont: screenSize == ScreenSize.medium
                ? AppTextStyle.body1
                : AppTextStyle.body2bold,
            descriptionFont: screenSize == ScreenSize.medium
                ? AppTextStyle.body2
                : AppTextStyle.body3));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        pageTitle,
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
                flex: 100 - (2 * pageBoundsFlex),
                child: SizedBox(
                  height: screenSize == ScreenSize.medium ? 175 : 150,
                  child: ListView.separated(
                    itemBuilder: (context, index) => AspectRatio(
                      aspectRatio: 1,
                      child: featuredPosts[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: featuredPosts.length,
                  ),
                )),
            Spacer(
              flex: pageBoundsFlex,
            ),
          ],
        ),
      ],
    );
  }
}
