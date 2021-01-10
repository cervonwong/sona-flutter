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
              FieldTypeModel(id: kFieldTypeTextId, name: kFieldTypeTextName),
              FieldTypeModel(id: kFieldTypeImageId, name: kFieldTypeImageName),
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
                id: kComponentTypeTextId,
                name: kComponentTypeTextName,
              ),
              ComponentTypeModel(
                id: kComponentTypeImageId,
                name: kComponentTypeImageName,
              ),
              ComponentTypeModel(
                id: kComponentTypeDividerId,
                name: kComponentTypeDividerName,
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
                id: kAlignmentCenterId,
                name: kAlignmentCenterName,
              ),
              AlignmentModel(
                id: kAlignmentStartId,
                name: kAlignmentStartName,
              ),
              AlignmentModel(
                id: kAlignmentEndId,
                name: kAlignmentEndName,
              ),
              AlignmentModel(
                id: kAlignmentJustifyId,
                name: kAlignmentJustifyName,
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
                id: kFillColorNeutralId,
                name: kFillColorNeutralName,
              ),
              FillColorModel(
                id: kFillColorRedId,
                name: kFillColorRedName,
              ),
              FillColorModel(
                id: kFillColorOrangeId,
                name: kFillColorOrangeName,
              ),
              FillColorModel(
                id: kFillColorYellowId,
                name: kFillColorYellowName,
              ),
              FillColorModel(
                id: kFillColorBlueId,
                name: kFillColorBlueName,
              ),
              FillColorModel(
                id: kFillColorPurpleId,
                name: kFillColorPurpleName,
              ),
              FillColorModel(
                id: kFillColorMagentaId,
                name: kFillColorMagentaName,
              ),
              FillColorModel(
                id: kFillColorBrownId,
                name: kFillColorBrownName,
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
                id: kHighlightColorNoneId,
                name: kHighlightColorNoneName,
              ),
              HighlightColorModel(
                id: kHighlightColorPinkId,
                name: kHighlightColorPinkName,
              ),
              HighlightColorModel(
                id: kHighlightColorOrangeId,
                name: kHighlightColorOrangeName,
              ),
              HighlightColorModel(
                id: kHighlightColorYellowId,
                name: kHighlightColorYellowName,
              ),
              HighlightColorModel(
                id: kHighlightColorGreenId,
                name: kHighlightColorGreenName,
              ),
              HighlightColorModel(
                id: kHighlightColorBlueId,
                name: kHighlightColorBlueName,
              ),
              HighlightColorModel(
                id: kHighlightColorPurpleId,
                name: kHighlightColorPurpleName,
              ),
            ],
          );
        },
      );
    },
  );
}
