import 'package:a_modern_forum_project/models/comments/comment_model.dart';
import 'package:a_modern_forum_project/models/comments/comments_model.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/utils/time_util.dart';
import 'package:a_modern_forum_project/widgets/buttons/bordered_button.dart';
import 'package:a_modern_forum_project/widgets/buttons/plain_button.dart';
import 'package:a_modern_forum_project/widgets/comment_editor/comment_editor.dart';
import 'package:a_modern_forum_project/widgets/load_more_comments/load_more_comments.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Table(columnWidths: const {
      0: FixedColumnWidth(50)
    }, children: [
      TableRow(children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/avatar.png",
                  width: 48,
                  height: 48,
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
                              color: AppColourTheme.neutralDark.w50,
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
                    ))
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
                    style: AppTextTheme.body2bold(context),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(TimeUtil.whenTimestampAgo(comment.timestamp),
                    style: AppTextTheme.body2light(context)
                        ?.apply(color: Colors.black54)),
                const SizedBox(
                  width: 5,
                ),
                const FaIcon(
                  FontAwesomeIcons.ellipsis,
                  size: 25,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    comment.response,
                    style: AppTextTheme.body3(context),
                  ),
                )
              ],
            ),
            IntrinsicHeight(
                child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const UpDownVotes(),
                      const SizedBox(
                        width: 5,
                      ),
                      VerticalDivider(
                        color: AppColourTheme.neutralDark.w300,
                      ),
                      PlainButton(
                        onTap: comment.totalReplies <= 0
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
                      BorderedButton(
                        size: ScreenSize.small,
                        text: comment.showReplyTextEditor
                            ? "Hide reply editor"
                            : "Reply",
                        colour: AppColourTheme.neutralDark.w50,
                        icon: comment.showReplyTextEditor
                            ? FontAwesomeIcons.keyboard
                            : FontAwesomeIcons.reply,
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
                ? Flexible(fit: FlexFit.loose, child: buildComments(comment))
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ]),
    ]);
  }

  /// Build the replies of the [parent] comment
  Widget buildComments(final CommentModel parent) {
    final List<CommentModel> comments = parent.replies;
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
        comments.length < parent.totalReplies
            ? const LoadMoreCommentsButton()
            : const SizedBox.shrink(),
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
        Text(
          "$commentCount comment${(commentCount == 1 ? '' : 's')}",
          style: AppTextTheme.h1(context),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
            fit: FlexFit.loose,
            child: buildComments(CommentModel(
                replies: widget.model.comments,
                totalReplies: widget.model.totalComments))),
      ],
    );
  }
}
