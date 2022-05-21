import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: AppColourTheme.light,
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
                    const SizedBox(
                      width: 10,
                    ),
                    const BorderedButton(
                      size: ScreenSize.small,
                      text: "Popular",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    NormalButton(
                      size: ScreenSize.small,
                      text: "New",
                      onTap: () {},
                    ),
                  ],
                ),
                const SubforumDropdown()
              ],
            ))
      ],
    );
  }
}
