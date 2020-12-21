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
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:sona_flutter/core/constants/material_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/decks/decks_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/utils/system_time.dart';

class MockSystemTime extends Mock implements SystemTime {}

// This is an integration test with MoorDatabase.
void main() {
  DecksDao dao;
  SystemTime systemTime;
  MoorDatabase db;

  setUp(() {
    db = MoorDatabase(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    systemTime = MockSystemTime();
    when(systemTime.now()).thenReturn(DateTime(2020));
    dao = DecksDaoImpl(db: db, systemTime: systemTime);
  });

  tearDown(() async {
    await db?.close();
  });

  Future<List<DeckModel>> selectAll() async {
    return db.select(db.decks).get();
  }

  group(
    'DecksDaoImpl create',
    () {
      group(
        'when passed legal name',
        () {
          DeckModel deck;
          setUp(() async {
            deck = await dao.create(name: 'Leo');
          });

          test(
            'should create expected record in database',
            () async {
              final all = await selectAll();
              expect(all, hasLength(1));

              final record = all[0];
              expect(
                record,
                DeckModel(
                  id: 1,
                  name: 'Leo',
                  created: DateTime(2020),
                  lastEdited: DateTime(2020),
                  authorName: kDefaultDeckAuthorName,
                  description: kDefaultDeckDescription,
                ),
              );
            },
          );

          test(
            'should return expected DeckModel',
            () async {
              expect(
                deck,
                DeckModel(
                  id: 1,
                  name: 'Leo',
                  created: DateTime(2020),
                  lastEdited: DateTime(2020),
                  authorName: kDefaultDeckAuthorName,
                  description: kDefaultDeckDescription,
                ),
              );
            },
          );
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
        'when a deck in the db has the same name as the passed name, '
        'should fail asserts',
        () async {
          await dao.create(name: 'Cancer');

          expect(
            () async {
              await dao.create(name: 'Cancer');
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'DecksDaoImpl getById',
    () {
      test(
        'when passed legal id, '
        'should return expected DeckModel',
        () async {
          final id = (await dao.create(name: 'Virgo')).id;

          final deck = await dao.getById(id: id);
          expect(
            deck,
            DeckModel(
              id: id,
              name: 'Virgo',
              created: DateTime(2020),
              lastEdited: DateTime(2020),
              authorName: kDefaultDeckAuthorName,
              description: kDefaultDeckDescription,
            ),
          );
        },
      );

      test(
        'when no decks in the db has the same id as the passed id, '
        'should return null',
        () async {
          final tag = await dao.getById(id: -1);
          expect(tag, isNull);
        },
      );

      test(
        'when passed null id, '
        'should fail asserts',
        () {
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
