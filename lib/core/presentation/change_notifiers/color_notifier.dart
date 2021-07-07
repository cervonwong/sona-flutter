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
class ColorNotifier extends ChangeNotifier {
  ColorTheme _theme;
  static final _onLight = _OnLightColorGroup();
  static final _onDark = _OnDarkColorGroup();
  static final _specificLight = _LightSpecificColorGroup();
  static final _specificDark = _DarkSpecificColorGroup();

  ColorTheme get theme => _theme;

  set theme(ColorTheme newTheme) {
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

  _ColorGroup get onAccent => _onDark;

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
    required ColorTheme theme,
  }) : _theme = theme;
}

abstract class _ColorGroup {
  Color get shadowPrimary;

  Color get splashNeutral;

  Color get splashPrimary;

  Color get highlightNeutral;

  Color get highlightPrimary;

  Color get highEmphasis;

  Color get mediumEmphasis;

  Color get lowEmphasis;

  Color get accentRed;

  Color get accentOrange;

  Color get accentYellow;

  Color get accentLime;

  Color get accentGreen;

  Color get accentTeal;

  Color get accentCyan;

  Color get accentSky;

  Color get accentBlue;

  Color get accentPurple;

  Color get accentPink;

  Color get textFillBrown;

  Color get textFillGray4;

  Color get textFillGray3;

  Color get textFillGray2;

  Color get textFillGray1;

  Color get textHighlightRed;

  Color get textHighlightOrange;

  Color get textHighlightYellow;

  Color get textHighlightLime;

  Color get textHighlightGreen;

  Color get textHighlightTeal;

  Color get textHighlightCyan;

  Color get textHighlightSky;

  Color get textHighlightBlue;

  Color get textHighlightPurple;

  Color get textHighlightPink;

  Color get borderRegular;

  Color get borderLight;
}

/// Colors are generally darker to contrast against lighter colors.
class _OnLightColorGroup implements _ColorGroup {
  @override
  Color get shadowPrimary => ColorConstants.shadowPrimaryOnLight;

  @override
  Color get splashNeutral => ColorConstants.splashNeutralOnLight;

  @override
  Color get splashPrimary => ColorConstants.splashPrimary;

  @override
  Color get highlightNeutral => ColorConstants.highlightNeutralOnLight;

  @override
  Color get highlightPrimary => ColorConstants.highlightPrimary;

  @override
  Color get highEmphasis => ColorConstants.onLightHighEmphasis;

  @override
  Color get mediumEmphasis => ColorConstants.onLightMediumEmphasis;

  @override
  Color get lowEmphasis => ColorConstants.onLightLowEmphasis;

  @override
  Color get accentRed => ColorConstants.accentRed;

  @override
  Color get accentOrange => ColorConstants.accentOrange;

  @override
  Color get accentYellow => ColorConstants.accentYellow;

  @override
  Color get accentLime => ColorConstants.accentLime;

  @override
  Color get accentGreen => ColorConstants.accentGreen;

  @override
  Color get accentTeal => ColorConstants.accentTeal;

  @override
  Color get accentCyan => ColorConstants.accentCyan;

  @override
  Color get accentSky => ColorConstants.accentSky;

  @override
  Color get accentBlue => ColorConstants.accentBlue;

  @override
  Color get accentPurple => ColorConstants.accentPurple;

  @override
  Color get accentPink => ColorConstants.accentPink;

  @override
  Color get textFillBrown => ColorConstants.textFillBrown;

  @override
  Color get textFillGray4 => ColorConstants.textFillOnLightGray4;

  @override
  Color get textFillGray3 => ColorConstants.textFillOnLightGray3;

  @override
  Color get textFillGray2 => ColorConstants.textFillOnLightGray2;

  @override
  Color get textFillGray1 => ColorConstants.textFillOnLightGray1;

  @override
  Color get textHighlightRed => ColorConstants.textHighlightOnLightRed;

  @override
  Color get textHighlightOrange => ColorConstants.textHighlightOnLightOrange;

  @override
  Color get textHighlightYellow => ColorConstants.textHighlightOnLightYellow;

  @override
  Color get textHighlightLime => ColorConstants.textHighlightOnLightLime;

  @override
  Color get textHighlightGreen => ColorConstants.textHighlightOnLightGreen;

  @override
  Color get textHighlightTeal => ColorConstants.textHighlightOnLightTeal;

  @override
  Color get textHighlightCyan => ColorConstants.textHighlightOnLightCyan;

  @override
  Color get textHighlightSky => ColorConstants.textHighlightOnLightSky;

  @override
  Color get textHighlightBlue => ColorConstants.textHighlightOnLightBlue;

  @override
  Color get textHighlightPurple => ColorConstants.textHighlightOnLightPurple;

  @override
  Color get textHighlightPink => ColorConstants.textHighlightOnLightPink;

  @override
  Color get borderRegular => ColorConstants.neutral4;

  @override
  Color get borderLight => ColorConstants.neutral3;
}

/// Colors are generally lighter to contrast against darker colors.
class _OnDarkColorGroup implements _ColorGroup {
  @override
  // TODO: implement shadowPrimary
  Color get shadowPrimary => throw UnimplementedError();

  @override
  Color get splashNeutral => ColorConstants.splashNeutralOnDark;

  @override
  // TODO: implement primarySplashColor
  Color get splashPrimary => throw UnimplementedError();

  @override
  Color get highlightNeutral => ColorConstants.highlightNeutralOnDark;

  @override
  // TODO: implement primaryHighlightColor
  Color get highlightPrimary => throw UnimplementedError();

  @override
  Color get highEmphasis => ColorConstants.onDarkHighEmphasis;

  @override
  Color get mediumEmphasis => ColorConstants.onDarkMediumEmphasis;

  @override
  Color get lowEmphasis => ColorConstants.onDarkLowEmphasis;

  @override
  Color get accentRed => ColorConstants.accentRed;

  @override
  Color get accentOrange => ColorConstants.accentOrange;

  @override
  Color get accentYellow => ColorConstants.accentYellow;

  @override
  Color get accentLime => ColorConstants.accentLime;

  @override
  Color get accentGreen => ColorConstants.accentGreen;

  @override
  Color get accentTeal => ColorConstants.accentTeal;

  @override
  Color get accentCyan => ColorConstants.accentCyan;

  @override
  Color get accentSky => ColorConstants.accentSky;

  @override
  Color get accentBlue => ColorConstants.accentBlue;

  @override
  Color get accentPurple => ColorConstants.accentPurple;

  @override
  Color get accentPink => ColorConstants.accentPink;

  @override
  Color get textFillBrown => ColorConstants.textFillBrown;

  @override
  Color get textFillGray4 => ColorConstants.textFillOnDarkGray4;

  @override
  Color get textFillGray3 => ColorConstants.textFillOnDarkGray3;

  @override
  Color get textFillGray2 => ColorConstants.textFillOnDarkGray2;

  @override
  Color get textFillGray1 => ColorConstants.textFillOnDarkGray1;

  @override
  Color get textHighlightRed => ColorConstants.textHighlightOnDarkRed;

  @override
  Color get textHighlightOrange => ColorConstants.textHighlightOnDarkOrange;

  @override
  Color get textHighlightYellow => ColorConstants.textHighlightOnDarkYellow;

  @override
  Color get textHighlightLime => ColorConstants.textHighlightOnDarkLime;

  @override
  Color get textHighlightGreen => ColorConstants.textHighlightOnDarkGreen;

  @override
  Color get textHighlightTeal => ColorConstants.textHighlightOnDarkTeal;

  @override
  Color get textHighlightCyan => ColorConstants.textHighlightOnDarkCyan;

  @override
  Color get textHighlightSky => ColorConstants.textHighlightOnDarkSky;

  @override
  Color get textHighlightBlue => ColorConstants.textHighlightOnDarkBlue;

  @override
  Color get textHighlightPurple => ColorConstants.textHighlightOnDarkPurple;

  @override
  Color get textHighlightPink => ColorConstants.textHighlightOnDarkPink;

  @override
  // TODO: implement borderRegular
  Color get borderRegular => throw UnimplementedError();

  @override
  // TODO: implement borderLight
  Color get borderLight => throw UnimplementedError();
}

abstract class _SpecificColorGroup {
  Color get scrim;
}

class _LightSpecificColorGroup extends _SpecificColorGroup {
  @override
  Color get scrim => ColorConstants.scrim;
}

class _DarkSpecificColorGroup extends _SpecificColorGroup {
  @override
  // TODO: implement drawerScrimColor
  Color get scrim => throw UnimplementedError();
}
