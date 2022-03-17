import 'package:a_modern_forum_project/models/thread/thread_model.dart';
import 'package:a_modern_forum_project/routes/view_post.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/threads/template/responsive_thread_template.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';

/// Template for displaying threads on large devices
class LargeThreadTemplate extends StatelessWidget {
  /// Thread model holds the information of the thread
  final ThreadModel threadModel;

  const LargeThreadTemplate(this.threadModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: threadModel.isCompact
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      threadModel.isCompact = false;
                      return ViewPost(
                          ResponsiveThreadTemplate(threadModel: threadModel));
                    }),
                  );
                }
              : null,
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              // first row: shows user icon, subforum name, username, timestamp and save icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.circle,
                          size: 36,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Posted in "),
                        Text(
                          "Other",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        Text(" by "),
                        Text(
                          "User123",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("6 hours ago"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
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
                    child: Text("How to navigate this forum " * 5,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24)),
                  ),
                  const SmallRoundedButton("Info")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // third row: thread body
              ResponsiveThreadTemplate.buildThreadBody(threadModel),
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
                      IconWithText(icon: Icons.mode_comment, text: "37"),
                      SizedBox(
                        width: 10,
                      ),
                      IconWithText(
                          icon: Icons.remove_red_eye_outlined, text: "38")
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
