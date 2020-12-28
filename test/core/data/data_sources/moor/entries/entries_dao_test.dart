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
import 'package:sona_flutter/core/data/data_sources/moor/entries/entries_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

// This is an integration test with MoorDatabase.
void main() {
  EntriesDao dao;
  MoorDatabase db;

  setUp(() async {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    // Disables foreign key constraints while testing. Tests for foreign key
    // constraints are in foreign_constraints_test.dart.
    await db.customStatement('PRAGMA foreign_keys = OFF');

    dao = EntriesDaoImpl(db: db);
  });

  tearDown(() async => await db?.close());

  Future<List<EntryModel>> selectAll() async => db.select(db.entries).get();

  group(
    'EntriesDaoImpl create',
    () {
      group(
        'when passed legal arguments '
        '(called three times to create three entries)',
        () {
          EntryModel entry1, entry2, entry3;
          setUp(() async {
            entry1 = await dao.create(deckId: 1, entryTypeId: 1);
            entry2 = await dao.create(deckId: 2, entryTypeId: 1);
            entry3 = await dao.create(deckId: 1, entryTypeId: 2);
          });

          test(
            'should create expected records in entries table',
            () async {
              expect(
                await selectAll(),
                [
                  EntryModel(
                    id: 1,
                    deckId: 1,
                    entryTypeId: 1,
                  ),
                  EntryModel(
                    id: 2,
                    deckId: 2,
                    entryTypeId: 1,
                  ),
                  EntryModel(
                    id: 3,
                    deckId: 1,
                    entryTypeId: 2,
                  ),
                ],
              );
            },
          );

          test(
            'should return expected EntryModels',
            () {
              expect(
                entry1,
                EntryModel(
                  id: 1,
                  deckId: 1,
                  entryTypeId: 1,
                ),
              );

              expect(
                entry2,
                EntryModel(
                  id: 2,
                  deckId: 2,
                  entryTypeId: 1,
                ),
              );

              expect(
                entry3,
                EntryModel(
                  id: 3,
                  deckId: 1,
                  entryTypeId: 2,
                ),
              );
            },
          );
        },
      );

      group(
        'when passed null arguments, '
        'should fail asserts',
        () {
          test(
            'deckId is null',
            () async {
              expect(
                () async {
                  await dao.create(deckId: null, entryTypeId: 1);
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'entryTypeId is null',
            () async {
              expect(
                () async {
                  await dao.create(deckId: 1, entryTypeId: null);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );
    },
  );

  group(
    'EntriesDaoImpl getSingle',
    () {
      test(
        'when passed legal arguments, '
        'should return expected EntryModel',
        () async {
          final entryCreated = await dao.create(deckId: 6, entryTypeId: 9);
          final entryGotten = await dao.getSingle(id: entryCreated.id);

          expect(entryCreated, entryGotten);
        },
      );

      test(
        'when no entries in the db has the same id as the passed id, '
        'should return null',
        () async {
          final result = await dao.getSingle(id: 1);

          expect(result, isNull);
        },
      );

      test(
        'when passed null id, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.getSingle(id: null);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntriesDaoImpl getAll',
    () {
      test(
        'when there are no entries in the db, '
        'should return an empty list of EntryModels',
        () async {
          final entries = await dao.getAll();

          expect(entries, <EntryModel>[]);
        },
      );

      test(
        'when there are multiple entries in the db, '
        'should return the expected list of EntryModels '
        'in order of creation',
        () async {
          await dao.create(deckId: 2, entryTypeId: 2);
          await dao.create(deckId: 3, entryTypeId: 3);
          await dao.create(deckId: 1, entryTypeId: 1);

          final entries = await dao.getAll();
          expect(
            entries,
            [
              EntryModel(
                id: 1,
                deckId: 2,
                entryTypeId: 2,
              ),
              EntryModel(
                id: 2,
                deckId: 3,
                entryTypeId: 3,
              ),
              EntryModel(
                id: 3,
                deckId: 1,
                entryTypeId: 1,
              ),
            ]
          );
        },
      );
    },
  );
}
