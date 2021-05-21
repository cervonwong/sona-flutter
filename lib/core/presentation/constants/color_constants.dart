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

// Primary Colors
// The main color in the UI.
const Color kPrimaryColor = Color(0xFF7B68EE);
const Color kPrimaryLightColor = Color(0xFFA293FF);
const Color kPrimaryDarkColor = Color(0xFF5C4DBC);

// Accent Colors
// Used when a gamut of colors are needed as in statistics, tags or deck icons.
// Most colors also have a semantic meaning that expresses a specific concept
// throughout the UI.
const Color kAccentRedColor = Color(0xFFFC575E);
const Color kAccentOrangeColor = Color(0xFFFF9600);
const Color kAccentYellowColor = Color(0xFFFFC800);
const Color kAccentLimeColor = Color(0xFF5ED605);
const Color kAccentGreenColor = Color(0xFF27AE60);
const Color kAccentTealColor = Color(0xFF00B899);
const Color kAccentCyanColor = Color(0xFF44DDCC);
const Color kAccentSkyColor = Color(0xFF49BEF9);
const Color kAccentBlueColor = Color(0xFF5577FF);
const Color kAccentPurpleColor = Color(0xFFCE82FF);
const Color kAccentPinkColor = Color(0xFFFD7CB5);

// Text Fill Colors
// User is able to select from these colors (in addition to accent colors) when
// choosing a text color when creating the style of a card format.
const Color kTextFillBrownColor = Color(0xFFB17E22);

const Color kTextFillOnLightGrayColor4 = Color(0xB314142B); // B3 -> 70%.
const Color kTextFillOnLightGrayColor3 = Color(0x8014142B); // 80 -> 50%.
const Color kTextFillOnLightGrayColor2 = Color(0x4D14142B); // 4D -> 30%.
const Color kTextFillOnLightGrayColor1 = Color(0x1A14142B); // 1A -> 10%.

const Color kTextFillOnDarkGrayColor4 = Color(0xCCFFFFFF); // CC -> 80%.
const Color kTextFillOnDarkGrayColor3 = Color(0x99FFFFFF); // 99 -> 60%.
const Color kTextFillOnDarkGrayColor2 = Color(0x66FFFFFF); // 66 -> 40%.
const Color kTextFillOnDarkGrayColor1 = Color(0x33FFFFFF); // 33 -> 20%.

// Text Highlight Colors
// User is able to select from these colors when choosing a text highlight color
// when creating the style of a card format.
const Color kTextHighlightOnLightRedColor = Color(0x33FC575E); // 33 -> 20%.
const Color kTextHighlightOnLightOrangeColor = Color(0x33FF9600); // 33 -> 20%.
const Color kTextHighlightOnLightYellowColor = Color(0x33FFC800); // 33 -> 20%.
const Color kTextHighlightOnLightLimeColor = Color(0x335ED605); // 33 -> 20%.
const Color kTextHighlightOnLightGreenColor = Color(0x3327AE60); // 33 -> 20%.
const Color kTextHighlightOnLightTealColor = Color(0x3300B899); // 33 -> 20%.
const Color kTextHighlightOnLightCyanColor = Color(0x3344DDCC); // 33 -> 20%.
const Color kTextHighlightOnLightSkyColor = Color(0x3349BEF9); // 33 -> 20%.
const Color kTextHighlightOnLightBlueColor = Color(0x335577FF); // 33 -> 20%.
const Color kTextHighlightOnLightPurpleColor = Color(0x33CE82FF); // 33 -> 20%.
const Color kTextHighlightOnLightPinkColor = Color(0x33FD7CB5); // 33 -> 20%.

const Color kTextHighlightOnDarkRedColor = Color(0x4DFC575E); // 4D -> 30%.
const Color kTextHighlightOnDarkOrangeColor = Color(0x4DFF9600); // 4D -> 30%.
const Color kTextHighlightOnDarkYellowColor = Color(0x4DFFC800); // 4D -> 30%.
const Color kTextHighlightOnDarkLimeColor = Color(0x4D5ED605); // 4D -> 30%.
const Color kTextHighlightOnDarkGreenColor = Color(0x4D27AE60); // 4D -> 30%.
const Color kTextHighlightOnDarkTealColor = Color(0x4D00B899); // 4D -> 30%.
const Color kTextHighlightOnDarkCyanColor = Color(0x4D44DDCC); // 4D -> 30%.
const Color kTextHighlightOnDarkSkyColor = Color(0x4D49BEF9); // 4D -> 30%.
const Color kTextHighlightOnDarkBlueColor = Color(0x4D5577FF); // 4D -> 30%.
const Color kTextHighlightOnDarkPurpleColor = Color(0x4DCE82FF); // 4D -> 30%.
const Color kTextHighlightOnDarkPinkColor = Color(0x4DFD7CB5); // 4D -> 30%.

// Neutrals
// Used in texts, dividers, backgrounds, surfaces, and other UI components.
const Color kNeutralColor8 = Color(0xFF14142B);
const Color kNeutralColor7 = Color(0xFF4E4B66);
const Color kNeutralColor6 = Color(0xFF6E7191);
const Color kNeutralColor5 = Color(0xFFA0A3BD);
const Color kNeutralColor4 = Color(0xFFD6D8E7);
const Color kNeutralColor3 = Color(0xFFEFF0F6);
const Color kNeutralColor2 = Color(0xFFF7F7FC);
const Color kNeutralColor1 = Color(0xFFFCFCFC);

// Emphasis Opacity Values
// Used to set the opacity of the colors of texts or icons at different
// emphasis levels to express hierarchy between elements.

// Dark text colors use kNeutralColor8 as a base.
const double kDarkHighEmphasisOpacity = 0.90;
const Color kDarkHighEmphasisTextColor = Color(0xE614142B); // E6 --> 90%.
const double kDarkMediumEmphasisOpacity = 0.50;
const Color kDarkMediumEmphasisTextColor = Color(0x8014142B); // 80 --> 50%.
const double kDarkLowEmphasisOpacity = 0.20;
const Color kDarkLowEmphasisTextColor = Color(0x3314142B); // 33 --> 20%.

// Light text colors use pure white (#FFFFFF) as a base.
const double kLightHighEmphasisOpacity = 1.00;
const Color kLightHighEmphasisTextColor = Color(0xFFFFFFFF); // FF --> 100%.
const double kLightMediumEmphasisOpacity = 0.70;
const Color kLightMediumEmphasisTextColor = Color(0xB3FFFFFF); // B3 --> 70%.
const double kLightLowEmphasisOpacity = 0.35;
const Color kLightLowEmphasisTextColor = Color(0x59FFFFFF); // 59 --> 35%.

// Splashes and Highlights
// Overlaid on interactive components with a ripple effect (Ink).

const Color kDarkSplashColor =
    Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
const Color kDarkHighlightColor =
    Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
const Color kLightSplashColor =
    Color(0x3DFCFCFC); // kNeutralColor1.withOpacity(0.24);
const Color kLightHighlightColor =
    Color(0x3DFCFCFC); // kNeutralColor1.withOpacity(0.24);
const Color kPrimarySplashColor =
    Color(0x1F7B68EE); // kPrimaryColor.withOpacity(0.12);
const Color kPrimaryHighlightColor =
    Color(0x1F7B68EE); // kPrimaryColor.withOpacity(0.12);

// Misc.

const Color kScrimColor = Color(0x800B0844); // 80 --> 50%.
const Color kSnackBarBackgroundColor =
    Color(0xE64E4B66); // kNeutralColor7.withOpacity(0.9).
const Color kTooltipBackgroundColor =
    Color(0xCC4E4B66); // kNeutralColor7.withOpacity(0.8).
