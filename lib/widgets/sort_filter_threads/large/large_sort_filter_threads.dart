import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/medium/medium_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/subforum_dropdown/subforum_dropdown.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';

class LargeSortFilterThreads extends StatelessWidget {
  const LargeSortFilterThreads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ResponsiveDisplay.getScreenSizeFromContext(context);
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    final mainContainerFlex = ResponsiveDisplay.getMainContainerFlex(size);
    return Column(
      children: [
        Row(
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
              flex: 100 - (2 * pageBoundsFlex),
              child: const H1("Top Threads"),
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
                  padding: const EdgeInsets.only(left: 30),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          SmallRoundedButton("Popular"),
                          SizedBox(
                            width: 40,
                          ),
                          SmallRoundedButton("New"),
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
              child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: MediumRoundedButton("Start thread")),
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
