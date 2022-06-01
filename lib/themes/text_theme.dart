import 'package:flutter/material.dart';

/// Supported text styles
enum AppTextStyle {
  h1,
  h2bold,
  h3,
  h3bold,
  h4,
  body1,
  body2,
  body2bold,
  body2light,
  body3
}

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

  /// Get a text style
  static TextStyle? getTextStyle(BuildContext context, AppTextStyle style) {
    switch (style) {
      case AppTextStyle.h1:
        return h1(context);
      case AppTextStyle.h2bold:
        return h2bold(context);
      case AppTextStyle.h3:
        return h3(context);
      case AppTextStyle.h3bold:
        return h3bold(context);
      case AppTextStyle.h4:
        return h4(context);
      case AppTextStyle.body1:
        return body1(context);
      case AppTextStyle.body2:
        return body2(context);
      case AppTextStyle.body2bold:
        return body2bold(context);
      case AppTextStyle.body2light:
        return body2light(context);
      case AppTextStyle.body3:
        return body3(context);
    }
  }
}
