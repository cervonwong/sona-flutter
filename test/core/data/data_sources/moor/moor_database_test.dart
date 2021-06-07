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

import 'package:sona_flutter/core/constants/lookup_and_mapper_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

void main() {
  late MoorDatabase db;

  setUp(() {
    db = MoorDatabase.test(
      executor: VmDatabase.memory(
        // Change the logStatement argument to true to print each SQL query for
        // debugging if needed. This is set to false to not pollute test logs.
        logStatements: false,
      ),
    );
  });

  tearDown(() async {
    await db.close();
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
                  id: LookupAndMapperConstants.fieldTypeTextId,
                  name: LookupAndMapperConstants.fieldTypeTextName),
              FieldTypeModel(
                  id: LookupAndMapperConstants.fieldTypeImageId,
                  name: LookupAndMapperConstants.fieldTypeImageName),
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
                id: LookupAndMapperConstants.componentTypeTextId,
                name: LookupAndMapperConstants.componentTypeTextName,
              ),
              ComponentTypeModel(
                id: LookupAndMapperConstants.componentTypeImageId,
                name: LookupAndMapperConstants.componentTypeImageName,
              ),
              ComponentTypeModel(
                id: LookupAndMapperConstants.componentTypeDividerId,
                name: LookupAndMapperConstants.componentTypeDividerName,
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
                id: LookupAndMapperConstants.alignmentCenterId,
                name: LookupAndMapperConstants.alignmentCenterName,
              ),
              AlignmentModel(
                id: LookupAndMapperConstants.alignmentStartId,
                name: LookupAndMapperConstants.alignmentStartName,
              ),
              AlignmentModel(
                id: LookupAndMapperConstants.alignmentEndId,
                name: LookupAndMapperConstants.alignmentEndName,
              ),
              AlignmentModel(
                id: LookupAndMapperConstants.alignmentJustifyId,
                name: LookupAndMapperConstants.alignmentJustifyName,
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
                id: LookupAndMapperConstants.fillColorDefaultId,
                name: LookupAndMapperConstants.fillColorDefaultName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorGray4Id,
                name: LookupAndMapperConstants.fillColorGray4Name,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorGray3Id,
                name: LookupAndMapperConstants.fillColorGray3Name,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorGray2Id,
                name: LookupAndMapperConstants.fillColorGray2Name,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorGray1Id,
                name: LookupAndMapperConstants.fillColorGray1Name,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorRedId,
                name: LookupAndMapperConstants.fillColorRedName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorOrangeId,
                name: LookupAndMapperConstants.fillColorOrangeName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorYellowId,
                name: LookupAndMapperConstants.fillColorYellowName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorLimeId,
                name: LookupAndMapperConstants.fillColorLimeName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorGreenId,
                name: LookupAndMapperConstants.fillColorGreenName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorTealId,
                name: LookupAndMapperConstants.fillColorTealName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorCyanId,
                name: LookupAndMapperConstants.fillColorCyanName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorSkyId,
                name: LookupAndMapperConstants.fillColorSkyName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorBlueId,
                name: LookupAndMapperConstants.fillColorBlueName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorPurpleId,
                name: LookupAndMapperConstants.fillColorPurpleName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorPinkId,
                name: LookupAndMapperConstants.fillColorPinkName,
              ),
              FillColorModel(
                id: LookupAndMapperConstants.fillColorBrownId,
                name: LookupAndMapperConstants.fillColorBrownName,
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
                id: LookupAndMapperConstants.highlightColorNoneId,
                name: LookupAndMapperConstants.highlightColorNoneName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorRedId,
                name: LookupAndMapperConstants.highlightColorRedName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorOrangeId,
                name: LookupAndMapperConstants.highlightColorOrangeName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorYellowId,
                name: LookupAndMapperConstants.highlightColorYellowName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorLimeId,
                name: LookupAndMapperConstants.highlightColorLimeName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorGreenId,
                name: LookupAndMapperConstants.highlightColorGreenName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorTealId,
                name: LookupAndMapperConstants.highlightColorTealName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorCyanId,
                name: LookupAndMapperConstants.highlightColorCyanName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorSkyId,
                name: LookupAndMapperConstants.highlightColorSkyName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorBlueId,
                name: LookupAndMapperConstants.highlightColorBlueName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorPurpleId,
                name: LookupAndMapperConstants.highlightColorPurpleName,
              ),
              HighlightColorModel(
                id: LookupAndMapperConstants.highlightColorPinkId,
                name: LookupAndMapperConstants.highlightColorPinkName,
              ),
            ],
          );
        },
      );
    },
  );
}
