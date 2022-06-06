import 'package:a_modern_forum_project/models/thread/thread_model.dart';
import 'package:a_modern_forum_project/routes/view_post.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/threads/template/responsive_thread_template.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';

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
                  color: isHovered ? Colors.black26 : AppColourTheme.light),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // first row: shows user icon, subforum name, username, timestamp and save icon
                  Table(columnWidths: const {
                    0: FlexColumnWidth(12),
                    1: FlexColumnWidth(85),
                    2: FixedColumnWidth(5)
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
                      const Icon(Icons.more_vert_outlined),
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
                  // third row: thread body
                  ResponsiveThreadTemplate.buildThreadBody(widget.threadModel),
                  // fourth row: shows flair and timestamp
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: NormalButton(
                          size: ScreenSize.extraSmall,
                          text: "no politics",
                          borderRadius: 0,
                          backgroundColour: AppColourTheme.neutralLight.w900,
                          onTap: () {},
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        IconWithText(
                          icon: Icons.access_time_outlined,
                          text: "3h",
                          iconSize: 16,
                          colour: AppColourTheme.neutralDark.normal,
                        ),
                      ]),
                  // fifth row: shows up/down votes, comment count, share and save buttons
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      IconWithText(
                          icon: Icons.mode_comment_outlined, text: "37"),
                      IconWithText(
                          icon: Icons.bookmark_add_outlined, text: "Save"),
                      IconWithText(icon: Icons.share_outlined, text: "Share"),
                      UpDownVotes(),
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
