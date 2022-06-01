import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

/// Display the page title
class PageTitle extends StatelessWidget {
  /// Page title
  final String text;

  /// Device screen size
  final ScreenSize screenSize;

  const PageTitle({required this.text, required this.screenSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // @formatter:off
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
   return Row(
      children: [
        Spacer(
          flex: pageBoundsFlex,
        ),
        Expanded(
          flex: 100 - (pageBoundsFlex * 2),
          child: Text(text,
            style: AppTextTheme.body1(context)
                ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Spacer(
          flex: pageBoundsFlex,
        ),
      ],
    );
  }
}
