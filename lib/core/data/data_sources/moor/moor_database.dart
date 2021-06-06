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
  MoorDatabase() : super(_openConnection());

  MoorDatabase.custom(QueryExecutor e) : super(e);

  // Update this each time the database structure (tables) have been changed
  // after this app has been released.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        if (!details.wasCreated) return;

        await batch(
          (batch) {
            _initializeFieldTypes(batch);
            _initializeComponentTypes(batch);
            _initializeAlignments(batch);
            _initializeFillColors(batch);
            _initializeHighlightColors(batch);
          },
        );
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
}
