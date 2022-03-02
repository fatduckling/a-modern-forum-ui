import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/large/large_sort_filter_threads.dart';
import 'package:flutter/material.dart';

class ResponsiveSortFilterThreads extends StatefulWidget {
  final ScreenSize _screenSize;

  const ResponsiveSortFilterThreads(ScreenSize screenSize, {Key? key})
      : _screenSize = screenSize,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsiveSortFilterThreads();
}

class _ResponsiveSortFilterThreads extends State<ResponsiveSortFilterThreads> {
  @override
  Widget build(BuildContext context) {
    switch (widget._screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
      return const Center(child: Text("Unhandled small/medium screen sizes"));
      case ScreenSize.large:
        return const LargeSortFilterThreads();
    }
  }
}
