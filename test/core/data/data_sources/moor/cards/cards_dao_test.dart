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
import 'package:sona_flutter/core/constants/material_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/cards/cards_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

// This is an integration test with MoorDatabase.
void main() {
  CardsDao dao;
  MoorDatabase db;

  setUp(() async {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: true,
    ));
    // Disables foreign key constraints while testing. Tests for foreign key
    // constraints are in foreign_constraints_test.dart.
    await db.customStatement('PRAGMA foreign_keys = OFF');

    dao = CardsDaoImpl(db: db);
  });

  tearDown(() async {
    await db?.close();
  });

  Future<List<CardModel>> selectAll() async {
    return db.select(db.cards).get();
  }

  group(
    'CardsDaoImpl create',
    () {
      group(
        'when passed legal name (called three times to create three cards)',
        () {
          CardModel card1, card2, card3;
          setUp(() async {
            card1 = await dao.create(entryId: 1, position: 1);
            card2 = await dao.create(entryId: 1, position: 2);
            card3 = await dao.create(entryId: 2, position: 1);
          });

          test(
            'should create expected records in cards table',
            () async {
              expect(
                await selectAll(),
                [
                  CardModel(
                    entryId: 1,
                    position: 1,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                  CardModel(
                    entryId: 1,
                    position: 2,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                  CardModel(
                    entryId: 2,
                    position: 1,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                ],
              );
            },
          );

          test(
            'should return expected CardModels',
            () async {
              expect(
                card1,
                CardModel(
                  entryId: 1,
                  position: 1,
                  starred: kDefaultCardStarred,
                  hidden: kDefaultCardHidden,
                ),
              );

              expect(
                card2,
                CardModel(
                  entryId: 1,
                  position: 2,
                  starred: kDefaultCardStarred,
                  hidden: kDefaultCardHidden,
                ),
              );

              expect(
                card3,
                CardModel(
                  entryId: 2,
                  position: 1,
                  starred: kDefaultCardStarred,
                  hidden: kDefaultCardHidden,
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
            'entryId is null',
            () async {
              expect(
                () async {
                  await dao.create(entryId: null, position: 3);
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'position is null',
            () async {
              expect(
                () async {
                  await dao.create(entryId: 1, position: null);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'when a card in the db has the same PK as the passed PK arguments, '
        'should fail asserts',
        () async {
          await dao.create(entryId: 6, position: 9);
          expect(
            () async {
              await dao.create(entryId: 6, position: 9);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );
}
