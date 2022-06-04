import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

/// Display the page title
class PageTitle extends StatelessWidget {
  /// Page title
  final String text;

  /// Trailing widget
  final Widget? trailing;

  /// Device screen size
  final ScreenSize screenSize;

  const PageTitle(
      {required this.text, this.trailing, required this.screenSize, Key? key})
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: AppTextTheme.body1(context)
                    ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
              trailing ?? const SizedBox.shrink()
            ],
          ),
        ),
        Spacer(
          flex: pageBoundsFlex,
        ),
      ],
    );
  }
}
