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
              flex: 2,
            ),
            Expanded(
              flex: 6,
              child: H1("Top Threads"),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 5,
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
            const Expanded(flex: 1, child: MediumRoundedButton("Start thread")),
            const Spacer(
              flex: 2,
            )
          ],
        )
      ],
    );
  }
}
