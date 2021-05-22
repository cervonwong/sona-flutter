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
import 'package:provider/provider.dart';

import 'core/presentation/change_notifiers/color_notifier.dart';
import 'core/presentation/constants/color_constants.dart';
import 'core/presentation/constants/widget_constants.dart';
import 'injection_container.dart' as injection_container;
import 'screens/home_screen.dart';

void main() {
  injection_container.configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorNotifier(theme: ColorTheme.light),
      child: SonaApp(),
    ),
  );
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
  final baseTextTheme = _createBaseTextTheme();

  return ThemeData(
    // Primary
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryDarkColor,
    primaryColorLight: kPrimaryLightColor,

    // Secondary
    accentColor: kPrimaryColor,

    // Other colors
    backgroundColor: kNeutralColor2,
    canvasColor: Colors.white,
    errorColor: kAccentRedColor,
    highlightColor: kPrimaryHighlightColor,
    scaffoldBackgroundColor: kNeutralColor2,
    splashColor: kPrimarySplashColor,
    shadowColor: kNeutralColor8,

    // Themes
    colorScheme: _createColorScheme(),
    textTheme: _createTextTheme(),
    primaryTextTheme: _createPrimaryAndAccentTextTheme(),
    accentTextTheme: _createPrimaryAndAccentTextTheme(),

    appBarTheme: _createAppBarTheme(baseTextTheme: baseTextTheme),
    bottomSheetTheme: _createBottomSheetTheme(),
    bottomNavigationBarTheme: _createBottomNavigationBarTheme(),
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
  return ColorScheme(
    brightness: Brightness.light,

    // Primary
    primary: kPrimaryColor,
    primaryVariant: kPrimaryDarkColor,
    onPrimary: kOnDarkHighEmphasisColor,

    // Secondary
    secondary: kPrimaryColor,
    secondaryVariant: kPrimaryDarkColor,
    onSecondary: kOnDarkHighEmphasisColor,

    // Surface
    surface: Colors.white,
    onSurface: kOnLightHighEmphasisColor,

    // Background
    background: kNeutralColor2,
    onBackground: kOnLightHighEmphasisColor,

    // Error
    error: kAccentRedColor,
    onError: kOnDarkHighEmphasisColor,
  );
}

TextTheme _createBaseTextTheme() {
  return TextTheme(
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
    bodyColor: kOnLightHighEmphasisColor,
    displayColor: kOnLightHighEmphasisColor,
  );
}

TextTheme _createPrimaryAndAccentTextTheme() {
  return _createBaseTextTheme().apply(
    bodyColor: kOnDarkHighEmphasisColor,
    displayColor: kOnDarkHighEmphasisColor,
  );
}

AppBarTheme _createAppBarTheme({@required TextTheme baseTextTheme}) {
  return AppBarTheme(
    centerTitle: false,
    elevation: 0.0,
    backwardsCompatibility: false,
    backgroundColor: Colors.white,
    foregroundColor: kOnLightHighEmphasisColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

BottomSheetThemeData _createBottomSheetTheme() {
  return BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kCornerRadius32),
        topRight: Radius.circular(kCornerRadius32),
      ),
    ),
    modalBackgroundColor: Colors.white,
  );
}

BottomNavigationBarThemeData _createBottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0.0,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kOnLightMediumEmphasisColor,
  );
}

DialogTheme _createDialogTheme() {
  return DialogTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCornerRadius16),
    ),
  );
}

DividerThemeData _createDividerTheme() {
  return DividerThemeData(
    color: kNeutralColor4,
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
          borderRadius: BorderRadius.circular(kCornerRadius12),
        ),
      ),
      visualDensity: VisualDensity(vertical: 2.0),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return kNeutralColor5;
        }
        return kOnDarkHighEmphasisColor;
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return kNeutralColor3;
        }
        return kPrimaryColor;
      }),
    ),
  );
}

FloatingActionButtonThemeData _createFloatingActionButtonTheme() {
  return FloatingActionButtonThemeData(
    elevation: 2.0,
    highlightElevation: 4.0,
    splashColor: kLightSplashColor,
  );
}

InputDecorationTheme _createInputDecorationTheme({
  @required TextTheme baseTextTheme,
}) {
  return InputDecorationTheme(
    hintStyle: baseTextTheme.bodyText1.copyWith(
      color: kOnLightMediumEmphasisColor,
    ),
  );
}

OutlinedButtonThemeData _createOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCornerRadius12),
        ),
      ),
      visualDensity: VisualDensity(vertical: 2.0),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return kNeutralColor5;
        }
        return kPrimaryColor;
      }),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(color: kNeutralColor4),
      ),
    ),
  );
}

SnackBarThemeData _createSnackBarTheme({@required TextTheme baseTextTheme}) {
  return SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCornerRadius12),
    ),
    backgroundColor: kSnackBarBackgroundColor,
    contentTextStyle: baseTextTheme.caption,
  );
}

TextSelectionThemeData _createTextSelectionTheme() {
  return TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryLightColor,
    selectionHandleColor: kPrimaryColor,
  );
}

TooltipThemeData _createTooltipTheme() {
  return TooltipThemeData(
    decoration: BoxDecoration(
      color: kTooltipBackgroundColor,
      borderRadius: BorderRadius.circular(kCornerRadius12),
    ),
  );
}
