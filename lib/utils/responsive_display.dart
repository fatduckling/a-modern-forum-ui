import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ScreenSize can be story (mobile phones), medium (tablets), large (desktop web)
enum ScreenSize { extraSmall, small, medium, large, extraLarge }

/// Simple utility class used to determine whether the device is story, medium or large
class ResponsiveDisplay {
  /// Extra-story devices (portrait phones, 576 and up)
  static const _breakpointExtraSmallDevice = 576;

  /// Small devices (landscape phones, 744 and up)
  static const _breakpointSmallDevice = 744;

  /// Large devices (desktops, 1280 and up)
  static const _breakpointLargeDevice = 1280;

  /// Extra large devices (desktop 1780 and up)
  static const _breakpointExtraLargeDevice = 1780;

  /// Flex width of the main container
  static const mainContainerFlex = 32;

  /// Check if the device is considered extra story based on the page [width]
  static bool isExtraSmallDevice(final double width) {
    return width <= _breakpointExtraSmallDevice;
  }

  /// Check if the device is considered story based on the page [width]
  static bool isSmallDevice(final double width) {
    return width > _breakpointExtraSmallDevice &&
        width <= _breakpointSmallDevice;
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
      case ScreenSize.extraSmall:
        return 2;
      case ScreenSize.small:
        return 4;
      case ScreenSize.medium:
        return 8;
      case ScreenSize.large:
        return 12;
      case ScreenSize.extraLarge:
        return 16;
    }
  }

  /// Within the page flex bounds, get the flex amount of the main container.
  /// This reserves some space for a right section
  static int getMainContainerFlex(final ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.extraSmall: // TODO test me
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
    ScreenResizeObserver observer = buildContext.read<ScreenResizeObserver>();
    return observer.screenSize;
  }

  /// Return the screen size based on the device's [width]
  static ScreenSize getScreenSize(final double width) {
    if (isExtraLargeDevice(width)) {
      return ScreenSize.extraLarge;
    } else if (isLargeDevice(width)) {
      return ScreenSize.large;
    } else if (isMediumDevice(width)) {
      return ScreenSize.medium;
    } else if (isSmallDevice(width)) {
      return ScreenSize.small;
    } else {
      return ScreenSize.extraSmall;
    }
  }

  /// Get the height of a button based on its size
  static double getButtonHeight(final ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.extraSmall:
        return 20;
      case ScreenSize.small:
        return 40;
      case ScreenSize.medium:
        return 50;
      case ScreenSize.large:
        return 60;
      case ScreenSize.extraLarge:
        return 70;
    }
  }
}
