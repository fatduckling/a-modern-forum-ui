import 'package:flutter/cupertino.dart';

/// Used to control the PollOptions widget
class PollController {
  /// List of controllers
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController()
  ];

  /// Clear all the controllers
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    controllers.clear();
  }

  /// Create a new poll option
  void addPollOption() {
    controllers.add(TextEditingController());
  }

  /// Get the number of available poll options
  int size() {
    return controllers.length;
  }
}
