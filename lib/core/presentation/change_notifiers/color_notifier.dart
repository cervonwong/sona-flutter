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
class OnColors {
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

  const OnColors({
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
}

const _onLightColors = OnColors(
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
  textFillGray4: ColorConstants.textFillOnLightGray4,
  textFillGray3: ColorConstants.textFillOnLightGray3,
  textFillGray2: ColorConstants.textFillOnLightGray2,
  textFillGray1: ColorConstants.textFillOnLightGray1,
  textHighlightRed: ColorConstants.textHighlightOnLightRed,
  textHighlightOrange: ColorConstants.textHighlightOnLightOrange,
  textHighlightYellow: ColorConstants.textHighlightOnLightYellow,
  textHighlightLime: ColorConstants.textHighlightOnLightLime,
  textHighlightGreen: ColorConstants.textHighlightOnLightGreen,
  textHighlightTeal: ColorConstants.textHighlightOnLightTeal,
  textHighlightCyan: ColorConstants.textHighlightOnLightCyan,
  textHighlightSky: ColorConstants.textHighlightOnLightSky,
  textHighlightBlue: ColorConstants.textHighlightOnLightBlue,
  textHighlightPurple: ColorConstants.textHighlightOnLightPurple,
  textHighlightPink: ColorConstants.textHighlightOnLightPink,
  borderRegular: ColorConstants.neutral4,
  borderLight: ColorConstants.neutral3,
);

const _onDarkColors = OnColors(
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
  textFillGray4: ColorConstants.textFillOnDarkGray4,
  textFillGray3: ColorConstants.textFillOnDarkGray3,
  textFillGray2: ColorConstants.textFillOnDarkGray2,
  textFillGray1: ColorConstants.textFillOnDarkGray1,
  textHighlightRed: ColorConstants.textHighlightOnDarkRed,
  textHighlightOrange: ColorConstants.textHighlightOnDarkOrange,
  textHighlightYellow: ColorConstants.textHighlightOnDarkYellow,
  textHighlightLime: ColorConstants.textHighlightOnDarkLime,
  textHighlightGreen: ColorConstants.textHighlightOnDarkGreen,
  textHighlightTeal: ColorConstants.textHighlightOnDarkTeal,
  textHighlightCyan: ColorConstants.textHighlightOnDarkCyan,
  textHighlightSky: ColorConstants.textHighlightOnDarkSky,
  textHighlightBlue: ColorConstants.textHighlightOnDarkBlue,
  textHighlightPurple: ColorConstants.textHighlightOnDarkPurple,
  textHighlightPink: ColorConstants.textHighlightOnDarkPink,
  borderRegular: Colors.red,
  // TODO: implement borderRegular
  borderLight: Colors.red, // TODO: implement borderLight
);

@immutable
class ThematicColors {
  final Color scrim;

  const ThematicColors({
    required this.scrim,
  });
}

const _lightThemeColors = ThematicColors(
  scrim: ColorConstants.scrim,
);

const _darkThemeColors = ThematicColors(
  scrim: Colors.red, // TODO: implement scrim
);
