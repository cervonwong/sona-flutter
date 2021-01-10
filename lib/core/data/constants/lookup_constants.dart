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

// Entity : EntryFieldType
// Table  : field_types
const int kFieldTypeTextId = 1;
const int kFieldTypeImageId = 2;

const String kFieldTypeTextName = 'TEXT';
const String kFieldTypeImageName = 'IMAGE';

// Entity : ComponentType
// Table  : component_types
const int kComponentTypeTextId = 1;
const int kComponentTypeImageId = 2;
const int kComponentTypeDividerId = 3;

const String kComponentTypeTextName = 'TEXT';
const String kComponentTypeImageName = 'IMAGE';
const String kComponentTypeDividerName = 'DIVIDER';

// Entity : TextComponentAlignment
// Table  : alignments
const int kAlignmentCenterId = 1;
const int kAlignmentStartId = 2;
const int kAlignmentEndId = 3;
const int kAlignmentJustifyId = 4;

const String kAlignmentCenterName = 'CENTER';
const String kAlignmentStartName = 'START';
const String kAlignmentEndName = 'END';
const String kAlignmentJustifyName = 'JUSTIFY';

// Entity : TextComponentFillColor (TO BE CHANGED)
// Table  : fill_colors
const int kFillColorNeutralId = 1;
const int kFillColorRedId = 2;
const int kFillColorOrangeId = 3;
const int kFillColorYellowId = 4;
const int kFillColorBlueId = 5;
const int kFillColorPurpleId = 6;
const int kFillColorMagentaId = 7;
const int kFillColorBrownId = 8;

const String kFillColorNeutralName = 'NEUTRAL';
const String kFillColorRedName = 'RED';
const String kFillColorOrangeName = 'ORANGE';
const String kFillColorYellowName = 'YELLOW';
const String kFillColorBlueName = 'BLUE';
const String kFillColorPurpleName = 'PURPLE';
const String kFillColorMagentaName = 'MAGENTA';
const String kFillColorBrownName = 'BROWN';

// Entity : TextComponentHighlightColor
// Table  : highlight_colors
const int kHighlightColorNoneId = 1;
const int kHighlightColorPinkId = 2;
const int kHighlightColorOrangeId = 3;
const int kHighlightColorYellowId = 4;
const int kHighlightColorGreenId = 5;
const int kHighlightColorBlueId = 6;
const int kHighlightColorPurpleId = 7;

const String kHighlightColorNoneName = 'NONE';
const String kHighlightColorPinkName = 'PINK';
const String kHighlightColorOrangeName = 'ORANGE';
const String kHighlightColorYellowName = 'YELLOW';
const String kHighlightColorGreenName = 'GREEN';
const String kHighlightColorBlueName = 'BLUE';
const String kHighlightColorPurpleName = 'PURPLE';
