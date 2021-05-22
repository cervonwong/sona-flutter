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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

/// This maps color constants and gives context to them to be dynamic.
class ColorNotifier extends ChangeNotifier {
  ColorTheme _theme;
  static final _onLight = _OnLightColorGroup();
  static final _onDark = _OnDarkColorGroup();
  static final _specificLight = _LightSpecificColorGroup();
  static final _specificDark = _DarkSpecificColorGroup();

  ColorTheme get theme => _theme;

  set theme(ColorTheme newTheme) {
    assert(newTheme != null);

    if (_theme == newTheme) return;

    _theme = newTheme;
    notifyListeners();
  }

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

  _ColorGroup get onPrimary => _onDark;

  _ColorGroup get onSurface {
    switch (_theme) {
      case ColorTheme.light:
        return _onLight;
      case ColorTheme.dark:
        return _onDark;
      default:
        throw UnimplementedError();
    }
  }

  _ColorGroup get onBackground => onSurface; // They have similar brightnesses.

  _SpecificColorGroup get specific {
    switch (_theme) {
      case ColorTheme.light:
        return _specificLight;
      case ColorTheme.dark:
        return _specificDark;
      default:
        throw UnimplementedError();
    }
  }

  ColorNotifier({
    @required ColorTheme theme,
  })  : assert(theme != null),
        _theme = theme;
}

/// Colors are generally darker to contrast against lighter colors.
class _OnLightColorGroup implements _ColorGroup {
  @override
  Color get splashColor => kDarkSplashColor;

  @override
  Color get highlightColor => kDarkHighlightColor;

  @override
  Color get primarySplashColor => kPrimarySplashColor;

  @override
  Color get primaryHighlightColor => kPrimaryHighlightColor;

  @override
  Color get highEmphasisColor => kOnLightHighEmphasisColor;

  @override
  Color get mediumEmphasisColor => kOnLightMediumEmphasisColor;

  @override
  Color get lowEmphasisColor => kOnLightLowEmphasisColor;

  @override
  Color get accentRedColor => kAccentRedColor;

  @override
  Color get accentOrangeColor => kAccentOrangeColor;

  @override
  Color get accentYellowColor => kAccentYellowColor;

  @override
  Color get accentLimeColor => kAccentLimeColor;

  @override
  Color get accentGreenColor => kAccentGreenColor;

  @override
  Color get accentTealColor => kAccentTealColor;

  @override
  Color get accentCyanColor => kAccentCyanColor;

  @override
  Color get accentSkyColor => kAccentSkyColor;

  @override
  Color get accentBlueColor => kAccentBlueColor;

  @override
  Color get accentPurpleColor => kAccentPurpleColor;

  @override
  Color get accentPinkColor => kAccentPinkColor;

  @override
  Color get textFillBrownColor => kTextFillBrownColor;

  @override
  Color get textFillGrayColor4 => kTextFillOnLightGrayColor4;

  @override
  Color get textFillGrayColor3 => kTextFillOnLightGrayColor3;

  @override
  Color get textFillGrayColor2 => kTextFillOnLightGrayColor2;

  @override
  Color get textFillGrayColor1 => kTextFillOnLightGrayColor1;

  @override
  Color get textHighlightRedColor => kTextHighlightOnLightRedColor;

  @override
  Color get textHighlightOrangeColor => kTextHighlightOnLightOrangeColor;

  @override
  Color get textHighlightYellowColor => kTextHighlightOnLightYellowColor;

  @override
  Color get textHighlightLimeColor => kTextHighlightOnLightLimeColor;

  @override
  Color get textHighlightGreenColor => kTextHighlightOnLightGreenColor;

  @override
  Color get textHighlightTealColor => kTextHighlightOnLightTealColor;

  @override
  Color get textHighlightCyanColor => kTextHighlightOnLightCyanColor;

  @override
  Color get textHighlightSkyColor => kTextHighlightOnLightSkyColor;

  @override
  Color get textHighlightBlueColor => kTextHighlightOnLightBlueColor;

  @override
  Color get textHighlightPurpleColor => kTextHighlightOnLightPurpleColor;

  @override
  Color get textHighlightPinkColor => kTextHighlightOnLightPinkColor;
}

/// Colors are generally lighter to contrast against darker colors.
class _OnDarkColorGroup implements _ColorGroup {
  @override
  Color get splashColor => kLightSplashColor;

  @override
  Color get highlightColor => kLightHighlightColor;

  @override
  // TODO: implement primarySplashColor
  Color get primarySplashColor => throw UnimplementedError();

  @override
  // TODO: implement primaryHighlightColor
  Color get primaryHighlightColor => throw UnimplementedError();

  @override
  Color get highEmphasisColor => kOnDarkHighEmphasisColor;

  @override
  Color get mediumEmphasisColor => kOnDarkMediumEmphasisColor;

  @override
  Color get lowEmphasisColor => kOnDarkLowEmphasisColor;

  @override
  Color get accentRedColor => kAccentRedColor;

  @override
  Color get accentOrangeColor => kAccentOrangeColor;

  @override
  Color get accentYellowColor => kAccentYellowColor;

  @override
  Color get accentLimeColor => kAccentLimeColor;

  @override
  Color get accentGreenColor => kAccentGreenColor;

  @override
  Color get accentTealColor => kAccentTealColor;

  @override
  Color get accentCyanColor => kAccentCyanColor;

  @override
  Color get accentSkyColor => kAccentSkyColor;

  @override
  Color get accentBlueColor => kAccentBlueColor;

  @override
  Color get accentPurpleColor => kAccentPurpleColor;

  @override
  Color get accentPinkColor => kAccentPinkColor;

  @override
  Color get textFillBrownColor => kTextFillBrownColor;

  @override
  Color get textFillGrayColor4 => kTextFillOnDarkGrayColor4;

  @override
  Color get textFillGrayColor3 => kTextFillOnDarkGrayColor3;

  @override
  Color get textFillGrayColor2 => kTextFillOnDarkGrayColor2;

  @override
  Color get textFillGrayColor1 => kTextFillOnDarkGrayColor1;

  @override
  Color get textHighlightRedColor => kTextHighlightOnDarkRedColor;

  @override
  Color get textHighlightOrangeColor => kTextHighlightOnDarkOrangeColor;

  @override
  Color get textHighlightYellowColor => kTextHighlightOnDarkYellowColor;

  @override
  Color get textHighlightLimeColor => kTextHighlightOnDarkLimeColor;

  @override
  Color get textHighlightGreenColor => kTextHighlightOnDarkGreenColor;

  @override
  Color get textHighlightTealColor => kTextHighlightOnDarkTealColor;

  @override
  Color get textHighlightCyanColor => kTextHighlightOnDarkCyanColor;

  @override
  Color get textHighlightSkyColor => kTextHighlightOnDarkSkyColor;

  @override
  Color get textHighlightBlueColor => kTextHighlightOnDarkBlueColor;

  @override
  Color get textHighlightPurpleColor => kTextHighlightOnDarkPurpleColor;

  @override
  Color get textHighlightPinkColor => kTextHighlightOnDarkPinkColor;
}

abstract class _ColorGroup {
  Color get splashColor;

  Color get highlightColor;

  Color get primarySplashColor;

  Color get primaryHighlightColor;

  Color get highEmphasisColor;

  Color get mediumEmphasisColor;

  Color get lowEmphasisColor;

  Color get accentRedColor;

  Color get accentOrangeColor;

  Color get accentYellowColor;

  Color get accentLimeColor;

  Color get accentGreenColor;

  Color get accentTealColor;

  Color get accentCyanColor;

  Color get accentSkyColor;

  Color get accentBlueColor;

  Color get accentPurpleColor;

  Color get accentPinkColor;

  Color get textFillBrownColor;

  Color get textFillGrayColor4;

  Color get textFillGrayColor3;

  Color get textFillGrayColor2;

  Color get textFillGrayColor1;

  Color get textHighlightRedColor;

  Color get textHighlightOrangeColor;

  Color get textHighlightYellowColor;

  Color get textHighlightLimeColor;

  Color get textHighlightGreenColor;

  Color get textHighlightTealColor;

  Color get textHighlightCyanColor;

  Color get textHighlightSkyColor;

  Color get textHighlightBlueColor;

  Color get textHighlightPurpleColor;

  Color get textHighlightPinkColor;
}

class _LightSpecificColorGroup extends _SpecificColorGroup {
  @override
  Color get scrimColor => kScrimColor;
}

class _DarkSpecificColorGroup extends _SpecificColorGroup {
  @override
  // TODO: implement drawerScrimColor
  Color get scrimColor => throw UnimplementedError();
}

abstract class _SpecificColorGroup {
  Color get scrimColor;
}

enum ColorTheme { light, dark }
