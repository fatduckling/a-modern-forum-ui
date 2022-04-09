import 'package:a_modern_forum_project/models/comments/comment_model.dart';

/// Used to hold comments
class CommentsModel {
  /// List of comments on the post
  final List<CommentModel> comments;

  /// Total number of comments
  int totalComments = 0;

  /// Constructor
  CommentsModel(this.comments, {this.totalComments = 0});

  /// Return a comment at the index
  CommentModel getComment(int index) {
    return comments[index];
  }

  static CommentModel buildCommentModel(
      String name, List<CommentModel> replies) {
    return CommentModel(
        commentId: 0,
        user: name,
        response: "This is a great comment by $name\n" * 3,
        timestamp: 1648183873000,
        rating: 343,
        showResponses: true,
        replies: replies,
        totalReplies: name.length % 2 == 0 ? replies.length : 20);
  }

  /// Build a sample comments model used for testing TODO delete method
  static CommentsModel buildSampleModel() {
    List<CommentModel> comments = [
      buildCommentModel("Comment0 User", []),
      buildCommentModel("Comment1 User", [
        buildCommentModel("Comment10 User", []),
        buildCommentModel("Comment11 User", [
          buildCommentModel("Comment110 User", []),
          buildCommentModel("Comment111 User", [
            buildCommentModel("Comment1110 User", []),
            buildCommentModel("Comment1111 User", [
              buildCommentModel("Comment11110 User", []),
              buildCommentModel("Comment11111 User", [
                buildCommentModel("Comment111110 User", []),
                buildCommentModel("Comment111111 User", [
                  buildCommentModel("Comment1111110 User", []),
                  buildCommentModel("Comment1111111 User", [
                    buildCommentModel("Comment11111110 User", []),
                    buildCommentModel("Comment11111111 User", [
                      buildCommentModel("Comment111111110 User", []),
                      buildCommentModel("Comment111111111 User", []),
                    ]),
                  ]),
                ]),
              ])
            ])
          ])
        ])
      ]),
      buildCommentModel("Comment2 User", []),
      buildCommentModel("Comment3 User", [
        buildCommentModel("Comment30 User", []),
        buildCommentModel("Comment31 User", [
          buildCommentModel("Comment310 User", []),
          buildCommentModel("Comment311 User", [
            buildCommentModel("Comment3110 User", []),
            buildCommentModel("Comment3111 User", []),
          ]),
        ]),
      ]),
    ];
    return CommentsModel(comments, totalComments: comments.length);
  }
}
