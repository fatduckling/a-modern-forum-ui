import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/large/large_sort_filter_threads.dart';
import 'package:flutter/material.dart';

class ResponsiveSortFilterThreads extends StatefulWidget {
  final ScreenSize _screenSize;

  const ResponsiveSortFilterThreads({Key? key, required ScreenSize screenSize})
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
        return const Text("Unsupported for small or medium devices");
      case ScreenSize.large:
        return const LargeSortFilterThreads();
    }
  }
}
