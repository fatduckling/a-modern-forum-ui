import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/threads/text/responsive_text_thread.dart';
import 'package:flutter/material.dart';

class ThreadView extends StatelessWidget {
  final ScreenSize _screenSize;

  const ThreadView(ScreenSize screenSize, {Key? key})
      : _screenSize = screenSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 8,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (buildContext, index) {
                  return ResponsiveTextThread(_screenSize);
                })),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
