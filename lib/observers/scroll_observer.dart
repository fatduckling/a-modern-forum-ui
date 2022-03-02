import 'package:flutter/material.dart';

/// Used to provide a notification when the user has scrolled in the page
class ScrollObserver with ChangeNotifier {
  /// The x or y position of the scroll
  double scrollPosition = 0;

  onScroll(double scrollPosition) {
    this.scrollPosition = scrollPosition;
    notifyListeners();
  }
}
