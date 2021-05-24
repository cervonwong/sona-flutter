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
import 'package:flutter/services.dart';

import 'core/presentation/constants/color_constants.dart';
import 'core/presentation/constants/widget_constants.dart';

ThemeData createLightTheme() {
  final baseTextTheme = _createBaseTextTheme();

  return ThemeData(
    // Primary
    primaryColor: ColorConstants.primary,
    primaryColorDark: ColorConstants.primaryDark,
    primaryColorLight: ColorConstants.primaryLight,

    // Secondary
    accentColor: ColorConstants.primary,

    // Other colors
    backgroundColor: ColorConstants.neutral2,
    canvasColor: Colors.white,
    errorColor: ColorConstants.accentRed,
    highlightColor: ColorConstants.highlightPrimary,
    scaffoldBackgroundColor: ColorConstants.neutral2,
    splashColor: ColorConstants.splashPrimary,
    shadowColor: ColorConstants.neutral8,

    // Themes
    colorScheme: _createColorScheme(),
    textTheme: _createTextTheme(),
    primaryTextTheme: _createPrimaryAndAccentTextTheme(),
    accentTextTheme: _createPrimaryAndAccentTextTheme(),

    appBarTheme: _createAppBarTheme(baseTextTheme: baseTextTheme),
    bottomSheetTheme: _createBottomSheetTheme(),
    bottomNavigationBarTheme: _createBottomNavigationBarTheme(
      baseTextTheme: baseTextTheme,
    ),
    dialogTheme: _createDialogTheme(),
    dividerTheme: _createDividerTheme(),
    elevatedButtonTheme: _createElevatedButtonTheme(),
    floatingActionButtonTheme: _createFloatingActionButtonTheme(),
    inputDecorationTheme: _createInputDecorationTheme(
      baseTextTheme: baseTextTheme,
    ),
    outlinedButtonTheme: _createOutlinedButtonTheme(),
    snackBarTheme: _createSnackBarTheme(baseTextTheme: baseTextTheme),
    textSelectionTheme: _createTextSelectionTheme(),
    tooltipTheme: _createTooltipTheme(),
  );
}

ColorScheme _createColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,

    // Primary
    primary: ColorConstants.primary,
    primaryVariant: ColorConstants.primaryDark,
    onPrimary: ColorConstants.onDarkHighEmphasis,

    // Secondary
    secondary: ColorConstants.primary,
    secondaryVariant: ColorConstants.primaryDark,
    onSecondary: ColorConstants.onDarkHighEmphasis,

    // Surface
    surface: Colors.white,
    onSurface: ColorConstants.onLightHighEmphasis,

    // Background
    background: ColorConstants.neutral2,
    onBackground: ColorConstants.onLightHighEmphasis,

    // Error
    error: ColorConstants.accentRed,
    onError: ColorConstants.onDarkHighEmphasis,
  );
}

TextTheme _createBaseTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 80,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 58,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline3: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 46,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline4: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline5: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 25,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline6: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 21,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    subtitle2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    bodyText1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    button: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
    caption: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    overline: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
  );
}

TextTheme _createTextTheme() {
  return _createBaseTextTheme().apply(
    bodyColor: ColorConstants.onLightHighEmphasis,
    displayColor: ColorConstants.onLightHighEmphasis,
  );
}

TextTheme _createPrimaryAndAccentTextTheme() {
  return _createBaseTextTheme().apply(
    bodyColor: ColorConstants.onDarkHighEmphasis,
    displayColor: ColorConstants.onDarkHighEmphasis,
  );
}

AppBarTheme _createAppBarTheme({@required TextTheme baseTextTheme}) {
  return const AppBarTheme(
    centerTitle: false,
    elevation: 0.0,
    backwardsCompatibility: false,
    backgroundColor: Colors.white,
    foregroundColor: ColorConstants.onLightHighEmphasis,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

BottomSheetThemeData _createBottomSheetTheme() {
  return const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(WidgetConstants.cornerRadius32),
        topRight: Radius.circular(WidgetConstants.cornerRadius32),
      ),
    ),
    modalBackgroundColor: Colors.white,
  );
}

BottomNavigationBarThemeData _createBottomNavigationBarTheme({
  @required TextTheme baseTextTheme,
}) {
  return BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0.0,
    selectedItemColor: ColorConstants.primary,
    unselectedItemColor: ColorConstants.onLightMediumEmphasis,
    selectedLabelStyle: baseTextTheme.subtitle2,
  );
}

DialogTheme _createDialogTheme() {
  return DialogTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WidgetConstants.cornerRadius16),
    ),
  );
}

DividerThemeData _createDividerTheme() {
  return const DividerThemeData(
    color: ColorConstants.neutral4,
    space: 0.0,
    thickness: 1.0,
  );
}

ElevatedButtonThemeData _createElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetConstants.cornerRadius12),
        ),
      ),
      visualDensity: const VisualDensity(vertical: 2.0),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorConstants.neutral5;
        }
        return ColorConstants.onDarkHighEmphasis;
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorConstants.neutral3;
        }
        return ColorConstants.primary;
      }),
    ),
  );
}

FloatingActionButtonThemeData _createFloatingActionButtonTheme() {
  return const FloatingActionButtonThemeData(
    splashColor: ColorConstants.splashNeutralOnDark,
  );
}

InputDecorationTheme _createInputDecorationTheme({
  @required TextTheme baseTextTheme,
}) {
  return InputDecorationTheme(
    hintStyle: baseTextTheme.bodyText1.copyWith(
      color: ColorConstants.onLightMediumEmphasis,
    ),
  );
}

OutlinedButtonThemeData _createOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetConstants.cornerRadius12),
        ),
      ),
      visualDensity: const VisualDensity(vertical: 2.0),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return ColorConstants.neutral5;
        }
        return ColorConstants.primary;
      }),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: ColorConstants.neutral4),
      ),
    ),
  );
}

SnackBarThemeData _createSnackBarTheme({@required TextTheme baseTextTheme}) {
  return SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WidgetConstants.cornerRadius12),
    ),
    backgroundColor: ColorConstants.snackBarBackground,
    contentTextStyle: baseTextTheme.caption,
  );
}

TextSelectionThemeData _createTextSelectionTheme() {
  return const TextSelectionThemeData(
    cursorColor: ColorConstants.primary,
    selectionColor: ColorConstants.primaryLight,
    selectionHandleColor: ColorConstants.primary,
  );
}

TooltipThemeData _createTooltipTheme() {
  return TooltipThemeData(
    decoration: BoxDecoration(
      color: ColorConstants.tooltipBackground,
      borderRadius: BorderRadius.circular(WidgetConstants.cornerRadius12),
    ),
  );
}
