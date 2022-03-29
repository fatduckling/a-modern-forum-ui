/// Used to represent a single comment
class CommentModel {
  /// Id of the comment
  int commentId = 0;

  /// HTTP URL of the user's avatar
  String avatarUrl = "";

  /// User name
  String user = "";

  /// Comment response
  String response = "";

  /// Epoch timestamp when the comment was mate
  int timestamp = 0;

  /// Number of up votes - number of down votes
  int rating = 0;

  /// If the user has up-voted on the comment
  bool hasUpVoted = false;

  /// If the user has down-voted on the comment
  bool hasDownVoted = false;

  /// Replies to this comment
  List<CommentModel> replies = [];

  /// Total number of replies
  int totalReplies = 0;

  /// If true, a comment text editor box will be visible under the comment
  bool showReplyTextEditor = false;

  /// If true, the comment's responses will be shown
  bool showResponses = false;

  /// No replies (empty list)
  static const List<CommentModel> _noReplies = [];

  /// Named constructor
  CommentModel(
      {this.commentId = 0,
      this.avatarUrl = "",
      this.user = "",
      this.response = "",
      this.timestamp = 0,
      this.rating = 0,
      this.hasUpVoted = false,
      this.hasDownVoted = false,
      this.replies = _noReplies,
      this.totalReplies = 0,
      this.showReplyTextEditor = false,
      this.showResponses = false});
}
