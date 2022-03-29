import 'package:a_modern_forum_project/models/comments/comment_model.dart';
import 'package:a_modern_forum_project/models/comments/comments_model.dart';
import 'package:a_modern_forum_project/utils/time_util.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded_outline/small/small_outline_button.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded_text_button/rounded_text_button.dart';
import 'package:a_modern_forum_project/widgets/comment_editor/comment_editor.dart';
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
  /// return a widget to render the [comment] and its responses
  Widget buildCommentAndItsResponses(CommentModel comment) {
    const iconSizeFlex = 50.0;
    return Table(columnWidths: const {
      0: FlexColumnWidth(iconSizeFlex),
      1: FlexColumnWidth(1000 - iconSizeFlex)
    }, children: [
      TableRow(children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  size: 48,
                ),
                Flexible(
                    fit: FlexFit.loose,
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
                          onTap: () {
                            if (comment.replies.isNotEmpty) {
                              setState(() {
                                comment.showResponses = !comment.showResponses;
                              });
                            }
                          },
                        ),
                      ),
                    )),
              ],
            )),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    comment.user,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                    flex: 1000 - iconSizeFlex as int,
                    child: Text(comment.response))
              ],
            ),
            IntrinsicHeight(
                child: Row(
              children: [
                Expanded(
                  flex: 1000.0 - iconSizeFlex as int,
                  child: Row(
                    children: [
                      const UpDownVotes(),
                      const SizedBox(
                        width: 5,
                      ),
                      const VerticalDivider(
                        color: Colors.black45,
                      ),
                      RoundedTextButton(
                        callback: comment.totalReplies <= 0
                            ? null
                            : () {
                                setState(() {
                                  comment.showResponses =
                                      !comment.showResponses;
                                });
                              },
                        text: comment.totalReplies <= 0
                            ? "No replies"
                            : "+ ${comment.totalReplies} " +
                                (comment.totalReplies == 1
                                    ? "reply"
                                    : "replies"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallOutlineButton(
                        text: comment.showReplyTextEditor
                            ? "Hide reply editor"
                            : "Reply",
                        colour: Colors.black,
                        icon: comment.showReplyTextEditor
                            ? Icons.keyboard_hide
                            : Icons.messenger_outline,
                        onTap: () {
                          setState(() {
                            comment.showReplyTextEditor =
                                !comment.showReplyTextEditor;
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            )),
            SizedBox(
              height: comment.showReplyTextEditor ? 20 : 0,
            ),
            comment.showReplyTextEditor
                ? CommentEditor(
                    iconSize: 48,
                    placeholder: "Replying to ${comment.user}",
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height:
                  comment.showResponses && comment.replies.isNotEmpty ? 10 : 0,
            ),
            comment.showResponses
                ? Flexible(
                    fit: FlexFit.loose, child: buildComments(comment.replies))
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ]),
    ]);
  }

  /// Build the [comments] which will be rendered in a Column
  Widget buildComments(final List<CommentModel> comments) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (BuildContext buildContext, int index) {
              CommentModel comment = comments[index];
              return buildCommentAndItsResponses(comment);
            }),
        const LoadMoreCommentsButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final commentCount = widget.model.totalComments;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H1("$commentCount comment${(commentCount == 1 ? '' : 's')}"),
        const SizedBox(
          height: 15,
        ),
        Flexible(
            fit: FlexFit.loose, child: buildComments(widget.model.comments)),
      ],
    );
  }
}
