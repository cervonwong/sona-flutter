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

// TODO(cervonwong): 21/12/2020 Update test messages and structure to match
//  other tests (for e.g. decks_dao_test.dart).

// This is an integration test with MoorDatabase.
void main() {
  TagsDao dao;
  MoorDatabase db;

  setUp(() {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    dao = TagsDaoImpl(db: db);
  });

  tearDown(() async {
    await db?.close();
  });

  Future<List<TagModel>> selectAll() async {
    return db.select(db.tags).get();
  }

  group(
    'TagsDaoImpl create',
    () {
      test(
        'when passed legal name, '
        'should return expected TagModel',
        () async {
          final tag = await dao.create(name: 'Tag name');
          expect(await selectAll(), [TagModel(id: 1, name: 'Tag name')]);

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
          expect(await selectAll(), [TagModel(id: 1, name: 'Tag name')]);

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
    'TagsDaoImpl getById',
    () {
      test(
        'when passed legal id, '
        'should return expected TagModel',
        () async {
          final id = (await dao.create(name: 'Random tag')).id;
          expect(await selectAll(), [TagModel(id: id, name: 'Random tag')]);

          final tag = await dao.getById(id: id);
          expect(tag, TagModel(id: id, name: 'Random tag'));
        },
      );

      test(
        'when no tags in the db has the same ID as the passed id, '
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

  group(
    'TagsDaoImpl getAll',
    () {
      test(
        'when there are no tags in the db, '
        'should return an empty list',
        () async {
          final tags = await dao.getAll();

          expect(tags, <TagModel>[]);
        },
      );

      test(
        'when there are multiple tags in the db, '
        'should return the expected TagModels in order of creation',
        () async {
          await dao.create(name: 'Tag 1');
          await dao.create(name: 'Tag 2');
          await dao.create(name: 'Tag 3');
          expect(
            await selectAll(),
            [
              TagModel(id: 1, name: 'Tag 1'),
              TagModel(id: 2, name: 'Tag 2'),
              TagModel(id: 3, name: 'Tag 3'),
            ],
          );

          final tags = await dao.getAll();
          expect(
            tags,
            [
              TagModel(id: 1, name: 'Tag 1'),
              TagModel(id: 2, name: 'Tag 2'),
              TagModel(id: 3, name: 'Tag 3'),
            ],
          );
        },
      );
    },
  );

  group(
    'TagsDaoImpl rename',
    () {
      test(
        'when passed legal arguments, '
        'should update expected records in decks table',
        () async {
          final id = (await dao.create(name: 'Old name')).id;
          expect(await selectAll(), [TagModel(id: 1, name: 'Old name')]);

          await dao.rename(id: id, newName: 'New name');
          expect(await selectAll(), [TagModel(id: 1, name: 'New name')]);
        },
      );

      test(
        'when passed the original name of the tag, '
        'should update expected records in decks table',
        () async {
          final id = (await dao.create(name: 'Same name')).id;
          expect(await selectAll(), [TagModel(id: 1, name: 'Same name')]);

          await dao.rename(id: id, newName: 'Same name');
          expect(await selectAll(), [TagModel(id: 1, name: 'Same name')]);
        },
      );

      group(
        'when passed null arguments, '
        'should fail asserts',
        () {
          test(
            'id is null',
            () async {
              expect(
                () async {
                  await dao.rename(id: null, newName: 'New name');
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'newName is null',
            () async {
              final id = (await dao.create(name: 'Random tag')).id;
              expect(await selectAll(), [TagModel(id: 1, name: 'Random tag')]);

              expect(
                () async {
                  await dao.rename(id: id, newName: null);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'when no tags in the db has the same ID as the passed id, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.rename(id: 1, newName: 'New name');
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when a tag in the db has the same name as the passed newName, '
        'should fail asserts',
        () async {
          final id = (await dao.create(name: 'Alpha')).id;
          await dao.create(name: 'Beta');
          expect(
            await selectAll(),
            [
              TagModel(id: 1, name: 'Alpha'),
              TagModel(id: 2, name: 'Beta'),
            ],
          );

          expect(
            () async {
              await dao.rename(id: id, newName: 'Beta');
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'TagsDaoImpl remove',
    () {
      test(
        'when passed legal id, '
        'should update expected records in decks table',
        () async {
          final id = (await dao.create(name: 'Random tag')).id;
          expect(await selectAll(), [TagModel(id: 1, name: 'Random tag')]);

          await dao.remove(id: id);
          expect(await selectAll(), <TagModel>[]);
        },
      );

      test(
        'when passed null id, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.remove(id: null);
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when no tags in the db has the same ID as the passed id, '
        'should fail asserts',
        () {
          expect(
            () async {
              await dao.remove(id: -1);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );
}
