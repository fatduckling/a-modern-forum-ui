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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Template for displaying threads on large devices
class LargeThreadTemplate extends StatefulWidget {
  /// Thread model holds the information of the thread
  final ThreadModel threadModel;

  const LargeThreadTemplate(this.threadModel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LargeThreadTemplate();
}

class _LargeThreadTemplate extends State<LargeThreadTemplate> {
  /// If the mouse is hovering over the container
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              // first row: shows user icon, subforum name, username, timestamp and save icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Image.asset("assets/images/avatar.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Posted in ", style: AppTextTheme.body3(context)),
                    Text("Other",
                        style: AppTextTheme.body3(context)
                            ?.apply(decoration: TextDecoration.underline)),
                    Text(" by ", style: AppTextTheme.body3(context)),
                    Text("User123",
                        style: AppTextTheme.body3(context)
                            ?.apply(decoration: TextDecoration.underline)),
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("6 hours ago", style: AppTextTheme.body3(context)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.bookmark_border_outlined,
                        size: 36,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // second row: shows the post title and flair
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Text(
                    "Post title goes here",
                    style: AppTextTheme.body1(context)
                        ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                  )),
                  NormalButton(
                    size: ScreenSize.small,
                    text: "info",
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // third row: thread body
              ResponsiveThreadTemplate.buildThreadBody(widget.threadModel),
              // fourth row: shows up/down votes, comment count and view count
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const UpDownVotes(),
                  Row(
                    children: const [
                      IconWithText(icon: FontAwesomeIcons.comment, text: "37"),
                      SizedBox(
                        width: 10,
                      ),
                      IconWithText(icon: FontAwesomeIcons.eye, text: "38")
                    ],
                  )
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
