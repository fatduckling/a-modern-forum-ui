import 'package:a_modern_forum_project/models/thread/thread_model.dart';

/// Used to display a text thread
class TextModel extends ThreadModel {
  /// Information about the thread
  String text;

  TextModel({required bool isCompact, required this.text}) : super(isCompact);
}
