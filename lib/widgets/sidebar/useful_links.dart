import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/widgets/buttons/plain_button.dart';
import 'package:a_modern_forum_project/widgets/sidebar/sidebar_panel_template.dart';
import 'package:flutter/material.dart';

/// Useful links panel
class UsefulLinks extends StatelessWidget {
  const UsefulLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColourTheme.light,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SidebarPanelTemplate(
          title: "Useful links",
          child: Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 100 / 25,
              children: [
                PlainButton(
                  text: "Home",
                  onTap: () {},
                ),
                PlainButton(
                  text: "Explore",
                  onTap: () {},
                ),
                PlainButton(
                  text: "About",
                  onTap: () {},
                ),
                PlainButton(
                  text: "Contact",
                  onTap: () {},
                ),
                PlainButton(
                  text: "Terms of Service",
                  onTap: () {},
                ),
                PlainButton(
                  text: "Privacy Policy",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
