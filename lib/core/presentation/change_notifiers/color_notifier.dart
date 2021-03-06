/*
 * Sona is a cross-platform educational app which helps you remember
 * facts easier, developed with Flutter.
 * Copyright (C) 2020, 2021 Cervon Wong
 *
 * Sona is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Sona is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

enum ColorTheme { light, dark }

/// This maps color constants and gives context to them to be dynamic.
///
/// "On colors" are colors that depend on the color that is under them. "On
/// colors" can be on "primary", "accent", "surface", or "background". If the
/// surface color changes from being a light color in light mode to a dark color
/// in dark mode, accessing "on colors" will return a color with appropriate
/// contrast. Note that getting colors which are on "light" or "dark" is
/// impossible. Some colors such as the accent colors have the same value no
/// matter which surface it is on.
///
/// "Thematic colors" are colors that depend on the theme only, and do not
/// depend on what color is under it. This might be because there the color is
/// usually not drawn on top of another color. For example,
/// `ThemeData.backgroundColor`, which only depends on the theme. "Thematic
/// colors" may have different values for different themes.
class ColorNotifier extends ChangeNotifier {
  ColorTheme _theme;

  ColorTheme get theme => _theme;

  set theme(ColorTheme newTheme) {
    if (_theme == newTheme) return;

    _theme = newTheme;
    notifyListeners();
  }

  ColorNotifier({
    required ColorTheme theme,
  }) : _theme = theme;

  // Referenced in MaterialApp's themeMode argument.
  ThemeMode get themeMode {
    switch (_theme) {
      case ColorTheme.light:
        return ThemeMode.light;
      case ColorTheme.dark:
        return ThemeMode.dark;
      default:
        throw UnimplementedError();
    }
  }

  OnColors get onPrimary => _onDarkColors;

  OnColors get onAccent => _onDarkColors;

  OnColors get onSurface {
    switch (_theme) {
      case ColorTheme.light:
        return _onLightColors;
      case ColorTheme.dark:
        return _onDarkColors;
      default:
        throw UnimplementedError();
    }
  }

  OnColors get onBackground => onSurface;

  ThematicColors get thematic {
    switch (_theme) {
      case ColorTheme.light:
        return _lightThemeColors;
      case ColorTheme.dark:
        return _darkThemeColors;
      default:
        throw UnimplementedError();
    }
  }
}

@immutable
class OnColorId {
  final String name;

  // Private constructor to prevent instantiation of invalid IDs outside this
  // file.
  const OnColorId._({required this.name});
}

@immutable
class OnColors {
  static const shadowPrimaryId = OnColorId._(name: 'shadowPrimary');
  static const splashNeutralId = OnColorId._(name: 'splashNeutral');
  static const splashPrimaryId = OnColorId._(name: 'splashPrimary');
  static const highlightNeutralId = OnColorId._(name: 'highlightNeutral');
  static const highlightPrimaryId = OnColorId._(name: 'highlightPrimary');
  static const highEmphasisId = OnColorId._(name: 'highEmphasis');
  static const mediumEmphasisId = OnColorId._(name: 'mediumEmphasis');
  static const lowEmphasisId = OnColorId._(name: 'lowEmphasis');
  static const accentRedId = OnColorId._(name: 'accentRed');
  static const accentOrangeId = OnColorId._(name: 'accentOrange');
  static const accentYellowId = OnColorId._(name: 'accentYellow');
  static const accentLimeId = OnColorId._(name: 'accentLime');
  static const accentGreenId = OnColorId._(name: 'accentGreen');
  static const accentTealId = OnColorId._(name: 'accentTeal');
  static const accentCyanId = OnColorId._(name: 'accentCyan');
  static const accentSkyId = OnColorId._(name: 'accentSky');
  static const accentBlueId = OnColorId._(name: 'accentBlue');
  static const accentPurpleId = OnColorId._(name: 'accentPurple');
  static const accentPinkId = OnColorId._(name: 'accentPink');
  static const textFillBrownId = OnColorId._(name: 'textFillBrown');
  static const textFillGray4Id = OnColorId._(name: 'textFillGray4');
  static const textFillGray3Id = OnColorId._(name: 'textFillGray3');
  static const textFillGray2Id = OnColorId._(name: 'textFillGray2');
  static const textFillGray1Id = OnColorId._(name: 'textFillGray1');
  static const textHighlightRedId = OnColorId._(name: 'textHighlightRed');
  static const textHighlightOrangeId = OnColorId._(name: 'textHighlightOrange');
  static const textHighlightYellowId = OnColorId._(name: 'textHighlightYellow');
  static const textHighlightLimeId = OnColorId._(name: 'textHighlightLime');
  static const textHighlightGreenId = OnColorId._(name: 'textHighlightGreen');
  static const textHighlightTealId = OnColorId._(name: 'textHighlightTeal');
  static const textHighlightCyanId = OnColorId._(name: 'textHighlightCyan');
  static const textHighlightSkyId = OnColorId._(name: 'textHighlightSky');
  static const textHighlightBlueId = OnColorId._(name: 'textHighlightBlue');
  static const textHighlightPurpleId = OnColorId._(name: 'textHighlightPurple');
  static const textHighlightPinkId = OnColorId._(name: 'textHighlightPink');
  static const borderRegularId = OnColorId._(name: 'borderRegular');
  static const borderLightId = OnColorId._(name: 'borderLight');

  final Color shadowPrimary;
  final Color splashNeutral;
  final Color splashPrimary;
  final Color highlightNeutral;
  final Color highlightPrimary;
  final Color highEmphasis;
  final Color mediumEmphasis;
  final Color lowEmphasis;
  final Color accentRed;
  final Color accentOrange;
  final Color accentYellow;
  final Color accentLime;
  final Color accentGreen;
  final Color accentTeal;
  final Color accentCyan;
  final Color accentSky;
  final Color accentBlue;
  final Color accentPurple;
  final Color accentPink;
  final Color textFillBrown;
  final Color textFillGray4;
  final Color textFillGray3;
  final Color textFillGray2;
  final Color textFillGray1;
  final Color textHighlightRed;
  final Color textHighlightOrange;
  final Color textHighlightYellow;
  final Color textHighlightLime;
  final Color textHighlightGreen;
  final Color textHighlightTeal;
  final Color textHighlightCyan;
  final Color textHighlightSky;
  final Color textHighlightBlue;
  final Color textHighlightPurple;
  final Color textHighlightPink;
  final Color borderRegular;
  final Color borderLight;

  // Private constructor to prevent instantiation of invalid color groups
  // outside this file.
  const OnColors._({
    required this.shadowPrimary,
    required this.splashNeutral,
    required this.splashPrimary,
    required this.highlightNeutral,
    required this.highlightPrimary,
    required this.highEmphasis,
    required this.mediumEmphasis,
    required this.lowEmphasis,
    required this.accentRed,
    required this.accentOrange,
    required this.accentYellow,
    required this.accentLime,
    required this.accentGreen,
    required this.accentTeal,
    required this.accentCyan,
    required this.accentSky,
    required this.accentBlue,
    required this.accentPurple,
    required this.accentPink,
    required this.textFillBrown,
    required this.textFillGray4,
    required this.textFillGray3,
    required this.textFillGray2,
    required this.textFillGray1,
    required this.textHighlightRed,
    required this.textHighlightOrange,
    required this.textHighlightYellow,
    required this.textHighlightLime,
    required this.textHighlightGreen,
    required this.textHighlightTeal,
    required this.textHighlightCyan,
    required this.textHighlightSky,
    required this.textHighlightBlue,
    required this.textHighlightPurple,
    required this.textHighlightPink,
    required this.borderRegular,
    required this.borderLight,
  });

  Color get({required OnColorId id}) {
    final idToVariable = {
      shadowPrimaryId: shadowPrimary,
      splashNeutralId: splashNeutral,
      splashPrimaryId: splashPrimary,
      highlightNeutralId: highlightNeutral,
      highlightPrimaryId: highlightPrimary,
      highEmphasisId: highEmphasis,
      mediumEmphasisId: mediumEmphasis,
      lowEmphasisId: lowEmphasis,
      accentRedId: accentRed,
      accentOrangeId: accentOrange,
      accentYellowId: accentYellow,
      accentLimeId: accentLime,
      accentGreenId: accentGreen,
      accentTealId: accentTeal,
      accentCyanId: accentCyan,
      accentSkyId: accentSky,
      accentBlueId: accentBlue,
      accentPurpleId: accentPurple,
      accentPinkId: accentPink,
      textFillBrownId: textFillBrown,
      textFillGray4Id: textFillGray4,
      textFillGray3Id: textFillGray3,
      textFillGray2Id: textFillGray2,
      textFillGray1Id: textFillGray1,
      textHighlightRedId: textHighlightRed,
      textHighlightOrangeId: textHighlightOrange,
      textHighlightYellowId: textHighlightYellow,
      textHighlightLimeId: textHighlightLime,
      textHighlightGreenId: textHighlightGreen,
      textHighlightTealId: textHighlightTeal,
      textHighlightCyanId: textHighlightCyan,
      textHighlightSkyId: textHighlightSky,
      textHighlightBlueId: textHighlightBlue,
      textHighlightPurpleId: textHighlightPurple,
      textHighlightPinkId: textHighlightPink,
      borderRegularId: borderRegular,
      borderLightId: borderLight,
    };

    assert(idToVariable.containsKey(id));
    return idToVariable[id]!;
  }
}

const _onLightColors = OnColors._(
  shadowPrimary: ColorConstants.shadowPrimaryOnLight,
  splashNeutral: ColorConstants.splashNeutralOnLight,
  splashPrimary: ColorConstants.splashPrimary,
  highlightNeutral: ColorConstants.highlightNeutralOnLight,
  highlightPrimary: ColorConstants.highlightPrimary,
  highEmphasis: ColorConstants.onLightHighEmphasis,
  mediumEmphasis: ColorConstants.onLightMediumEmphasis,
  lowEmphasis: ColorConstants.onLightLowEmphasis,
  accentRed: ColorConstants.accentRed,
  accentOrange: ColorConstants.accentOrange,
  accentYellow: ColorConstants.accentYellow,
  accentLime: ColorConstants.accentLime,
  accentGreen: ColorConstants.accentGreen,
  accentTeal: ColorConstants.accentTeal,
  accentCyan: ColorConstants.accentCyan,
  accentSky: ColorConstants.accentSky,
  accentBlue: ColorConstants.accentBlue,
  accentPurple: ColorConstants.accentPurple,
  accentPink: ColorConstants.accentPink,
  textFillBrown: ColorConstants.textFillBrown,
  textFillGray4: ColorConstants.textFill_OnLight_Gray4,
  textFillGray3: ColorConstants.textFill_OnLight_Gray3,
  textFillGray2: ColorConstants.textFill_OnLight_Gray2,
  textFillGray1: ColorConstants.textFill_OnLight_Gray1,
  textHighlightRed: ColorConstants.textHighlight_OnLight_Red,
  textHighlightOrange: ColorConstants.textHighlight_OnLight_Orange,
  textHighlightYellow: ColorConstants.textHighlight_OnLight_Yellow,
  textHighlightLime: ColorConstants.textHighlight_OnLight_Lime,
  textHighlightGreen: ColorConstants.textHighlight_OnLight_Green,
  textHighlightTeal: ColorConstants.textHighlight_OnLight_Teal,
  textHighlightCyan: ColorConstants.textHighlight_OnLight_Cyan,
  textHighlightSky: ColorConstants.textHighlight_OnLight_Sky,
  textHighlightBlue: ColorConstants.textHighlight_OnLight_Blue,
  textHighlightPurple: ColorConstants.textHighlight_OnLight_Purple,
  textHighlightPink: ColorConstants.textHighlight_OnLight_Pink,
  borderRegular: ColorConstants.neutral4,
  borderLight: ColorConstants.neutral3,
);

const _onDarkColors = OnColors._(
  shadowPrimary: Colors.red,
  // TODO: implement shadowPrimary
  splashNeutral: ColorConstants.splashNeutralOnDark,
  splashPrimary: Colors.red,
  // TODO: implement splashPrimary
  highlightNeutral: ColorConstants.highlightNeutralOnDark,
  highlightPrimary: Colors.red,
  // TODO: implement highlightPrimary
  highEmphasis: ColorConstants.onDarkHighEmphasis,
  mediumEmphasis: ColorConstants.onDarkMediumEmphasis,
  lowEmphasis: ColorConstants.onDarkLowEmphasis,
  accentRed: ColorConstants.accentRed,
  accentOrange: ColorConstants.accentOrange,
  accentYellow: ColorConstants.accentYellow,
  accentLime: ColorConstants.accentLime,
  accentGreen: ColorConstants.accentGreen,
  accentTeal: ColorConstants.accentTeal,
  accentCyan: ColorConstants.accentCyan,
  accentSky: ColorConstants.accentSky,
  accentBlue: ColorConstants.accentBlue,
  accentPurple: ColorConstants.accentPurple,
  accentPink: ColorConstants.accentPink,
  textFillBrown: ColorConstants.textFillBrown,
  textFillGray4: ColorConstants.textFill_OnDark_Gray4,
  textFillGray3: ColorConstants.textFill_OnDark_Gray3,
  textFillGray2: ColorConstants.textFill_OnDark_Gray2,
  textFillGray1: ColorConstants.textFill_OnDark_Gray1,
  textHighlightRed: ColorConstants.textHighlight_OnDark_Red,
  textHighlightOrange: ColorConstants.textHighlight_OnDark_Orange,
  textHighlightYellow: ColorConstants.textHighlight_OnDark_Yellow,
  textHighlightLime: ColorConstants.textHighlight_OnDark_Lime,
  textHighlightGreen: ColorConstants.textHighlight_OnDark_Green,
  textHighlightTeal: ColorConstants.textHighlight_OnDark_Teal,
  textHighlightCyan: ColorConstants.textHighlight_OnDark_Cyan,
  textHighlightSky: ColorConstants.textHighlight_OnDark_Sky,
  textHighlightBlue: ColorConstants.textHighlight_OnDark_Blue,
  textHighlightPurple: ColorConstants.textHighlight_OnDark_Purple,
  textHighlightPink: ColorConstants.textHighlight_OnDark_Pink,
  borderRegular: Colors.red,
  // TODO: implement borderRegular
  borderLight: Colors.red, // TODO: implement borderLight
);

@immutable
class ThematicColors {
  final Color scrim;

  // Private constructor to prevent instantiation of invalid color groups
  // outside this file.
  const ThematicColors._({
    required this.scrim,
  });
}

const _lightThemeColors = ThematicColors._(
  scrim: ColorConstants.scrim,
);

const _darkThemeColors = ThematicColors._(
  scrim: Colors.red, // TODO: implement scrim
);
