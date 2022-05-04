import 'package:a_modern_forum_project/routes/create_post.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/medium/medium_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/subforum_dropdown/subforum_dropdown.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
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
    List<Widget> titles = [];
    for (double i = 8; i < 35; i++) {
      titles.add(Text(
        "This is font ${i}px",
        style: TextStyle(fontSize: i),
      ));
      titles.add(SizedBox(
        height: 10,
      ));
    }
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
        Column(
          children: titles,
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
                          SmallRoundedButton(
                            text: "Popular",
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          SmallRoundedButton(
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
                  child: MediumRoundedButton(
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
