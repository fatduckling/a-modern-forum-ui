import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/body1.dart';
import 'package:a_modern_forum_project/widgets/text/body2.dart';
import 'package:a_modern_forum_project/widgets/text/body2_bold.dart';
import 'package:a_modern_forum_project/widgets/text/body2_light.dart';
import 'package:a_modern_forum_project/widgets/text/body3.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:a_modern_forum_project/widgets/text/h2.dart';
import 'package:a_modern_forum_project/widgets/text/h2_bold.dart';
import 'package:a_modern_forum_project/widgets/text/h3.dart';
import 'package:a_modern_forum_project/widgets/text/h3_bold.dart';
import 'package:a_modern_forum_project/widgets/text/h4.dart';
import 'package:a_modern_forum_project/widgets/text/h4_bold.dart';
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

    List<Widget> titles = [];
    for (double i = 8; i < 35; i++) {
      titles.add(Text(
        "This is font ${i}px",
        style: TextStyle(fontSize: i),
      ));
      titles.add(const SizedBox(
        height: 10,
      ));
    }

    titles.add(H1("H1")); titles.add(const SizedBox(height: 10,));
    titles.add(H2("H2")); titles.add(const SizedBox(height: 10,));
    titles.add(H2Bold("H2 Bold")); titles.add(const SizedBox(height: 10,));
    titles.add(H3("H3")); titles.add(const SizedBox(height: 10,));
    titles.add(H3Bold("H3 bold")); titles.add(const SizedBox(height: 10,));
    titles.add(H4("H4")); titles.add(const SizedBox(height: 10,));
    titles.add(H4Bold("H4 bold")); titles.add(const SizedBox(height: 40,));

    titles.add(TextBody("Body1")); titles.add(const SizedBox(height: 10,));
    titles.add(TextBody2("Body2")); titles.add(const SizedBox(height: 10,));
    titles.add(TextBody2Bold("Body2 bold")); titles.add(const SizedBox(height: 10,));
    titles.add(TextBody2Light("Body2 light")); titles.add(const SizedBox(height: 10,));
    titles.add(TextBody3("Body3")); titles.add(const SizedBox(height: 10,));


   // @formatter:on
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Spacer(
                  flex: pageBoundsFlex * multiplier,
                ),
                Expanded(
                  flex: freeSpace,
                  child: const H1("Featured topics"),
                ),
                Spacer(
                  flex: pageBoundsFlex * multiplier,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: titles,
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
