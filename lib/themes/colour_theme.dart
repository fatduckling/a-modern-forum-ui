import 'package:flutter/material.dart';

/// Colour palette
class Palette {
  final Color w50, w300, w500, w700, w900;

  /// default colour
  Color normal = AppColourTheme.light;

  /// Initialise the colours
  Palette({
    required this.w50,
    required this.w300,
    required this.w500,
    required this.w700,
    required this.w900,
  }) {
    normal = w700;
  }
}

class AppColourTheme {
  /// Default text colour
  static final Color defaultTextColour = neutralDark.w900;

  /// Primary colour theme
  static final Palette primary = Palette(
    w50: const Color(0xffB2E3FF),
    w300: const Color(0xff73BBE5),
    w500: const Color(0xff369DD9),
    w700: const Color(0xff087CBF),
    w900: const Color(0xff006199),
  );

  /// Secondary colour theme
  static final Palette secondary = Palette(
    w50: const Color(0xffFFDDB2),
    w300: const Color(0xffF2C185),
    w500: const Color(0xffE5A250),
    w700: const Color(0xffDD861D),
    w900: const Color(0xff94642c),
  );

  /// Tertiary colour theme
  static final Palette tertiary = Palette(
    w50: const Color(0xffFFCCD0),
    w300: const Color(0xffF2AAB0),
    w500: const Color(0xffEB8D95),
    w700: const Color(0xffE2606C),
    w900: const Color(0xfff5d8db),
  );

  /// Dark colour theme
  static const Color light = Color(0xffffffff);

  /// Dark colour theme
  static const Color dark = Color(0xff0D2634);

  /// Neutral light colour theme
  static final Palette neutralLight = Palette(
    w50: const Color(0xffF7F7F7),
    w300: const Color(0xffF0F4F5),
    w500: const Color(0xffDEDEDE),
    w700: const Color(0xffBAC2C4),
    w900: const Color(0xffB0B0B0),
  );

  /// Neutral dark colour theme
  static final Palette neutralDark = Palette(
    w50: const Color(0xff9E9E9E),
    w300: const Color(0xff858585),
    w500: const Color(0xff6B6B6B),
    w700: const Color(0xff525252),
    w900: const Color(0xff383838),
  );
}
