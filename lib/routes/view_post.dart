import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';

/// Used to display a thread and its comments
class ViewPost extends StatelessWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Row(
        children: const [
          Spacer(
            flex: ResponsiveDisplay.pageBoundsFlex,
          ),
          Flexible(
              flex: 100 - (2 * ResponsiveDisplay.pageBoundsFlex),
              child: Breadcrumbs([
                "Astronomy Now",
                "General Astronomy",
                "Other",
                "How to navigate this forum"
              ])),
          Spacer(
            flex: ResponsiveDisplay.pageBoundsFlex,
          ),
        ],
      )
    ]));
  }
}
