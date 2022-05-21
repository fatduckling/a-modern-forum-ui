import 'dart:math';

import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/widgets/sticky_sidebar/popular_forums.dart';
import 'package:a_modern_forum_project/widgets/sticky_sidebar/sidebar_home.dart';
import 'package:a_modern_forum_project/widgets/sticky_sidebar/useful_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickySidebar extends StatefulWidget {
  const StickySidebar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StickySidebar();
}

class _StickySidebar extends State<StickySidebar> {
  /// Used to increase the size of the SizedBox to give a 'sticky' effect
  double _fixedYPositionOffset = 0;

  /// The original Y position of the key widget
  double _originalKeyYPosition = 0;

  /// Floating widget key
  final GlobalKey _floatingWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      enableStickySidebar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SidebarHome(),
          const SizedBox(height: 10),
          const PopularForums(),
          const SizedBox(height: 10),
          SizedBox(
            height: _fixedYPositionOffset,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      key: _floatingWidgetKey, child: const UsefulLinks()))
            ],
          ),
        ],
      ),
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
        _originalKeyYPosition = position.dy - kToolbarHeight;
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
                0, scrollObserver.scrollPosition - _originalKeyYPosition - 50);
          });
        }
      });
    }
  }
}
