import 'package:a_modern_forum_project/models/thread/thread_model.dart';
import 'package:a_modern_forum_project/routes/view_post.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/fa_icon_button/fa_icon_button.dart';
import 'package:a_modern_forum_project/widgets/flair/flair.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/threads/template/responsive_thread_template.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Template for displaying threads on small devices
class SmallThreadTemplate extends StatefulWidget {
  /// Thread model holds the information of the thread
  final ThreadModel threadModel;

  const SmallThreadTemplate(this.threadModel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SmallThreadTemplate();
}

class _SmallThreadTemplate extends State<SmallThreadTemplate> {
  /// If the mouse is hovering over the container
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          onHover: (_isHovered) {
            setState(() {
              isHovered = _isHovered;
            });
          },
          onTap: widget.threadModel.isCompact
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      widget.threadModel.isCompact = false;
                      return ViewPostRoute(ResponsiveThreadTemplate(
                          threadModel: widget.threadModel));
                    }),
                  );
                }
              : null,
          child: Ink(
            decoration: BoxDecoration(
              color: AppColourTheme.light,
              border: Border.all(
                  color: isHovered
                      ? AppColourTheme.neutralDark.w50
                      : AppColourTheme.light),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // first row: shows user icon, subforum name, username, timestamp and save icon
                  Table(columnWidths: const {
                    0: FlexColumnWidth(13),
                    1: FlexColumnWidth(82),
                    2: FlexColumnWidth(5),
                  }, children: [
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset("assets/images/avatar.png"),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Other",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.body3(context)?.merge(
                                  TextStyle(
                                      height: 1,
                                      color: AppColourTheme.primary.w900))),
                          Text("Harry Potter",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.body3(context)?.merge(
                                  const TextStyle(
                                      decoration: TextDecoration.underline)))
                        ],
                      ),
                      FAIconButton(
                          icon: FontAwesomeIcons.ellipsisVertical,
                          tooltip: "More",
                          onTap: () {}),
                    ]),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  // second row: shows the post title and flair
                  Flexible(
                      child: Text(
                    "Post title goes here",
                    style: AppTextTheme.body1(context)
                        ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  // fourth row: shows flair and timestamp
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child: Flair()),
                        const SizedBox(
                          width: 5,
                        ),
                        IconWithText(
                          icon: FontAwesomeIcons.clock,
                          text: "3h",
                          iconSize: 16,
                          colour: AppColourTheme.neutralDark.normal,
                        ),
                      ]),
                  // third row: thread body
                  const SizedBox(
                    height: 10,
                  ),
                  ResponsiveThreadTemplate.buildThreadBody(widget.threadModel),
                  // fifth row: shows up/down votes, comment count, share and save buttons
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UpDownVotes(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FAIconButton(
                              icon: FontAwesomeIcons.shareNodes,
                              tooltip: "Share",
                              onTap: () {}),
                          const SizedBox(
                            width: 10,
                          ),
                          FAIconButton(
                              icon: FontAwesomeIcons.commentDots,
                              tooltip: "Read comments",
                              onTap: () {}),
                          const SizedBox(
                            width: 10,
                          ),
                          FAIconButton(
                              icon: FontAwesomeIcons.bookmark,
                              tooltip: "Save",
                              onTap: () {})
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
