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

import 'dart:ui';

class ColorConstants {
  ColorConstants._(); // Prevent instantiation with private constructor.

  // Primary Colors
  // The brand hue throughout the UI.
  static const primary = Color(0xFF7B68EE);
  static const primaryLight = Color(0xFFA293FF);
  static const primaryDark = Color(0xFF5C4DBC);

  // Accent Colors
  // Used when a gamut of colors are needed as in statistics, tags or deck
  // icons. Most colors also have a semantic meaning that expresses a specific
  // concept throughout the UI.
  static const accentRed = Color(0xFFFC575E);
  static const accentOrange = Color(0xFFFF9600);
  static const accentYellow = Color(0xFFFFC800);
  static const accentLime = Color(0xFF5ED605);
  static const accentGreen = Color(0xFF27AE60);
  static const accentTeal = Color(0xFF00B899);
  static const accentCyan = Color(0xFF44DDCC);
  static const accentSky = Color(0xFF49BEF9);
  static const accentBlue = Color(0xFF5577FF);
  static const accentPurple = Color(0xFFCE82FF);
  static const accentPink = Color(0xFFFD7CB5);

  // Neutrals
  // Used in texts, dividers, backgrounds, surfaces, and other UI components.
  static const neutral8 = Color(0xFF14142B);
  static const neutral7 = Color(0xFF4E4B66);
  static const neutral6 = Color(0xFF6E7191);
  static const neutral5 = Color(0xFFA0A3BD);
  static const neutral4 = Color(0xFFD6D8E7);
  static const neutral3 = Color(0xFFEFF0F6);
  static const neutral2 = Color(0xFFF7F7FC);
  static const neutral1 = Color(0xFFFCFCFC);

  // Emphasis Level Values
  // Used to set the opacity of the colors of texts or icons at different
  // emphasis levels to express hierarchy between elements.
  // Dark text colors use kNeutralColor8 as a base.
  // Light text colors use pure white (#FFFFFF) as a base.

  static const onLightHighEmphasis = Color(0xE614142B); // E6 --> 90%.
  static const onLightMediumEmphasis = Color(0x8014142B); // 80 --> 50%.
  static const onLightLowEmphasis = Color(0x3314142B); // 33 --> 20%.
  static const onDarkHighEmphasis = Color(0xFFFFFFFF); // FF --> 100%.
  static const onDarkMediumEmphasis = Color(0xB3FFFFFF); // B3 --> 70%.
  static const onDarkLowEmphasis = Color(0x59FFFFFF); // 59 --> 35%.

  // Text Fill Colors
  // User is able to select from these colors (in addition to accent colors)
  // when choosing a text color when creating the style of a card format.
  static const textFillBrown = Color(0xFFB17E22);
  static const textFill_OnLight_Gray4 = Color(0xB314142B); // B3 -> 70%.
  static const textFill_OnLight_Gray3 = Color(0x8014142B); // 80 -> 50%.
  static const textFill_OnLight_Gray2 = Color(0x4D14142B); // 4D -> 30%.
  static const textFill_OnLight_Gray1 = Color(0x1A14142B); // 1A -> 10%.
  static const textFill_OnDark_Gray4 = Color(0xCCFFFFFF); // CC -> 80%.
  static const textFill_OnDark_Gray3 = Color(0x99FFFFFF); // 99 -> 60%.
  static const textFill_OnDark_Gray2 = Color(0x66FFFFFF); // 66 -> 40%.
  static const textFill_OnDark_Gray1 = Color(0x33FFFFFF); // 33 -> 20%.

  // Text Highlight Colors
  // User is able to select from these colors when choosing a text highlight
  // color when creating the style of a card format.
  static const textHighlight_OnLight_Red = Color(0x33FC575E); // 33 -> 20%.
  static const textHighlight_OnLight_Orange = Color(0x33FF9600); // 33 -> 20%.
  static const textHighlight_OnLight_Yellow = Color(0x33FFC800); // 33 -> 20%.
  static const textHighlight_OnLight_Lime = Color(0x335ED605); // 33 -> 20%.
  static const textHighlight_OnLight_Green = Color(0x3327AE60); // 33 -> 20%.
  static const textHighlight_OnLight_Teal = Color(0x3300B899); // 33 -> 20%.
  static const textHighlight_OnLight_Cyan = Color(0x3344DDCC); // 33 -> 20%.
  static const textHighlight_OnLight_Sky = Color(0x3349BEF9); // 33 -> 20%.
  static const textHighlight_OnLight_Blue = Color(0x335577FF); // 33 -> 20%.
  static const textHighlight_OnLight_Purple = Color(0x33CE82FF); // 33 -> 20%.
  static const textHighlight_OnLight_Pink = Color(0x33FD7CB5); // 33 -> 20%.

  static const textHighlight_OnDark_Red = Color(0x4DFC575E); // 4D -> 30%.
  static const textHighlight_OnDark_Orange = Color(0x4DFF9600); // 4D -> 30%.
  static const textHighlight_OnDark_Yellow = Color(0x4DFFC800); // 4D -> 30%.
  static const textHighlight_OnDark_Lime = Color(0x4D5ED605); // 4D -> 30%.
  static const textHighlight_OnDark_Green = Color(0x4D27AE60); // 4D -> 30%.
  static const textHighlight_OnDark_Teal = Color(0x4D00B899); // 4D -> 30%.
  static const textHighlight_OnDark_Cyan = Color(0x4D44DDCC); // 4D -> 30%.
  static const textHighlight_OnDark_Sky = Color(0x4D49BEF9); // 4D -> 30%.
  static const textHighlight_OnDark_Blue = Color(0x4D5577FF); // 4D -> 30%.
  static const textHighlight_OnDark_Purple = Color(0x4DCE82FF); // 4D -> 30%.
  static const textHighlight_OnDark_Pink = Color(0x4DFD7CB5); // 4D -> 30%.

  // Others
  static const splashNeutralOnLight =
      Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
  static const splashNeutralOnDark =
      Color(0x3DFCFCFC); // kNeutralColor1.withOpacity(0.24);
  static const splashPrimary =
      Color(0x1F7B68EE); // kPrimaryColor.withOpacity(0.12);

  static const highlightNeutralOnLight =
      Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
  static const highlightNeutralOnDark =
      Color(0x3DFCFCFC); // kNeutralColor1.withOpacity(0.24);
  static const highlightPrimary =
      Color(0x1F7B68EE); // kPrimaryColor.withOpacity(0.12);

  static const scrim = Color(0x800B0844); // 80 --> 50%.
  static const snackBarBackground =
      Color(0xE64E4B66); // kNeutralColor7.withOpacity(0.9).
  static const tooltipBackground =
      Color(0xCC4E4B66); // kNeutralColor7.withOpacity(0.8).

  static const shadowPrimaryOnLight =
      Color(0x807B68EE); // primary.copyWith(0.50);
}
