import 'package:flutter/material.dart';

/// Custom text theme
class AppTextTheme {
  /// heading 1
  static TextStyle? h1(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 35));
  }

  /// heading 2 (bold)
  static TextStyle? h2bold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }

  /// heading 3
  static TextStyle? h3(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 25));
  }

  /// heading 3 (bold)
  static TextStyle? h3bold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
  }

  /// heading 4
  static TextStyle? h4(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 20, height: 1.4));
  }

  /// body 1
  static TextStyle? body1(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 18));
  }

  /// body 2
  static TextStyle? body2(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 16, height: 1.6));
  }

  /// body 2 (bold)
  static TextStyle? body2bold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2?.merge(const TextStyle(
        fontSize: 16, height: 1.6, fontWeight: FontWeight.bold));
  }

  /// body 2 (light)
  static TextStyle? body2light(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2?.merge(const TextStyle(
        fontSize: 16, height: 1.6, fontWeight: FontWeight.w300));
  }

  /// body 3
  static TextStyle? body3(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: 14, height: 1.6));
  }
}
