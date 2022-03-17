import 'package:a_modern_forum_project/models/thread/thread_model.dart';

/// Displays a list of images in the thread
class ImagesModel extends ThreadModel {
  /// List of network images to display
  List<String> images;

  ImagesModel({required bool isCompact, required this.images})
      : super(isCompact);
}
