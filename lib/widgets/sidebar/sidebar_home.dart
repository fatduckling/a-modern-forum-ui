import 'package:a_modern_forum_project/routes/create_post.dart';
import 'package:a_modern_forum_project/routes/explore.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/sidebar/sidebar_panel_template.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Home sidebar panel
class SidebarHome extends StatelessWidget {
  const SidebarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColourTheme.light,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SidebarPanelTemplate(
          title: "Home",
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You can use this section to introduce the forum, set rules or greet the users.",
                  style: AppTextTheme.body2(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalButton(
                  text: "Start thread",
                  icon: FontAwesomeIcons.plus,
                  iconSize: 16,
                  mainAxisSize: MainAxisSize.max,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePostRoute()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalButton(
                  text: "Explore Forums",
                  icon: FontAwesomeIcons.tableCells,
                  iconSize: 16,
                  mainAxisSize: MainAxisSize.max,
                  backgroundColour: AppColourTheme.secondary.normal,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExploreRoute()),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
