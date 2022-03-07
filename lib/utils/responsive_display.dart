import 'package:flutter/material.dart';

/// ScreenSize can be small (mobile phones), medium (tablets), large (desktop web)
enum ScreenSize { small, medium, large }

/// Simple utility class used to determine whether the device is small, medium or large
class ResponsiveDisplay {
  /// Small devices (landscape phones, 768 and up)
  static const _breakpointSmallDevice = 768;

  /// Large devices (desktops, 1280 and up)
  static const _breakpointLargeDevice = 1280;

  /// Check if the device is considered small based on the page [width]
  static bool isSmallDevice(final double width) {
    return width <= _breakpointSmallDevice;
  }

  /// Check if the device is considered small based on the page [width]
  static bool isMediumDevice(final double width) {
    return width > _breakpointSmallDevice && width < _breakpointLargeDevice;
  }

  /// Check if the device is considered small based on the page [width]
  static bool isLargeDevice(final double width) {
    return width >= _breakpointLargeDevice;
  }

  /// Return the screen size based on its box [constraints]
  static ScreenSize getScreenSizeFromBoxConstraints(
      final BoxConstraints constraints) {
    final double width = constraints.maxWidth;
    if (isLargeDevice(width)) {
      return ScreenSize.large;
    } else if (isMediumDevice(width)) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }

  /// Return the screen size based on the [buildContext]
  static ScreenSize getScreenSizeFromBuildContext(
      final BuildContext buildContext) {
    final double width = MediaQuery.of(buildContext).size.width;
    if (isLargeDevice(width)) {
      return ScreenSize.large;
    } else if (isMediumDevice(width)) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }
}
