import 'package:a_modern_forum_project/models/comments/comment_model.dart';
import 'package:a_modern_forum_project/models/comments/comments_model.dart';
import 'package:a_modern_forum_project/utils/time_util.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded_outline/small/small_outline_button.dart';
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: iconSizeFlex,
                        child: Icon(
                          Icons.circle,
                          size: 48,
                        ),
                      ),
                      Expanded(
                          flex: 1000 - iconSizeFlex,
                          child: Row(
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
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: iconSizeFlex,
                      ),
                      Flexible(
                          flex: 1000 - iconSizeFlex,
                          child: Text(comment.response))
                    ],
                  ),
                  IntrinsicHeight(
                      child: Row(
                    children: [
                      const Spacer(
                        flex: iconSizeFlex,
                      ),
                      Expanded(
                        flex: 1000 - iconSizeFlex,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UpDownVotes(),
                            SizedBox(
                              width: 5,
                            ),
                            VerticalDivider(
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              comment.totalReplies <= 0
                                  ? "No replies"
                                  : "+ ${comment.totalReplies} " +
                                      (comment.totalReplies == 1
                                          ? "reply"
                                          : "replies"),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallOutlineButton(
                              text: "Reply",
                              colour: Colors.black,
                              icon: Icons.messenger_outline,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  const Divider()
                ],
              );
            })
      ],
    );
  }
}
