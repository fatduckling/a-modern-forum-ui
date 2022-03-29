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

  /// Build a sample comments model used for testing TODO delete method
  static CommentsModel buildSampleModel() {
    List<CommentModel> comments = [];
    for (int i = 0; i < 5; i++) {
      CommentModel comment = CommentModel(
          commentId: i,
          user: "Clancy Footerman $i",
          response: "This is a great comment\n" * (i + 1),
          timestamp: 1648183873000,
          rating: 343,
          replies: i == 1
              ? [
                  CommentModel(
                      commentId: i + 20,
                      user: "Clancy Footerman nested 1 ${i + 20}",
                      response: "This is a great comment\n" * (i + 21),
                      timestamp: 1648183873000,
                      rating: 343,
                      totalReplies: 0)
                ]
              : (i == 2
                  ? [
                      CommentModel(
                          commentId: i + 20,
                          user: "Clancy Footerman nested 1 ${i + 20}",
                          response: "This is a great comment\n" * (i + 21),
                          timestamp: 1648183873000,
                          replies: [
                            CommentModel(
                                commentId: i + 20,
                                user: "Clancy Footerman nested 2-1 ${i + 20}",
                                response: "This is a great comment\n" * (i + 4),
                                timestamp: 1648183873000,
                                rating: 343,
                                totalReplies: i),
                            CommentModel(
                                commentId: i + 20,
                                user: "Clancy Footerman nested 2-2 ${i + 20}",
                                response: "This is a great comment\n" * (i + 4),
                                timestamp: 1648183873000,
                                rating: 343,
                                totalReplies: i)
                          ],
                          rating: 343,
                          totalReplies: 2)
                    ]
                  : []),
          totalReplies: i);
      comments.add(comment);
    }
    return CommentsModel(comments, totalComments: comments.length);
  }
}
