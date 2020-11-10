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

import 'dart:ui';

// Primary Colors
// The main color in the UI.
const Color kPrimaryColor = Color(0xff7b68ee);
const Color kPrimaryLightColor = Color(0xffdfdbfb);
const Color kPrimaryDarkColor = Color(0xff5c4dbc);

// Secondary Colors (Always use this order in lists)
// Use the first three colors (Pink, Cyan, Yellow) mainly.
// Use the rest of the colors when many colors are needed (e.g. stats charts).
const Color kSecondaryPinkColor = Color(0xfffd71af);
const Color kSecondaryCyanColor = Color(0xff49ccf9);
const Color kSecondaryYellowColor = Color(0xffffc800);
const Color kSecondaryGreenColor = Color(0xff00b884);
const Color kSecondaryRedColor = Color(0xfffd7171);
const Color kSecondaryTurquoiseColor = Color(0xff44ddcc);
const Color kSecondaryBlueColor = Color(0xff5577ff);
const Color kSecondaryPurpleColor = Color(0xffb660dd);

// Accent Colors
// Reserved for denotative colors.
const Color _kAccentRedColor = Color(0xfffc575e);
const Color _kAccentOrangeColor = Color(0xffff8600);
const Color _kAccentYellowColor = Color(0xfffcb410);
const Color _kAccentGreenColor = Color(0xff27ae60);
const Color _kAccentBlueColor = Color(0xff528ccb);
const Color _kAccentPurpleColor = Color(0xffbf4acc);
const Color _kAccentGrayColor = Color(0xff34495e);
const Color _kAccentBrownColor = Color(0xffb17e22);

// Denotative Colors
// Specify a certain state in the UI.
const Color kErrorColor = _kAccentRedColor;
const Color kWarningColor = _kAccentOrangeColor;
const Color kSuccessColor = _kAccentGreenColor;

// Text Fill Colors
// User is able to select from these colors when choosing a text color
// when creating the style of a card format.
const Color kTextFillRedColor = Color(0xffe03e3e);
const Color kTextFillOrangeColor = Color(0xffd9730d);
const Color kTextFillYellowColor = Color(0xffdfab01);
const Color kTextFillBlueColor = Color(0xff0b6e99);
const Color kTextFillPurpleColor = Color(0xff6940a5);
const Color kTextFillMagentaColor = Color(0xffad1a72);
const Color kTextFillBlackColor = Color(0xff343434);
const Color kTextFillBrownColor = Color(0xff64473a);

// Text Highlight Colors
// User is able to select from these colors when choosing a text highlight color
// when creating the style of a card format.
const Color kTextHighlightPinkColor = Color(0xffffe0e0);
const Color kTextHighlightOrangeColor = Color(0xffffdbba);
const Color kTextHighlightYellowColor = Color(0xfffffa78);
const Color kTextHighlightGreenColor = Color(0xffe6ffcf);
const Color kTextHighlightBlueColor = Color(0xffcae4f6);
const Color kTextHighlightPurpleColor = Color(0xffeedbf6);

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
const double kHighEmphasisOpacity = 0.90;
const double kMediumEmphasisOpacity = 0.65;
const double kLowEmphasisOpacity = 0.30;

// Splashes and Highlights
// Overlaid on interactive components with a ripple effect (Ink).

const Color kDarkSplashColor =
    Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
const Color kDarkHighlightColor =
    Color(0x0F14142B); // kNeutralColor8.withOpacity(0.06);
const Color kLightSplashColor =
    Color(0x1FFCFCFC); // kNeutralColor1.withOpacity(0.12);
const Color kLightHighlightColor =
    Color(0x1FFCFCFC); // kNeutralColor1.withOpacity(0.12);
