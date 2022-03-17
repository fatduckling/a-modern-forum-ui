/// Holds information about the thread contents to display
abstract class ThreadModel {
  /// If is compact, only a summary of the thread contents are shown.
  /// Otherwise, the whole contents of the thread contents are shown.
  bool isCompact;

  ThreadModel(this.isCompact);
}
