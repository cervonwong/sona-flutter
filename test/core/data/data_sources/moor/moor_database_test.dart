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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moor/ffi.dart';

import 'package:sona_flutter/core/constants/icon_symbol_constants.dart';
import 'package:sona_flutter/core/constants/lookup_and_mapper_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck_icon_spec.dart';

class MockIconSymbolConstants extends Mock implements IconSymbolConstants {}

void main() {
  late IconSymbolConstants iconSymbolConstants;
  late MoorDatabase db;

  setUp(() {
    iconSymbolConstants = MockIconSymbolConstants();
    when(() => iconSymbolConstants.currentVersion).thenReturn(1);
    when(() => iconSymbolConstants.values).thenReturn([]);

    db = MoorDatabase.test(
      executor: VmDatabase.memory(
        // Change the logStatement argument to true to print each SQL query for
        // debugging if needed. This is set to false to not pollute test logs.
        logStatements: false,
      ),
      iconSymbolConstants: iconSymbolConstants,
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
        'should have initialized records',
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
        'should have initialized records',
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
        'should have initialized records',
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
        'should have initialized records',
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
        'should have initialized records',
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

      test(
        'icon_colors table, '
        'should have initialized records',
        () async {
          final iconColorModels = await db.select(db.iconColors).get();

          expect(
            iconColorModels,
            [
              IconColorModel(
                id: LookupAndMapperConstants.iconColorRedId,
                name: LookupAndMapperConstants.iconColorRedName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorOrangeId,
                name: LookupAndMapperConstants.iconColorOrangeName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorYellowId,
                name: LookupAndMapperConstants.iconColorYellowName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorLimeId,
                name: LookupAndMapperConstants.iconColorLimeName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorGreenId,
                name: LookupAndMapperConstants.iconColorGreenName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorTealId,
                name: LookupAndMapperConstants.iconColorTealName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorCyanId,
                name: LookupAndMapperConstants.iconColorCyanName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorSkyId,
                name: LookupAndMapperConstants.iconColorSkyName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorBlueId,
                name: LookupAndMapperConstants.iconColorBlueName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorPurpleId,
                name: LookupAndMapperConstants.iconColorPurpleName,
              ),
              IconColorModel(
                id: LookupAndMapperConstants.iconColorPinkId,
                name: LookupAndMapperConstants.iconColorPinkName,
              ),
            ],
          );
        },
      );

      test(
        'icon_symbols table, '
        'should have initialized records',
        () async {
          // Default iconSymbolConstants mock in `setUp` above returns an
          // empty list. Update mocking to return some values for this test.
          when(() => iconSymbolConstants.values).thenReturn(
            _iconSymbolsValuesV1,
          );

          await db.close(); // Close the default db defined in `setUp` above.
          // Create own db to pass in the iconSymbolConstants with updated
          // mocking.
          db = MoorDatabase.test(
            executor: VmDatabase.memory(logStatements: false),
            iconSymbolConstants: iconSymbolConstants,
          );

          final fieldTypeModels = await db.select(db.iconSymbols).get();

          expect(
            fieldTypeModels,
            [
              IconSymbolModel(id: 1, name: 'DECK'),
              IconSymbolModel(id: 2, name: 'BOOK'),
              IconSymbolModel(id: 3, name: 'FLASK'),
            ],
          );
        },
      );

      test(
        'settings table, '
        'should have initial settings in one record',
        () async {
          final settings = await db.select(db.settings).get();

          expect(
            settings,
            [
              SettingsData(
                iconSymbolsVersion: MoorDatabase.initialIconSymbolsVersion,
              ),
            ],
          );
        },
      );
    },
  );

  // TODO: 6/10/2021 See https://github.com/simolus3/moor/discussions/1255.
  //  Decided to switch over to using schemaVersion. So integration tests need
  //  to be moved over to another file specifically for testing migrations, and
  //  can only be tested when there is a reason to do migrations, such as during
  //  production phase.
  group(
    'MoorDatabase when IconSymbolConstants is revised, '
    'should update tables accordingly',
    () {
      test(
        'icon_symbols table when the name of a symbol changes, '
        'should update name of expected record',
        () async {
          // Default iconSymbolConstants mock in `setUp` above returns an
          // empty list. Update mocking to return some values for this test.
          when(() => iconSymbolConstants.values).thenReturn(
            _iconSymbolsValuesV1,
          );

          await db.close(); // Close the default db defined in `setUp` above.
          // Create own db to pass in the iconSymbolConstants with updated
          // mocking.
          db = MoorDatabase.test(
            executor: VmDatabase.memory(logStatements: false),
            iconSymbolConstants: iconSymbolConstants,
          );

          await db.close(); // Close the db when updating iconSymbolConstants.
        },
      );
    },
    skip: true,
  );
}

const _iconSymbolsValuesV1 = [
  IconSymbolMetadata(
    id: 1,
    name: 'DECK',
    version: 1,
    symbol: DeckIconSymbol.deck,
    iconData: FluentIcons.style_guide_24_regular,
    searchTerms: [
      'deck',
      'style',
      'style guide',
    ],
  ),
  IconSymbolMetadata(
    id: 2,
    name: 'BOOK',
    version: 1,
    symbol: DeckIconSymbol.book,
    iconData: FluentIcons.book_24_regular,
    searchTerms: [
      'book',
      'diary',
      'documentation',
      'journal',
      'library',
      'read',
    ],
  ),
  IconSymbolMetadata(
    id: 3,
    name: 'FLASK',
    version: 1,
    symbol: DeckIconSymbol.flask,
    iconData: FluentIcons.beaker_24_regular,
    searchTerms: [
      'biology',
      'beaker',
      'chemistry',
      'experimental',
      'flask',
      'labs',
      'science',
    ],
  ),
];

// Name of symbol 'BOOK' changed to 'LIVRE'.
// ignore: unused_element
const _iconSymbolsValuesV2 = [
  IconSymbolMetadata(
    id: 1,
    name: 'DECK',
    version: 1,
    symbol: DeckIconSymbol.deck,
    iconData: FluentIcons.style_guide_24_regular,
    searchTerms: [
      'deck',
      'style',
      'style guide',
    ],
  ),
  IconSymbolMetadata(
    id: 2,
    name: 'LIVRE',
    // Changed from 'BOOK'.
    version: 2,
    // Incremented.
    symbol: DeckIconSymbol.book,
    iconData: FluentIcons.book_24_regular,
    searchTerms: [
      'book',
      'diary',
      'documentation',
      'journal',
      'library',
      'read',
    ],
  ),
  IconSymbolMetadata(
    id: 3,
    name: 'FLASK',
    version: 1,
    symbol: DeckIconSymbol.flask,
    iconData: FluentIcons.beaker_24_regular,
    searchTerms: [
      'biology',
      'beaker',
      'chemistry',
      'experimental',
      'flask',
      'labs',
      'science',
    ],
  ),
];

// Added symbol 'LEAF TWO'.
// ignore: unused_element
const _iconSymbolsValuesV3 = [
  IconSymbolMetadata(
    id: 1,
    name: 'DECK',
    version: 1,
    symbol: DeckIconSymbol.deck,
    iconData: FluentIcons.style_guide_24_regular,
    searchTerms: [
      'deck',
      'style',
      'style guide',
    ],
  ),
  IconSymbolMetadata(
    id: 2,
    name: 'LIVRE',
    version: 2,
    symbol: DeckIconSymbol.book,
    iconData: FluentIcons.book_24_regular,
    searchTerms: [
      'book',
      'diary',
      'documentation',
      'journal',
      'library',
      'read',
    ],
  ),
  IconSymbolMetadata(
    id: 3,
    name: 'FLASK',
    version: 1,
    symbol: DeckIconSymbol.flask,
    iconData: FluentIcons.beaker_24_regular,
    searchTerms: [
      'biology',
      'beaker',
      'chemistry',
      'experimental',
      'flask',
      'labs',
      'science',
    ],
  ),
  IconSymbolMetadata(
      // Added.
      id: 4,
      name: 'LEAF TWO',
      version: 3,
      symbol: DeckIconSymbol.leafTwo,
      iconData: FluentIcons.leaf_two_24_regular,
      searchTerms: [
        'biology'
            'leaf',
        'leaves',
        'nature',
        'plants',
      ]),
];
