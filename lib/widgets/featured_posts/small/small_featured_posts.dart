import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/page_title.dart';
import 'package:flutter/material.dart';

/// Small featured posts
class SmallFeaturedPosts extends StatelessWidget {
  /// Device screen size
  final ScreenSize screenSize;

  const SmallFeaturedPosts(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    List<Widget> featuredPosts = List.generate(
        8,
        (index) => const FeaturedPost(
              width: 150,
              height: 150,
              showControls: false,
              maxLines: 2,
              titleFont: AppTextStyle.body1,
              descriptionFont: AppTextStyle.body3,
            ));
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
                height: 150,
                child: ListView.separated(
                  itemBuilder: (context, index) => featuredPosts[index],
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: featuredPosts.length,
                ),
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
