import 'package:flutter/material.dart';

/// ScreenSize can be small (mobile phones), medium (tablets), large (desktop web)
enum ScreenSize { small, medium, large, extraLarge }

/// Simple utility class used to determine whether the device is small, medium or large
class ResponsiveDisplay {
  /// Small devices (landscape phones, 744 and up)
  static const _breakpointSmallDevice = 744;

  /// Large devices (desktops, 1280 and up)
  static const _breakpointLargeDevice = 1280;

  /// Extra large devices (desktop 1780 and up)
  static const _breakpointExtraLargeDevice = 1780;

  /// Flex width of the main container
  static const mainContainerFlex = 32;

  /// Check if the device is considered small based on the page [width]
  static bool isSmallDevice(final double width) {
    return width <= _breakpointSmallDevice;
  }

  /// Check if the device is considered medium based on the page [width]
  static bool isMediumDevice(final double width) {
    return width > _breakpointSmallDevice && width <= _breakpointLargeDevice;
  }

  /// Check if the device is considered large based on the page [width]
  static bool isLargeDevice(final double width) {
    return width > _breakpointLargeDevice &&
        width <= _breakpointExtraLargeDevice;
  }

  /// Check if the device is considered extra large based on the page [width]
  static bool isExtraLargeDevice(final double width) {
    return width > _breakpointExtraLargeDevice;
  }

  /// Get the page bounds of the main container based on its screen size
  static int getPageBoundsFlex(final ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.small: // TODO test me
        return 12;
      case ScreenSize.medium: // TODO test me
        return 14;
      case ScreenSize.large:
        return 12;
      case ScreenSize.extraLarge:
        return 18;
    }
  }

  /// Within the page flex bounds, get the flex amount of the main container.
  /// This reserves some space for a right section
  static int getMainContainerFlex(final ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.small:
        return 50; // TODO Test me
      case ScreenSize.medium:
        return 50; // TODO Test me
      case ScreenSize.large:
        return 57;
      case ScreenSize.extraLarge:
        return 50;
    }
  }

  /// Return the screen size based on its box [constraints]
  static ScreenSize getScreenSizeFromBoxConstraints(
      final BoxConstraints constraints) {
    final double width = constraints.maxWidth;
    return getScreenSize(width);
  }

  /// Return the screen size based on the [buildContext]
  static ScreenSize getScreenSizeFromContext(final BuildContext buildContext) {
    final double width = MediaQuery.of(buildContext).size.width;
    return getScreenSize(width);
  }

  /// Return the screen size based on the device's [width]
  static ScreenSize getScreenSize(final double width) {
    if (isExtraLargeDevice(width)) {
      return ScreenSize.extraLarge;
    } else if (isLargeDevice(width)) {
      return ScreenSize.large;
    } else if (isMediumDevice(width)) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }
}
