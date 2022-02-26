import 'package:a_modern_forum_project/widgets/featured_post/featured_post.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';

class LargeFeaturedPosts extends StatelessWidget {
  const LargeFeaturedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: H1(text: "Featured topics"),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  child: FeaturedPost(),
                  flex: 2,
                ),
                Expanded(
                  child: FeaturedPost(),
                  flex: 2,
                ),
                Expanded(
                  child: FeaturedPost(),
                  flex: 2,
                ),
                Expanded(
                  child: FeaturedPost(),
                  flex: 2,
                ),
                Spacer(
                  flex: 1,
                )
              ],
            )
          ],
        ));
  }
}
