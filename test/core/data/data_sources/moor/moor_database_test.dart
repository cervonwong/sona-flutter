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

import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:sona_flutter/core/data/constants/lookup_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

void main() {
  MoorDatabase db;

  setUp(() {
    db = MoorDatabase(VmDatabase.memory(
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
        'field_types table should have expected records',
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
    },
  );
}
