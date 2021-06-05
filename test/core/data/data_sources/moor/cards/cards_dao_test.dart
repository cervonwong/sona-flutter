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

import 'package:sona_flutter/core/constants/material_constants.dart';
import 'package:sona_flutter/core/data/data_exceptions.dart';
import 'package:sona_flutter/core/data/data_sources/moor/cards/cards_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';

// This is an integration test with MoorDatabase.
void main() {
  late CardsDao dao;
  late MoorDatabase db;

  setUp(() async {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    // Disables foreign key constraints while testing. Tests for foreign key
    // constraints are in foreign_constraints_test.dart.
    await db.customStatement('PRAGMA foreign_keys = OFF');

    dao = CardsDaoImpl(db: db);
  });

  tearDown(() async {
    await db.close();
  });

  Future<List<CardModel>> selectAll() async {
    return db.select(db.cards).get();
  }

  group(
    'CardsDaoImpl create',
    () {
      group(
        'when passed legal arguments (called three times to create three cards)',
        () {
          late CardModel card1, card2, card3;
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
            'should return expected CardModeFls',
            () {
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

  group(
    'CardsDaoImpl getSingle',
    () {
      test(
        'when passed legal arguments, '
        'should return expected CardModel',
        () async {
          final cardCreated = await dao.create(entryId: 5, position: 1);
          final cardGotten = await dao.getSingle(
            entryId: cardCreated.entryId,
            position: cardCreated.position,
          );

          expect(cardCreated, cardGotten);
        },
      );

      test(
        'when no cards in the db has the same PK as the passed PK arguments, '
        'should return null',
        () async {
          final result = await dao.getSingle(
            entryId: 1,
            position: 1,
          );

          expect(result, isNull);
        },
      );
    },
  );

  group(
    'CardsDaoImpl getAll',
    () {
      group(
        'when called with no arguments',
        () {
          test(
            'when there are no cards in the db, '
            'should return an empty list of CardModels',
            () async {
              final cards = await dao.getAll();

              expect(cards, <CardModel>[]);
            },
          );

          test(
            'when there are multiple cards in the db, '
            'should return the expected list of CardModels '
            'in order of creation',
            () async {
              await dao.create(entryId: 2, position: 2);
              await dao.create(entryId: 3, position: 3);
              await dao.create(entryId: 1, position: 1);

              final cards = await dao.getAll();
              expect(
                cards,
                [
                  CardModel(
                    entryId: 2,
                    position: 2,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                  CardModel(
                    entryId: 3,
                    position: 3,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                  CardModel(
                    entryId: 1,
                    position: 1,
                    starred: kDefaultCardStarred,
                    hidden: kDefaultCardHidden,
                  ),
                ],
              );
            },
          );
        },
      );

      group(
        'when called with legal entryIds',
        () {
          test(
            'when passed an empty list for entryIds, '
            'should return an empty list of CardModels',
            () async {
              await dao.create(entryId: 2, position: 2);
              await dao.create(entryId: 3, position: 3);
              await dao.create(entryId: 1, position: 1);

              final cards = await dao.getAll(entryIds: {});
              expect(cards, <CardModel>[]);
            },
          );

          test(
            'when there are no cards in the db '
            'which has a matching id in entryIds, '
            'should return an empty list of CardModels',
            () async {
              await dao.create(entryId: 2, position: 2);
              await dao.create(entryId: 4, position: 3);
              await dao.create(entryId: 1, position: 1);

              final cards = await dao.getAll(entryIds: {5, 3});
              expect(cards, <CardModel>[]);
            },
          );

          test(
            'when there are multiple cards in the db '
            'which has matching ids in entryIds, '
            'should return the expected list of CardModels '
            'in order of PK',
            () async {
              final card1 = await dao.create(entryId: 1, position: 1);
              final card2 = await dao.create(entryId: 3, position: 1);
              final card3 = await dao.create(entryId: 3, position: 2);
              await dao.create(entryId: 2, position: 1);
              final card5 = await dao.create(entryId: 1, position: 2);

              final cards = await dao.getAll(entryIds: {3, 1});
              expect(cards, [card1, card5, card2, card3]);
            },
          );
        },
      );
    },
  );

  group(
    'CardsDaoImpl edit',
    () {
      test(
        'when passed legal newCard, '
        'should update expected record in cards table',
        () async {
          final card = await dao.create(entryId: 1, position: 1);

          await dao.edit(
            newCard: card.copyWith(starred: true, hidden: false),
          );

          expect(
            await selectAll(),
            [
              CardModel(
                entryId: 1,
                position: 1,
                starred: true,
                hidden: false,
              ),
            ],
          );

          await dao.edit(
            newCard: card.copyWith(starred: false, hidden: true),
          );

          expect(
            await selectAll(),
            [
              CardModel(
                entryId: 1,
                position: 1,
                starred: false,
                hidden: true,
              ),
            ],
          );
        },
      );

      test(
        'when no cards in the db has the same PK as the passed newCard\'s PK, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.edit(
                newCard: CardModel(
                  entryId: 5,
                  position: 6,
                  starred: true,
                  hidden: true,
                ),
              );
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'CardsDaoImpl remove',
    () {
      test(
        'when passed legal arguments, '
        'should delete expected record in cards table',
        () async {
          await dao.create(entryId: 1, position: 2);
          await dao.create(entryId: 2, position: 1);
          await dao.remove(entryId: 1, position: 2);

          expect(
            await selectAll(),
            [
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
        'when no cards in the db has the same PK as the passed PK arguments, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.remove(entryId: 1, position: 1);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'CardsDaoImpl removeAll',
    () {
      group(
        'when passed legal cardList, '
        'should delete expected records in cards table',
        () {
          late CardModel card1, card2, card3, card4;
          setUp(() async {
            card1 = await dao.create(entryId: 1, position: 1);
            card2 = await dao.create(entryId: 2, position: 1);
            card3 = await dao.create(entryId: 1, position: 2);
            card4 = await dao.create(entryId: 2, position: 2);
          });

          test(
            'cardList is empty (should not delete any records)',
            () async {
              await dao.removeAll(cardList: []);

              expect(await selectAll(), [card1, card2, card3, card4]);
            },
          );

          test(
            'cardList has one item',
            () async {
              await dao.removeAll(cardList: [card3]);

              expect(await selectAll(), [card1, card2, card4]);
            },
          );

          test(
            'cardList has multiple items',
            () async {
              await dao.removeAll(cardList: [card4, card3, card2]);

              expect(await selectAll(), [card1]);
            },
          );
        },
      );

      group(
        'when no cards in the db '
        'has the same id as any card in passed cardList',
        () {
          test(
            'should throw ModelNotFoundException',
            () async {
              final card1 = await dao.create(entryId: 1, position: 1);
              final card2 = await dao.create(entryId: 2, position: 1);

              await dao.removeAll(cardList: [card1, card2]);
              expect(
                () async {
                  await dao.removeAll(cardList: [card2]);
                },
                throwsA(isA<ModelNotFoundException>()),
              );
            },
          );

          test(
            'should not delete any other records in the cards table',
            () async {
              final card1 = await dao.create(entryId: 1, position: 1);
              final card2 = await dao.create(entryId: 2, position: 1);

              await dao.removeAll(cardList: [card2]);
              try {
                await dao.removeAll(cardList: [card1, card2]);
                // ignore: empty_catches
              } on ModelNotFoundException {}

              expect(await selectAll(), [card1]);
            },
          );
        },
      );
    },
  );
}
