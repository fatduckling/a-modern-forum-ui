class FlairSelectorController {
  /// Height of overlay
  static const int height = 400;

  /// Callbacks
  final List<Function(bool)> callbacks = [];

  /// Add a listener
  void addListener(Function(bool) callback) {
    callbacks.add(callback);
  }

  void stateChanged(bool open) {
    for (Function(bool) callback in callbacks) {
      callback.call(open);
    }
  }

  /// Dispose
  void dispose() {
    callbacks.clear();
  }
}
