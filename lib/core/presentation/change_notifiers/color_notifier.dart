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
  Color get splashColor => ColorConstants.darkSplash;

  @override
  Color get highlightColor => ColorConstants.darkHighlight;

  @override
  Color get primarySplashColor => ColorConstants.primarySplash;

  @override
  Color get primaryHighlightColor => ColorConstants.primaryHighlight;

  @override
  Color get highEmphasisColor => ColorConstants.onLightHighEmphasis;

  @override
  Color get mediumEmphasisColor => ColorConstants.onLightMediumEmphasis;

  @override
  Color get lowEmphasisColor => ColorConstants.onLightLowEmphasis;

  @override
  Color get accentRedColor => ColorConstants.accentRed;

  @override
  Color get accentOrangeColor => ColorConstants.accentOrange;

  @override
  Color get accentYellowColor => ColorConstants.accentYellow;

  @override
  Color get accentLimeColor => ColorConstants.accentLime;

  @override
  Color get accentGreenColor => ColorConstants.accentGreen;

  @override
  Color get accentTealColor => ColorConstants.accentTeal;

  @override
  Color get accentCyanColor => ColorConstants.accentCyan;

  @override
  Color get accentSkyColor => ColorConstants.accentSky;

  @override
  Color get accentBlueColor => ColorConstants.accentBlue;

  @override
  Color get accentPurpleColor => ColorConstants.accentPurple;

  @override
  Color get accentPinkColor => ColorConstants.accentPink;

  @override
  Color get textFillBrownColor => ColorConstants.textFillBrown;

  @override
  Color get textFillGrayColor4 => ColorConstants.textFillOnLightGray4;

  @override
  Color get textFillGrayColor3 => ColorConstants.textFillOnLightGray3;

  @override
  Color get textFillGrayColor2 => ColorConstants.textFillOnLightGray2;

  @override
  Color get textFillGrayColor1 => ColorConstants.textFillOnLightGray1;

  @override
  Color get textHighlightRedColor => ColorConstants.textHighlightOnLightRed;

  @override
  Color get textHighlightOrangeColor => ColorConstants.textHighlightOnLightOrange;

  @override
  Color get textHighlightYellowColor => ColorConstants.textHighlightOnLightYellow;

  @override
  Color get textHighlightLimeColor => ColorConstants.textHighlightOnLightLime;

  @override
  Color get textHighlightGreenColor => ColorConstants.textHighlightOnLightGreen;

  @override
  Color get textHighlightTealColor => ColorConstants.textHighlightOnLightTeal;

  @override
  Color get textHighlightCyanColor => ColorConstants.textHighlightOnLightCyan;

  @override
  Color get textHighlightSkyColor => ColorConstants.textHighlightOnLightSky;

  @override
  Color get textHighlightBlueColor => ColorConstants.textHighlightOnLightBlue;

  @override
  Color get textHighlightPurpleColor => ColorConstants.textHighlightOnLightPurple;

  @override
  Color get textHighlightPinkColor => ColorConstants.textHighlightOnLightPink;
}

/// Colors are generally lighter to contrast against darker colors.
class _OnDarkColorGroup implements _ColorGroup {
  @override
  Color get splashColor => ColorConstants.lightSplash;

  @override
  Color get highlightColor => ColorConstants.lightHighlight;

  @override
  // TODO: implement primarySplashColor
  Color get primarySplashColor => throw UnimplementedError();

  @override
  // TODO: implement primaryHighlightColor
  Color get primaryHighlightColor => throw UnimplementedError();

  @override
  Color get highEmphasisColor => ColorConstants.onDarkHighEmphasis;

  @override
  Color get mediumEmphasisColor => ColorConstants.onDarkMediumEmphasis;

  @override
  Color get lowEmphasisColor => ColorConstants.onDarkLowEmphasis;

  @override
  Color get accentRedColor => ColorConstants.accentRed;

  @override
  Color get accentOrangeColor => ColorConstants.accentOrange;

  @override
  Color get accentYellowColor => ColorConstants.accentYellow;

  @override
  Color get accentLimeColor => ColorConstants.accentLime;

  @override
  Color get accentGreenColor => ColorConstants.accentGreen;

  @override
  Color get accentTealColor => ColorConstants.accentTeal;

  @override
  Color get accentCyanColor => ColorConstants.accentCyan;

  @override
  Color get accentSkyColor => ColorConstants.accentSky;

  @override
  Color get accentBlueColor => ColorConstants.accentBlue;

  @override
  Color get accentPurpleColor => ColorConstants.accentPurple;

  @override
  Color get accentPinkColor => ColorConstants.accentPink;

  @override
  Color get textFillBrownColor => ColorConstants.textFillBrown;

  @override
  Color get textFillGrayColor4 => ColorConstants.textFillOnDarkGray4;

  @override
  Color get textFillGrayColor3 => ColorConstants.textFillOnDarkGray3;

  @override
  Color get textFillGrayColor2 => ColorConstants.textFillOnDarkGray2;

  @override
  Color get textFillGrayColor1 => ColorConstants.textFillOnDarkGray1;

  @override
  Color get textHighlightRedColor => ColorConstants.textHighlightOnDarkRed;

  @override
  Color get textHighlightOrangeColor => ColorConstants.textHighlightOnDarkOrange;

  @override
  Color get textHighlightYellowColor => ColorConstants.textHighlightOnDarkYellow;

  @override
  Color get textHighlightLimeColor => ColorConstants.textHighlightOnDarkLime;

  @override
  Color get textHighlightGreenColor => ColorConstants.textHighlightOnDarkGreen;

  @override
  Color get textHighlightTealColor => ColorConstants.textHighlightOnDarkTeal;

  @override
  Color get textHighlightCyanColor => ColorConstants.textHighlightOnDarkCyan;

  @override
  Color get textHighlightSkyColor => ColorConstants.textHighlightOnDarkSky;

  @override
  Color get textHighlightBlueColor => ColorConstants.textHighlightOnDarkBlue;

  @override
  Color get textHighlightPurpleColor => ColorConstants.textHighlightOnDarkPurple;

  @override
  Color get textHighlightPinkColor => ColorConstants.textHighlightOnDarkPink;
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
  Color get scrimColor => ColorConstants.scrim;
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
