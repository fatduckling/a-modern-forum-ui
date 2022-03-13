import 'dart:math';

import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/appbar/large/large_app_bar.dart';
import 'package:a_modern_forum_project/widgets/threads/template/responsive_thread_template.dart';
import 'package:a_modern_forum_project/widgets/threads/types/image_thread.dart';
import 'package:a_modern_forum_project/widgets/threads/types/poll_thread.dart';
import 'package:a_modern_forum_project/widgets/threads/types/text_thread.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Displays text posts for large devices
class LargeThreadView extends StatefulWidget {
  const LargeThreadView({Key? key}) : super(key: key);

  @override
  _LargeThreadView createState() => _LargeThreadView();
}

class _LargeThreadView extends State<LargeThreadView> {
  /// Used to increase the size of the SizedBox to give a 'sticky' effect
  double _fixedYPositionOffset = 0;

  /// The original Y position of the key widget
  double _originalKeyYPosition = 0;

  /// Floating widget key
  final GlobalKey _floatingWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      enableStickySidebar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(
          flex: ResponsiveDisplay.pageBoundsFlex,
        ),
        Expanded(
            flex: 49,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (buildContext, index) {
                  if (index == 0) {
                    return const ResponsiveThreadTemplate(
                        threadBody: PollThread());
                  } else if (index % 5 != 0) {
                    return const ResponsiveThreadTemplate(
                        threadBody: TextThread());
                  } else {
                    return const ResponsiveThreadTemplate(
                        threadBody: ImageThread(
                      url: "https://i.imgur.com/zBovHrK.jpg",
                    ));
                  }
                })),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 14,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text("Hello world"),
                    ))
                  ],
                ),
                SizedBox(
                  height: _fixedYPositionOffset,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          key: _floatingWidgetKey,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text("Hello world"),
                    ))
                  ],
                ),
              ],
            )),
        const Spacer(
          flex: ResponsiveDisplay.pageBoundsFlex,
        ),
      ],
    );
  }

  /// Enable the sticky sidebar if it's found
  void enableStickySidebar() {
    /// Set the original key's Y position
    /// Return true if the widget's position is successfully computed, false otherwise
    bool updateOriginalKeyYPosition() {
      RenderObject? renderObject =
          _floatingWidgetKey.currentContext?.findRenderObject();
      bool foundRenderObject = renderObject != null;
      if (foundRenderObject) {
        RenderBox box = renderObject as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        _originalKeyYPosition = position.dy - LargeAppBar.appBarHeight;
      }
      return foundRenderObject;
    }

    /// If the widget key is found, then set the offset variable according to the scroll position
    if (updateOriginalKeyYPosition()) {
      ScrollObserver scrollObserver =
          Provider.of<ScrollObserver>(context, listen: false);
      scrollObserver.addListener(() {
        if (mounted) {
          setState(() {
            _fixedYPositionOffset = max(
                0, scrollObserver.scrollPosition - _originalKeyYPosition + 5);
          });
        }
      });
    }
  }
}
