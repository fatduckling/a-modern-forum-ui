import 'package:timeago/timeago.dart' as timeago;

/// Utils involving
class TimeUtil {
  /// get the human readable text that represents how long ago a [timestamp] occurred
  static String whenTimestampAgo(int timestamp) {
    return timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}
