import 'package:a_modern_forum_project/models/comments/comment_model.dart';

/// Used to hold comments
class CommentsModel {
  /// List of comments on the post
  final List<CommentModel> _comments;

  /// Total number of comments
  int totalComments = 0;

  /// Constructor
  CommentsModel(this._comments, {this.totalComments = 0});

  /// Return a comment at the index
  CommentModel getComment(int index) {
    return _comments[index];
  }

  /// Build a sample comments model used for testing TODO delete method
  static CommentsModel buildSampleModel() {
    List<CommentModel> comments = [];
    for (int i = 0; i < 5; i++) {
      CommentModel comment = CommentModel(
          commentId: i,
          user: "Clancy Footerman",
          response: "This is a great comment\n" * (i + 1),
          timestamp: 1648183873000,
          rating: 343,
          totalReplies: i);
      comments.add(comment);
    }
    return CommentsModel(comments, totalComments: comments.length);
  }
}
