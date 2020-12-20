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
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/data_sources/moor/tags/tags_dao.dart';

void main() {
  TagsDao dao;
  MoorDatabase db;

  setUp(() {
    db = MoorDatabase(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    dao = TagsDao(db);
  });

  tearDown(() async {
    await db?.close();
  });

  group(
    'TagsDao create',
    () {
      test(
        'when passed valid name, '
        'should return expected TagModel',
        () async {
          final tag = await dao.create(name: 'Tag name');

          expect(tag, TagModel(id: 1, name: 'Tag name'));
        },
      );

      test(
        'when passed null name, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.create(name: null);
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when a tag in the db has the same name as the passed name, '
        'should fail asserts',
        () async {
          await dao.create(name: 'Tag name');

          expect(
            () async {
              await dao.create(name: 'Tag name');
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'TagsDao getById',
    () {
      test(
        'when passed valid id, '
        'should return expected TagModel',
        () async {
          final id = (await dao.create(name: 'Random tag')).id;

          final tag = await dao.getById(id: id);
          expect(tag, TagModel(id: id, name: 'Random tag'));
        },
      );

      test(
        'when no tags in the db has the same id as the passed id, '
        'should return null',
        () async {
          final tag = await dao.getById(id: -1);
          expect(tag, isNull);
        },
      );

      test(
        'when passed null id, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.getById(id: null);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );
}
