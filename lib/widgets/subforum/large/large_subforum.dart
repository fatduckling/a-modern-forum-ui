import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/recent_post/recent_post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Large subforum in the forum discover/explore page
class LargeSubforum extends StatelessWidget {
  const LargeSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Ink(
            child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    IntrinsicHeight(
                        child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    size: 48,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(
                                    "Beginners Forum",
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.h4(context),
                                  )),
                                ])),
                        Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                    child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              IconWithText(
                                                  icon:
                                                      FontAwesomeIcons.message,
                                                  text: "12345"),
                                            ])),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              IconWithText(
                                                  icon:
                                                      FontAwesomeIcons.comment,
                                                  text: "67890"),
                                            ])),
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            VerticalDivider(
                                                color: Colors.black12)
                                          ],
                                        )),
                                    const Expanded(flex: 5, child: RecentPost())
                                  ],
                                ))
                              ],
                            ))
                      ],
                    ))
                  ],
                )),
          ),
        ));
  }
}
