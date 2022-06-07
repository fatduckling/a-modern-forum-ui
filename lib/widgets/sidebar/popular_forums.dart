import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/sidebar/sidebar_panel_template.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Popular forums panel
class PopularForums extends StatelessWidget {
  const PopularForums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemCount = 6;
    return Container(
        decoration: const BoxDecoration(
          color: AppColourTheme.light,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SidebarPanelTemplate(
          title: "Popular Forums",
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1,
                color: AppColourTheme.neutralLight.w300,
              );
            },
            itemBuilder: (context, index) => Container(
                color: Colors.transparent,
                child: Material(
                    color: AppColourTheme.neutralLight.w300,
                    child: Ink(
                      decoration: BoxDecoration(
                          color: AppColourTheme.light,
                          borderRadius: index == itemCount - 1
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))
                              : null),
                      child: InkWell(
                        borderRadius: index == itemCount - 1
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))
                            : null,
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/avatar.png",
                                    width: 48,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Subforum $index",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: AppTextTheme.body2bold(context)
                                              ?.merge(const TextStyle(
                                            color: AppColourTheme.dark,
                                            height: 1,
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Wrap(
                                        children: const [
                                          IconWithText(
                                              icon: FontAwesomeIcons.comment,
                                              iconSize: 16,
                                              text: "000"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          IconWithText(
                                            icon: FontAwesomeIcons.comments,
                                            text: "000",
                                            iconSize: 16,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ), // other widget
                        ),
                      ),
                    ))),
          ),
        ));
  }
}
