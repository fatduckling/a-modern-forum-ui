import 'package:flutter/material.dart';

/// ScreenSize can be small (mobile phones), medium (tablets), large (desktop web)
enum ScreenSize { small, medium, large }

/// Simple utility class used to determine whether the device is small, medium or large
class ResponsiveDisplay {
  /// Small devices (landscape phones, 768 and up)
  static const _breakpointSmallDevice = 768;

  /// Large devices (desktops, 1280 and up)
  static const _breakpointLargeDevice = 1280;

  /// Check if the device is considered small based on its box [constraints]
  static bool isSmallDevice(final BoxConstraints constraints) {
    final width = constraints.maxWidth;
    return width <= _breakpointSmallDevice;
  }

  /// Check if the device is considered small based on its box [constraints]
  static bool isMediumDevice(final BoxConstraints constraints) {
    final width = constraints.maxWidth;
    return width > _breakpointSmallDevice && width < _breakpointLargeDevice;
  }

  /// Check if the device is considered small based on its box [constraints]
  static bool isLargeDevice(final BoxConstraints constraints) {
    final width = constraints.maxWidth;
    return width >= _breakpointLargeDevice;
  }

  /// Return the screen size based on its box [constraints]
  static ScreenSize getScreenSize(final BoxConstraints constraints) {
    if (isLargeDevice(constraints)) {
      return ScreenSize.large;
    } else if (isMediumDevice(constraints)) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }
}
