import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/appbar/large/large_app_bar.dart';
import 'package:a_modern_forum_project/widgets/appbar/small/small_app_bar.dart';
import 'package:flutter/material.dart';

class ResponsiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScreenSize _screenSize;

  const ResponsiveAppBar({Key? key, required ScreenSize screenSize})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        _screenSize = screenSize,
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _ResponsiveAppBarState createState() => _ResponsiveAppBarState();
}

class _ResponsiveAppBarState extends State<ResponsiveAppBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget._screenSize) {
      case ScreenSize.extraSmall: // TODO test me
      case ScreenSize.small:
      case ScreenSize.medium:
        return const SmallAppBar();
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return const LargeAppBar();
    }
  }
}
