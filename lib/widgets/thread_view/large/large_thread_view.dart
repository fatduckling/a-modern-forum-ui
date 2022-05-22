import 'package:a_modern_forum_project/models/thread/types/images_model.dart';
import 'package:a_modern_forum_project/models/thread/types/poll_model.dart';
import 'package:a_modern_forum_project/models/thread/types/text_model.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/sidebar/sidebar.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/responsive_sort_filter_threads.dart';
import 'package:a_modern_forum_project/widgets/threads/template/responsive_thread_template.dart';
import 'package:flutter/material.dart';

/// Displays text posts for large devices
class LargeThreadView extends StatelessWidget {
  /// Device screen size
  final ScreenSize screenSize;

  const LargeThreadView(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    final mainContainerFlex =
        ResponsiveDisplay.getMainContainerFlex(screenSize);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Flexible(
              flex: 100 - (pageBoundsFlex * 2),
              child: Text(
                "Popular posts",
                style: AppTextTheme.body1(context)
                    ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(
              flex: pageBoundsFlex,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
                flex: mainContainerFlex,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const ResponsiveSortFilterThreads(),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (buildContext, index) {
                        if (index == 0) {
                          return ResponsiveThreadTemplate(
                              threadModel: PollModel(
                                  isCompact: true,
                                  pollingData: {
                                    "Question_7": 34,
                                    "Question_1": 22,
                                    "Question_2": 42,
                                    "Question_3": 32,
                                    "Question_4": 62,
                                    "Question_5": 52,
                                    "Question_6": 12,
                                  },
                                  showingResults: false,
                                  allowMultipleAnswers: true));
                        } else if (index % 5 != 0) {
                          return ResponsiveThreadTemplate(
                              threadModel: TextModel(
                                  isCompact: true, text: "Hello world" * 200));
                        } else {
                          return ResponsiveThreadTemplate(
                            threadModel: ImagesModel(
                                isCompact: true,
                                images: ["https://i.imgur.com/zBovHrK.jpg"]),
                          );
                        }
                      })
                ])),
            Expanded(
                flex: 100 - ((2 * pageBoundsFlex) + mainContainerFlex),
                child: const Sidebar()),
            Spacer(
              flex: pageBoundsFlex,
            )
          ],
        )
      ],
    );
  }
}
