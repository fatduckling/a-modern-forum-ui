import 'package:flutter/material.dart';

/// Simple utility class used to determine whether the device is small, medium or large
class ResponsiveDisplay {
  /// Small devices (landscape phones, 576px and up)
  static const _breakpointSmallDevice = 768;

  /// Large devices (desktops, 992px and up)
  static const _breakpointLargeDevice = 992;

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
}
