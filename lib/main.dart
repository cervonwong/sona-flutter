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

import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SonaApp());
}

class SonaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sona',
      theme: _createThemeData(),
      home: HomeScreen(),
    );
  }
}

ThemeData _createThemeData() {
  return _createBaseThemeData().copyWith(
    colorScheme: _createColorScheme(),
    textTheme: _createTextTheme(),
    primaryTextTheme: _createPrimaryAndAccentTextTheme(),
    accentTextTheme: _createPrimaryAndAccentTextTheme(),
    appBarTheme: _createAppBarTheme(),
    dividerTheme: _createDividerTheme(),
    bottomNavigationBarTheme: _createBottomNavigationBarTheme(),
  );
}

ThemeData _createBaseThemeData() {
  return ThemeData(
    // Primary
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryDarkColor,
    primaryColorLight: kPrimaryLightColor,

    // Secondary
    accentColor: kPrimaryColor,

    backgroundColor: kNeutralColor2,
    errorColor: kErrorColor,
    scaffoldBackgroundColor: kNeutralColor2,
    cursorColor: kPrimaryColor,
    textSelectionColor: kPrimaryLightColor,
    textSelectionHandleColor: kPrimaryColor,
    splashColor: kNeutralColor8.withOpacity(0.06),
    highlightColor: kNeutralColor8.withOpacity(0.06),
  );
}

ColorScheme _createColorScheme() {
  return ColorScheme(
    brightness: Brightness.light,

    // Primary
    primary: kPrimaryColor,
    primaryVariant: kPrimaryDarkColor,
    onPrimary: Colors.white,

    // Secondary
    secondary: kPrimaryColor,
    secondaryVariant: kPrimaryDarkColor,
    onSecondary: Colors.white,

    // Surface
    surface: kNeutralColor1,
    onSurface: kNeutralColor8,

    // Background
    background: kNeutralColor2,
    onBackground: kNeutralColor8,

    // Error
    error: kErrorColor,
    onError: Colors.white,
  );
}

TextTheme _createBaseTextTheme() {
  return TextTheme(
    headline1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 102,
      fontWeight: FontWeight.w600,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 64,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 51,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),
    headline4: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 36,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
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
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontFamily: 'Work Sans',
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}

TextTheme _createTextTheme() {
  return _createBaseTextTheme().apply(
    bodyColor: kNeutralColor8.withOpacity(kHighEmphasisOpacity),
    displayColor: kNeutralColor8.withOpacity(kHighEmphasisOpacity),
  );
}

TextTheme _createPrimaryAndAccentTextTheme() {
  return _createBaseTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}

AppBarTheme _createAppBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
  );
}

DividerThemeData _createDividerTheme() {
  return DividerThemeData(
    color: kNeutralColor4,
    space: 0.0,
    thickness: 1.0,
  );
}

BottomNavigationBarThemeData _createBottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: kNeutralColor1,
    elevation: 8.0,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kNeutralColor8.withOpacity(kMediumEmphasisOpacity),
  );
}
