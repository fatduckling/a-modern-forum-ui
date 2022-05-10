import 'package:a_modern_forum_project/routes/create_post.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/utils/text_theme.dart';
import 'package:a_modern_forum_project/widgets/buttons/bordered_button.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/subforum_dropdown/subforum_dropdown.dart';
import 'package:flutter/material.dart';

class LargeSortFilterThreads extends StatelessWidget {
  /// Device screen size
  final ScreenSize screenSize;

  const LargeSortFilterThreads(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(screenSize);
    final mainContainerFlex =
        ResponsiveDisplay.getMainContainerFlex(screenSize);

    return Column(
      children: [
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
              flex: 100 - (2 * pageBoundsFlex),
              child: Text(
                "Top threads",
                style: AppTextTheme.h1(context),
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
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
              flex: mainContainerFlex,
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Filter:",
                            style: AppTextTheme.body1(context),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          BorderedButton(
                            text: "Popular",
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          NormalButton(
                            size: ScreenSize.small,
                            text: "New",
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: SubforumDropdown(),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 100 - ((2 * pageBoundsFlex) + mainContainerFlex),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: NormalButton(
                    text: "Start thread",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePostRoute()),
                    ),
                  )),
            ),
            Spacer(
              flex: pageBoundsFlex,
            )
          ],
        )
      ],
    );
  }
}
