import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/large/large_sort_filter_threads.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveSortFilterThreads extends StatefulWidget {
  const ResponsiveSortFilterThreads({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsiveSortFilterThreads();
}

class _ResponsiveSortFilterThreads extends State<ResponsiveSortFilterThreads> {
  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
        return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return LargeSortFilterThreads(screenSize);
    }
  }
}
