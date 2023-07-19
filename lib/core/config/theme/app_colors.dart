import 'package:flutter/material.dart';

/// Styles class holding app color information
/// and helper methods
class AppColors {
  /// App primary color
  static const Color primary = Color(0xFF00A884);

  /// App secondary color
  static const Color secondary = Color(0xffFC698C);

  /// App black color
  static const Color black = Color(0xff141414);

  static const Color white = Color(0xffffffff);

  static const Color greenDark = Color(0xFF00A884);

  static const Color greenLight = Color(0xFF008069);

  static const Color blueDark = Color(0xFF53BDEB);

  static const Color blueLight = Color(0xFF027EB5);

  static const Color greyDark = Color(0xFF8696A0);

  static const Color greyLight = Color(0xFF667781);

  static const Color backgroundDark = Color(0xFF111B21);

  static const Color backgroundLight = Color(0xFFFFFFFF);

  static const Color greyBackground = Color(0xFF202C33);

  /// Returns a shade of a [Color] from a double value
  ///
  /// The 'darker' boolean determines whether the shade
  /// should be .1 darker or lighter than the provided color
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
