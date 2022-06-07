import 'package:a_modern_forum_project/models/comments/comments_model.dart';
import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:a_modern_forum_project/widgets/comment_box/comment_box.dart';
import 'package:a_modern_forum_project/widgets/comment_editor/comment_editor.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Used to display a thread and its comments
class ViewPostRoute extends StatelessWidget {
  /// Thread (post) to render
  final Widget thread;

  const ViewPostRoute(this.thread, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = context.watch<ScreenResizeObserver>().screenSize;
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
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
          Expanded(flex: 100 - (2 * pageBoundsFlex), child: thread),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      ),
      Row(
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(
              flex: 100 - (2 * pageBoundsFlex),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColourTheme.light,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommentEditor(iconSize: 64),
                    const SizedBox(
                      height: 60,
                    ),
                    CommentBox(
                      model: CommentsModel.buildSampleModel(),
                    )
                  ],
                ),
              )),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      ),
      const SizedBox(
        height: 40,
      ),
    ]));
  }
}
