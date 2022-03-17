import 'package:a_modern_forum_project/models/thread/thread_model.dart';

/// Used to display a poll thread
class PollModel extends ThreadModel {
  /// Polling data: the key of the map is the question and the value is the
  /// voting count. The voting count is not used if [showingResults] is false
  Map<String, int> pollingData;

  /// If true, the graph of the results are shown, otherwise, the questions are shown
  bool showingResults = false;

  /// If true, multiple answers can be chosen
  bool allowMultipleAnswers = false;

  PollModel({
    required bool isCompact,
    required this.pollingData,
    this.showingResults = false,
    this.allowMultipleAnswers = false,
  }) : super(isCompact);
}
