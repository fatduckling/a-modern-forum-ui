import 'package:a_modern_forum_project/widgets/featured_posts/responsive_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/thread_view/responsive_thread_view.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          height: 20,
        ),
        ResponsiveFeaturedPosts(),
        SizedBox(
          height: 20,
        ),
        ResponsiveThreadView()
      ],
    ));
  }
}
