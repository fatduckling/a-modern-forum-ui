import 'package:a_modern_forum_project/models/comments/comment_model.dart';
import 'package:a_modern_forum_project/models/comments/comments_model.dart';
import 'package:a_modern_forum_project/utils/time_util.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded_outline/small/small_outline_button.dart';
import 'package:a_modern_forum_project/widgets/load_more_comments/load_more_comments.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  /// Holds all the comments and their replies
  final CommentsModel model;

  const CommentBox({required this.model, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentBox();
}

class _CommentBox extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    const iconSizeFlex = 50;
    final commentCount = widget.model.totalComments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H1("$commentCount comment${(commentCount == 1 ? '' : 's')}"),
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: commentCount,
            itemBuilder: (BuildContext buildContext, int index) {
              CommentModel comment = widget.model.getComment(index);
              return IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: iconSizeFlex,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 48,
                          ),
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                hoverColor: Colors.black12,
                                child: Ink(
                                  width: 20,
                                  color: Colors.transparent,
                                  child: Center(
                                      child: Container(
                                    width: 2,
                                    color: Colors.black26,
                                  )),
                                ),
                                onTap: () {},
                              ),
                            ),
                          )),
                        ],
                      )),
                  Expanded(
                      flex: 1000 - iconSizeFlex,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    comment.user,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  TimeUtil.whenTimestampAgo(comment.timestamp),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.more_horiz,
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                    flex: 1000 - iconSizeFlex,
                                    child: Text(comment.response))
                              ],
                            ),
                            IntrinsicHeight(
                                child: Row(
                              children: [
                                Expanded(
                                  flex: 1000 - iconSizeFlex,
                                  child: Row(
                                    children: [
                                      const UpDownVotes(),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black45,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        comment.totalReplies <= 0
                                            ? "No replies"
                                            : "+ ${comment.totalReplies} " +
                                                (comment.totalReplies == 1
                                                    ? "reply"
                                                    : "replies"),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const SmallOutlineButton(
                                        text: "Reply",
                                        colour: Colors.black,
                                        icon: Icons.messenger_outline,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                            const SizedBox(
                              height: 20,
                            ),
                          ]))
                ],
              ));
            }),
        const LoadMoreCommentsButton(),
      ],
    );
  }
}
