/*
 * Sona is a cross-platform educational app which helps you remember
 * facts easier, developed with Flutter.
 * Copyright (C) 2020 Cervon Wong
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

class ColorNotifier extends ChangeNotifier {
  ColorTheme _theme;
  static final _onLight = _OnLightColorGroup();
  static final _onDark = _OnDarkColorGroup();

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
  Color get highEmphasisTextColor => kDarkHighEmphasisTextColor;

  @override
  Color get mediumEmphasisTextColor => kDarkMediumEmphasisTextColor;

  @override
  Color get lowEmphasisTextColor => kDarkLowEmphasisTextColor;
}

/// Colors are generally lighter to contrast against darker colors.
class _OnDarkColorGroup implements _ColorGroup {
  @override
  Color get splashColor => kLightSplashColor;

  @override
  Color get highlightColor => kLightHighlightColor;

  @override
  Color get highEmphasisTextColor => kLightHighEmphasisTextColor;

  @override
  Color get mediumEmphasisTextColor => kLightMediumEmphasisTextColor;

  @override
  Color get lowEmphasisTextColor => kLightLowEmphasisTextColor;
}

abstract class _ColorGroup {
  Color get splashColor;

  Color get highlightColor;

  Color get highEmphasisTextColor;

  Color get mediumEmphasisTextColor;

  Color get lowEmphasisTextColor;
}

enum ColorTheme { light, dark }
