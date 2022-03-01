import 'package:flutter/material.dart';

class ScrollObserver with ChangeNotifier {
  double scrollPosition = 0;

  onScroll(double scrollPosition) {
    this.scrollPosition = scrollPosition;
    notifyListeners();
  }
}
