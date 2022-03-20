import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:a_modern_forum_project/widgets/comment_box/comment_box.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';

/// Used to display a thread and its comments
class ViewPost extends StatefulWidget {
  final Widget thread;

  const ViewPost(this.thread, {Key? key}) : super(key: key);

  @override
  State createState() {
    return _ViewPost();
  }
}

class _ViewPost extends State<ViewPost> {
  String description = 'My great package';

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ResponsiveDisplay.getScreenSizeFromContext(context);
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      // first row: breadcrumbs
          Row(
            children: [
              Spacer(
            flex: pageBoundsFlex,
          ),
          Flexible(
              flex: 100 - (2 * pageBoundsFlex),
              child: const Breadcrumbs([
                "Astronomy Now",
                "General Astronomy",
                "Other",
                "How to navigate this forum"
              ])),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      ),
      const SizedBox(height: 10),
      // second row: post details
      Row(
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(flex: 100 - (2 * pageBoundsFlex), child: widget.thread),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(flex: 100 - (2 * pageBoundsFlex), child: CommentBox()),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      )
    ]));
  }
}
