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
const Color kPrimaryLightColor = Color(0xFFDFDBFB);
const Color kPrimaryDarkColor = Color(0xFF5C4DBC);

// Secondary Colors (Always use this order in lists)
// Use the first three colors (Pink, Cyan, Yellow) mainly.
// Use the rest of the colors when many colors are needed (e.g. stats charts).
const Color kSecondaryPinkColor = Color(0xFFFD71AF);
const Color kSecondaryCyanColor = Color(0xFF49CCF9);
const Color kSecondaryYellowColor = Color(0xFFFFC800);
const Color kSecondaryGreenColor = Color(0xFF00B884);
const Color kSecondaryRedColor = Color(0xFFFD7171);
const Color kSecondaryTurquoiseColor = Color(0xFF44DDCC);
const Color kSecondaryBlueColor = Color(0xFF5577FF);
const Color kSecondaryPurpleColor = Color(0xFFb660DD);

// Accent Colors
// Reserved for denotative colors.
const Color _kAccentRedColor = Color(0xFFFC575E);
const Color _kAccentOrangeColor = Color(0xFFFF8600);
const Color _kAccentYellowColor = Color(0xFFFCB410);
const Color _kAccentGreenColor = Color(0xFF27AE60);
const Color _kAccentBlueColor = Color(0xFF528CCB);
const Color _kAccentPurpleColor = Color(0xFFBF4ACC);
const Color _kAccentGrayColor = Color(0xFF34495E);
const Color _kAccentBrownColor = Color(0xFFB17E22);

// Denotative Colors
// Specify a certain state in the UI.
const Color kErrorColor = _kAccentRedColor;
const Color kWarningColor = _kAccentOrangeColor;
const Color kSuccessColor = _kAccentGreenColor;

// Text Fill Colors
// User is able to select from these colors when choosing a text color
// when creating the style of a card format.
const Color kTextFillRedColor = Color(0xFFE03E3E);
const Color kTextFillOrangeColor = Color(0xFFD9730D);
const Color kTextFillYellowColor = Color(0xFFDFAB01);
const Color kTextFillBlueColor = Color(0xFF0B6E99);
const Color kTextFillPurpleColor = Color(0xFF6940A5);
const Color kTextFillMagentaColor = Color(0xFFAD1A72);
const Color kTextFillBlackColor = Color(0xFF343434);
const Color kTextFillBrownColor = Color(0xFF64473A);

// Text Highlight Colors
// User is able to select from these colors when choosing a text highlight color
// when creating the style of a card format.
const Color kTextHighlightPinkColor = Color(0xFFFFE0E0);
const Color kTextHighlightOrangeColor = Color(0xFFFFDBBA);
const Color kTextHighlightYellowColor = Color(0xFFFFFA78);
const Color kTextHighlightGreenColor = Color(0xFFE6FFCF);
const Color kTextHighlightBlueColor = Color(0xFFCAE4F6);
const Color kTextHighlightPurpleColor = Color(0xFFEEDBF6);

// Neutrals
// Used in texts, dividers, backgrounds, surfaces, and other UI components.
const Color kNeutralColor8 = Color(0xFF14142B);
const Color kNeutralColor7 = Color(0xFF4E4B66);
const Color kNeutralColor6 = Color(0xFF6E7191);
const Color kNeutralColor5 = Color(0xFFA0A3BD);
const Color kNeutralColor4 = Color(0xFFD6D8E7);
const Color kNeutralColor3 = Color(0xFFEFF0F6);
const Color kNeutralColor2 = Color(0XFFF7F7FC);
const Color kNeutralColor1 = Color(0xFFFCFCFC);

// Emphasis Opacity Values
// Used to set the opacity of the colors of texts or icons at different
// emphasis levels to express hierarchy between elements.

// Dark text colors use kNeutralColor8 as a base.
const double kDarkHighEmphasisOpacity = 0.90;
const Color kDarkHighEmphasisTextColor = Color(0xE614142B); // E6 --> 90%.
const double kDarkMediumEmphasisOpacity = 0.60;
const Color kDarkMediumEmphasisTextColor = Color(0x9914142B); // 99 --> 60%.
const double kDarkLowEmphasisOpacity = 0.30;
const Color kDarkLowEmphasisTextColor = Color(0x4D14142B); // 4D --> 30%.

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
