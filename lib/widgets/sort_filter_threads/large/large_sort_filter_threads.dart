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
    return Column(
      children: [
        Row(
          children: const [
            Spacer(
              flex: ResponsiveDisplay.pageBoundsFlex,
            ),
            Expanded(
              flex: 100 - (2 * ResponsiveDisplay.pageBoundsFlex),
              child: H1("Top Threads"),
            ),
            Spacer(
              flex: ResponsiveDisplay.pageBoundsFlex,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(
              flex: ResponsiveDisplay.pageBoundsFlex,
            ),
            Expanded(
              flex: 55,
              child: Container(
                  margin: const EdgeInsets.only(right: 40),
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
            const Expanded(flex: 8, child: MediumRoundedButton("Start thread")),
            const Spacer(
              flex: ResponsiveDisplay.pageBoundsFlex,
            )
          ],
        )
      ],
    );
  }
}
