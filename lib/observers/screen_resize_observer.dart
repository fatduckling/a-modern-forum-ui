import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Used to notify widgets that the screen has resized
class ScreenResizeObserver with ChangeNotifier {
  /// Window width
  double windowWidth = 0;

  /// Window height
  double windowHeight = 0;

  /// Screen size
  ScreenSize screenSize = ScreenSize.small;

  void onScreenResized(double width, double height) {
    windowWidth = width;
    windowHeight = height;
    final ScreenSize newScreenSize =
        ResponsiveDisplay.getScreenSize(windowWidth);
    if (newScreenSize != screenSize) {
      screenSize = newScreenSize;
      notifyListeners();
    }
  }
}
