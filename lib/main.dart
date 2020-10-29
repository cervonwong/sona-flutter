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
import 'package:google_fonts/google_fonts.dart';
import 'package:sona_flutter/core/presentation/bottom_navigation/bottom_navigation_screen.dart';

import 'core/constants/app_colors.dart';

void main() {
  runApp(SonaApp());
}

class SonaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sona',
      theme: _createThemeData(),
      home: BottomNavigationScreen(),
    );
  }
}

ThemeData _createThemeData() {
  return _createBaseThemeData().copyWith(
    colorScheme: _createColorScheme(),
    primaryTextTheme: _createPrimaryAndAccentTextTheme(),
    accentTextTheme: _createPrimaryAndAccentTextTheme(),
    textTheme: _createTextTheme(),
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

TextTheme _createTextTheme() {
  return GoogleFonts.workSansTextTheme(
    TextTheme(
      headline1: TextStyle(
        color: kNeutralColor8,
        fontSize: 102,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: kNeutralColor8,
        fontSize: 64,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: kNeutralColor8,
        fontSize: 51,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: kNeutralColor8,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        color: kNeutralColor8,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        color: kNeutralColor8,
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: kNeutralColor8,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        color: kNeutralColor8,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        color: kNeutralColor8,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: kNeutralColor8,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        color: kNeutralColor8,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        color: kNeutralColor8.withOpacity(0.6),
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        color: kNeutralColor8,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
  );
}

TextTheme _createPrimaryAndAccentTextTheme() {
  return GoogleFonts.workSansTextTheme(
    TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 102,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 64,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 51,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
  );
}

BottomNavigationBarThemeData _createBottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: kNeutralColor1,
    elevation: 8.0,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kNeutralColor8.withOpacity(0.6),
  );
}
