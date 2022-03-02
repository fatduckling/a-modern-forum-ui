import 'package:flutter/material.dart';

/// Used to notify widgets that the screen has resized
class ScreenResizeObserver with ChangeNotifier {
  /// Window width
  double windowWidth = 0;

  /// Window height
  double windowHeight = 0;

  void onScreenResized(double width, double height) {
    windowWidth = width;
    windowHeight = height;
    notifyListeners();
  }
}
