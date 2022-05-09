import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallAppBar extends StatelessWidget {
  const SmallAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenResizeObserver observer = context.watch<ScreenResizeObserver>();
    final double width = observer.windowWidth;
    return AppBar(
      title: Text(
        "Forum Name: $width ${observer.screenSize.name}",
        style: AppTextTheme.h4(context),
      ),
    );
  }
}
