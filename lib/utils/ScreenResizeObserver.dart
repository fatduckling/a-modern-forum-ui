import 'package:flutter/material.dart';

/// Used to notify widgets that the screen has resized
class ScreenResizeNotifier with ChangeNotifier {
  void onScreenResized() {
    notifyListeners();
  }
}
