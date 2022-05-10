import 'package:a_modern_forum_project/widgets/featured_posts/responsive_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/responsive_sort_filter_threads.dart';
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
        ResponsiveFeaturedPosts(),
        SizedBox(
          height: 20,
        ),
        ResponsiveSortFilterThreads(),
        SizedBox(
          height: 10,
        ),
        ResponsiveThreadView()
      ],
    ));
  }
}
