import 'package:a_modern_forum_project/models/thread/thread_model.dart';
import 'package:a_modern_forum_project/models/thread/types/images_model.dart';
import 'package:a_modern_forum_project/models/thread/types/poll_model.dart';
import 'package:a_modern_forum_project/models/thread/types/text_model.dart';
import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/text/error.dart';
import 'package:a_modern_forum_project/widgets/threads/template/large/large_thread_template.dart';
import 'package:a_modern_forum_project/widgets/threads/types/images_thread.dart';
import 'package:a_modern_forum_project/widgets/threads/types/poll_thread.dart';
import 'package:a_modern_forum_project/widgets/threads/types/text_thread.dart';
import 'package:a_modern_forum_project/widgets/unhandled_widget/unhandled_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget that holds the thread's header and footer
class ResponsiveThreadTemplate extends StatelessWidget {
  /// Thread model holds the information of the thread
  final ThreadModel threadModel;

  const ResponsiveThreadTemplate({required this.threadModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        context.watch<ScreenResizeObserver>().screenSize;
    switch (screenSize) {
      case ScreenSize.small:
      case ScreenSize.medium:
      return const UnhandledWidget("ResponsiveThreadTemplate");
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return LargeThreadTemplate(threadModel);
    }
  }

  /// Build the widget used to display the thread contents
  static Widget buildThreadBody(ThreadModel threadModel) {
    if (threadModel is TextModel) {
      return TextThread(model: threadModel);
    } else if (threadModel is ImagesModel) {
      return ImagesThread(model: threadModel);
    } else if (threadModel is PollModel) {
      return PollThread(model: threadModel);
    }
    return const ErrorText(
        "Failed to determine the runtime type of the thread model");
  }
}
