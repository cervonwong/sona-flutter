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

import '../domain/entities/material/entry_type/components/component.dart';
import '../domain/entities/material/entry_type/components/text_component.dart';
import '../domain/entities/material/entry_type/entry_field/entry_field_type.dart';

// These values will rarely change throughout the lifetime of the app.
class LookupAndMapperConstants {
  LookupAndMapperConstants._(); // Prevent instantiation with private constructor.

  // Entity : EntryFieldType (enum)
  // Table  : field_types
  static const fieldTypeTextId = 1;
  static const fieldTypeImageId = 2;
  static const fieldTypeTextName = 'TEXT';
  static const fieldTypeImageName = 'IMAGE';
  static const fieldTypeLookup = {
    fieldTypeTextId: fieldTypeTextName,
    fieldTypeImageId: fieldTypeImageName
  };
  static const fieldTypeMapping = {
    fieldTypeTextId: EntryFieldType.text,
    fieldTypeImageId: EntryFieldType.image,
  };

  // Entity : ComponentType (enum)
  // Table  : component_types
  static const componentTypeTextId = 1;
  static const componentTypeImageId = 2;
  static const componentTypeDividerId = 3;
  static const componentTypeTextName = 'TEXT';
  static const componentTypeImageName = 'IMAGE';
  static const componentTypeDividerName = 'DIVIDER';
  static const componentTypeLookup = {
    componentTypeTextId: componentTypeTextName,
    componentTypeImageId: componentTypeImageName,
    componentTypeDividerId: componentTypeDividerName,
  };
  static const componentTypeMapping = {
    componentTypeTextId: ComponentType.text,
    componentTypeImageId: ComponentType.image,
    componentTypeDividerId: ComponentType.divider,
  };

  // Entity : TextComponentAlignment
  // Table  : alignments
  static const alignmentCenterId = 1;
  static const alignmentStartId = 2;
  static const alignmentEndId = 3;
  static const alignmentJustifyId = 4;
  static const alignmentCenterName = 'CENTER';
  static const alignmentStartName = 'START';
  static const alignmentEndName = 'END';
  static const alignmentJustifyName = 'JUSTIFY';
  static const alignmentLookup = {
    alignmentCenterId: alignmentCenterName,
    alignmentStartId: alignmentStartName,
    alignmentEndId: alignmentEndName,
    alignmentJustifyId: alignmentJustifyName,
  };
  static const alignmentMapping = {
    alignmentCenterId: TextComponentAlignment.center,
    alignmentStartId: TextComponentAlignment.start,
    alignmentEndId: TextComponentAlignment.end,
    alignmentJustifyId: TextComponentAlignment.justify,
  };

  // Entity : TextComponentFillColor
  // Table  : fill_colors
  static const fillColorDefaultId = 1;
  static const fillColorGray4Id = 2;
  static const fillColorGray3Id = 3;
  static const fillColorGray2Id = 4;
  static const fillColorGray1Id = 5;
  static const fillColorRedId = 6;
  static const fillColorOrangeId = 7;
  static const fillColorYellowId = 8;
  static const fillColorLimeId = 9;
  static const fillColorGreenId = 10;
  static const fillColorTealId = 11;
  static const fillColorCyanId = 12;
  static const fillColorSkyId = 13;
  static const fillColorBlueId = 14;
  static const fillColorPurpleId = 15;
  static const fillColorPinkId = 16;
  static const fillColorBrownId = 17;
  static const fillColorDefaultName = 'DEFAULT';
  static const fillColorGray4Name = 'GRAY 4';
  static const fillColorGray3Name = 'GRAY 3';
  static const fillColorGray2Name = 'GRAY 2';
  static const fillColorGray1Name = 'GRAY 1';
  static const fillColorRedName = 'RED';
  static const fillColorOrangeName = 'ORANGE';
  static const fillColorYellowName = 'YELLOW';
  static const fillColorLimeName = 'LIME';
  static const fillColorGreenName = 'GREEN';
  static const fillColorTealName = 'TEAL';
  static const fillColorCyanName = 'CYAN';
  static const fillColorSkyName = 'SKY';
  static const fillColorBlueName = 'BLUE';
  static const fillColorPurpleName = 'PURPLE';
  static const fillColorPinkName = 'PINK';
  static const fillColorBrownName = 'BROWN';
  static const fillColorLookup = {
    fillColorDefaultId: fillColorDefaultName,
    fillColorGray4Id: fillColorGray4Name,
    fillColorGray3Id: fillColorGray3Name,
    fillColorGray2Id: fillColorGray2Name,
    fillColorGray1Id: fillColorGray1Name,
    fillColorRedId: fillColorRedName,
    fillColorOrangeId: fillColorOrangeName,
    fillColorYellowId: fillColorYellowName,
    fillColorLimeId: fillColorLimeName,
    fillColorGreenId: fillColorGreenName,
    fillColorTealId: fillColorTealName,
    fillColorCyanId: fillColorCyanName,
    fillColorSkyId: fillColorSkyName,
    fillColorBlueId: fillColorBlueName,
    fillColorPurpleId: fillColorPurpleName,
    fillColorPinkId: fillColorPinkName,
    fillColorBrownId: fillColorBrownName,
  };

  // Entity : TextComponentHighlightColor
  // Table  : highlight_colors
  static const highlightColorNoneId = 1;
  static const highlightColorRedId = 2;
  static const highlightColorOrangeId = 3;
  static const highlightColorYellowId = 4;
  static const highlightColorLimeId = 5;
  static const highlightColorGreenId = 6;
  static const highlightColorTealId = 7;
  static const highlightColorCyanId = 8;
  static const highlightColorSkyId = 9;
  static const highlightColorBlueId = 10;
  static const highlightColorPurpleId = 11;
  static const highlightColorPinkId = 12;
  static const highlightColorNoneName = 'NONE';
  static const highlightColorRedName = 'RED';
  static const highlightColorOrangeName = 'ORANGE';
  static const highlightColorYellowName = 'YELLOW';
  static const highlightColorLimeName = 'LIME';
  static const highlightColorGreenName = 'GREEN';
  static const highlightColorTealName = 'TEAL';
  static const highlightColorCyanName = 'CYAN';
  static const highlightColorSkyName = 'SKY';
  static const highlightColorBlueName = 'BLUE';
  static const highlightColorPurpleName = 'PURPLE';
  static const highlightColorPinkName = 'PINK';
  static const highlightColorLookup = {
    highlightColorNoneId: highlightColorNoneName,
    highlightColorRedId: highlightColorRedName,
    highlightColorOrangeId: highlightColorOrangeName,
    highlightColorYellowId: highlightColorYellowName,
    highlightColorLimeId: highlightColorLimeName,
    highlightColorGreenId: highlightColorGreenName,
    highlightColorTealId: highlightColorTealName,
    highlightColorCyanId: highlightColorCyanName,
    highlightColorSkyId: highlightColorSkyName,
    highlightColorBlueId: highlightColorBlueName,
    highlightColorPurpleId: highlightColorPurpleName,
    highlightColorPinkId: highlightColorPinkName,
  };
}
