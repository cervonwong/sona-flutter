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

import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../../constants/icon_symbol_constants.dart';
import '../../../constants/lookup_and_mapper_constants.dart';
import 'moor_tables.dart';

part 'moor_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await path_provider.getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: kTables)
class MoorDatabase extends _$MoorDatabase {
  // `IconSymbolConstants.value` is a large list which changes frequently. In
  // order to make predictable tests, a mocked instance of `IconSymbolConstants`
  // can be passed into classes which use it. By default, _iconSymbolConstants
  // is `const IconSymbolConstants()`.
  final IconSymbolConstants _iconSymbolConstants;

  // Constants used in method in this class `_initializeSettings`.
  // As min version is 1, setting initial version as 0, forces initialization of
  // icon_symbols and symbol_search_terms tables.
  static const initialIconSymbolsVersion = 0;

  MoorDatabase()
      : this._internal(
          executor: _openConnection(),
          iconSymbolConstants: const IconSymbolConstants(),
        );

  MoorDatabase.test({
    required QueryExecutor executor,
    IconSymbolConstants iconSymbolConstants = const IconSymbolConstants(),
  }) : this._internal(
          executor: executor,
          iconSymbolConstants: iconSymbolConstants,
        );

  MoorDatabase._internal({
    required QueryExecutor executor,
    required IconSymbolConstants iconSymbolConstants,
  })  : _iconSymbolConstants = iconSymbolConstants,
        super(executor);

  // Update this each time the database structure (tables) have been changed
  // after this app has been released.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        if (details.wasCreated) {
          await batch(
            (batch) {
              _initializeFieldTypes(batch);
              _initializeComponentTypes(batch);
              _initializeAlignments(batch);
              _initializeFillColors(batch);
              _initializeHighlightColors(batch);
              _initializeIconColors(batch);
              _initializeIconSymbols(batch);
              _initializeSymbolSearchTerms(batch);
              _initializeSettings(batch);
            },
          );
        }
      },
    );
  }

  void _initializeFieldTypes(Batch batch) {
    batch.insertAll(
      fieldTypes,
      LookupAndMapperConstants.fieldTypeLookup.entries
          .map((entry) => FieldTypeModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeComponentTypes(Batch batch) {
    batch.insertAll(
      componentTypes,
      LookupAndMapperConstants.componentTypeLookup.entries
          .map((entry) => ComponentTypeModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeAlignments(Batch batch) {
    batch.insertAll(
      alignments,
      LookupAndMapperConstants.alignmentLookup.entries
          .map((entry) => AlignmentModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeFillColors(Batch batch) {
    batch.insertAll(
      fillColors,
      LookupAndMapperConstants.fillColorLookup.entries
          .map((entry) => FillColorModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeHighlightColors(Batch batch) {
    batch.insertAll(
      highlightColors,
      LookupAndMapperConstants.highlightColorLookup.entries
          .map((entry) => HighlightColorModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeIconColors(Batch batch) {
    batch.insertAll(
      iconColors,
      LookupAndMapperConstants.iconColorLookup.entries
          .map((entry) => IconColorModel(id: entry.key, name: entry.value))
          .toList(),
    );
  }

  void _initializeIconSymbols(Batch batch) {
    batch.insertAll(
      iconSymbols,
      _iconSymbolConstants.values
          .map((metadata) => IconSymbolModel(
                id: metadata.id,
                name: metadata.name,
              ))
          .toList(),
    );
  }

  void _initializeSymbolSearchTerms(Batch batch) {
    // For the symbol_search_terms table, things get a little more complicated
    // to initialize. A simple `.map` won't work. (At least idk how to do it.)
    var symbolSearchTermModels = <SymbolSearchTermModel>[];

    for (var metadata in _iconSymbolConstants.values) {
      for (var term in metadata.searchTerms) {
        symbolSearchTermModels.add(
          SymbolSearchTermModel(iconSymbolId: metadata.id, term: term),
        );
      }
    }

    batch.insertAll(symbolSearchTerms, symbolSearchTermModels);
  }

  void _initializeSettings(Batch batch) {
    batch.insert(
      settings,
      SettingsData(iconSymbolsVersion: initialIconSymbolsVersion),
    );
  }
}
