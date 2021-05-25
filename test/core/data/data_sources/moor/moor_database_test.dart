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

import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:sona_flutter/core/data/constants/lookup_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

void main() {
  MoorDatabase db;

  setUp(() {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
  });

  tearDown(() async {
    await db?.close();
  });

  group(
    'MoorDatabase when first created, '
    'should initialize lookup tables',
    () {
      test(
        'field_types table, '
        'should have expected records',
        () async {
          final fieldTypeModels = await db.select(db.fieldTypes).get();

          expect(
            fieldTypeModels,
            [
              FieldTypeModel(
                  id: LookupConstants.fieldTypeTextId,
                  name: LookupConstants.fieldTypeTextName),
              FieldTypeModel(
                  id: LookupConstants.fieldTypeImageId,
                  name: LookupConstants.fieldTypeImageName),
            ],
          );
        },
      );

      test(
        'component_types table, '
        'should have expected records',
        () async {
          final componentTypeModels = await db.select(db.componentTypes).get();

          expect(
            componentTypeModels,
            [
              ComponentTypeModel(
                id: LookupConstants.componentTypeTextId,
                name: LookupConstants.componentTypeTextName,
              ),
              ComponentTypeModel(
                id: LookupConstants.componentTypeImageId,
                name: LookupConstants.componentTypeImageName,
              ),
              ComponentTypeModel(
                id: LookupConstants.componentTypeDividerId,
                name: LookupConstants.componentTypeDividerName,
              ),
            ],
          );
        },
      );

      test(
        'alignments table, '
        'should have expected records',
        () async {
          final alignmentModels = await db.select(db.alignments).get();

          expect(
            alignmentModels,
            [
              AlignmentModel(
                id: LookupConstants.alignmentCenterId,
                name: LookupConstants.alignmentCenterName,
              ),
              AlignmentModel(
                id: LookupConstants.alignmentStartId,
                name: LookupConstants.alignmentStartName,
              ),
              AlignmentModel(
                id: LookupConstants.alignmentEndId,
                name: LookupConstants.alignmentEndName,
              ),
              AlignmentModel(
                id: LookupConstants.alignmentJustifyId,
                name: LookupConstants.alignmentJustifyName,
              ),
            ],
          );
        },
      );

      test(
        'fill_colors table, '
        'should have expected records',
        () async {
          final fillColorModels = await db.select(db.fillColors).get();

          expect(
            fillColorModels,
            [
              FillColorModel(
                id: LookupConstants.fillColorDefaultId,
                name: LookupConstants.fillColorDefaultName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorGray4Id,
                name: LookupConstants.fillColorGray4Name,
              ),
              FillColorModel(
                id: LookupConstants.fillColorGray3Id,
                name: LookupConstants.fillColorGray3Name,
              ),
              FillColorModel(
                id: LookupConstants.fillColorGray2Id,
                name: LookupConstants.fillColorGray2Name,
              ),
              FillColorModel(
                id: LookupConstants.fillColorGray1Id,
                name: LookupConstants.fillColorGray1Name,
              ),
              FillColorModel(
                id: LookupConstants.fillColorRedId,
                name: LookupConstants.fillColorRedName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorOrangeId,
                name: LookupConstants.fillColorOrangeName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorYellowId,
                name: LookupConstants.fillColorYellowName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorLimeId,
                name: LookupConstants.fillColorLimeName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorGreenId,
                name: LookupConstants.fillColorGreenName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorTealId,
                name: LookupConstants.fillColorTealName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorCyanId,
                name: LookupConstants.fillColorCyanName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorSkyId,
                name: LookupConstants.fillColorSkyName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorBlueId,
                name: LookupConstants.fillColorBlueName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorPurpleId,
                name: LookupConstants.fillColorPurpleName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorPinkId,
                name: LookupConstants.fillColorPinkName,
              ),
              FillColorModel(
                id: LookupConstants.fillColorBrownId,
                name: LookupConstants.fillColorBrownName,
              ),
            ],
          );
        },
      );

      test(
        'highlight_colors table, '
        'should have expected records',
        () async {
          final highlightColorModels =
              await db.select(db.highlightColors).get();

          expect(
            highlightColorModels,
            [
              HighlightColorModel(
                id: LookupConstants.highlightColorNoneId,
                name: LookupConstants.highlightColorNoneName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorRedId,
                name: LookupConstants.highlightColorRedName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorOrangeId,
                name: LookupConstants.highlightColorOrangeName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorYellowId,
                name: LookupConstants.highlightColorYellowName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorLimeId,
                name: LookupConstants.highlightColorLimeName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorGreenId,
                name: LookupConstants.highlightColorGreenName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorTealId,
                name: LookupConstants.highlightColorTealName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorCyanId,
                name: LookupConstants.highlightColorCyanName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorSkyId,
                name: LookupConstants.highlightColorSkyName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorBlueId,
                name: LookupConstants.highlightColorBlueName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorPurpleId,
                name: LookupConstants.highlightColorPurpleName,
              ),
              HighlightColorModel(
                id: LookupConstants.highlightColorPinkId,
                name: LookupConstants.highlightColorPinkName,
              ),
            ],
          );
        },
      );
    },
  );
}
