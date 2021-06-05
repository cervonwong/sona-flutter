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
import 'package:mocktail/mocktail.dart';
import 'package:moor/ffi.dart';

import 'package:sona_flutter/core/constants/model_default_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/decks/decks_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/utils/system_time.dart';

class MockSystemTime extends Mock implements SystemTime {}

// This is an integration test with MoorDatabase.
void main() {
  late DecksDao dao;
  late SystemTime systemTime;
  late MoorDatabase db;

  setUp(() {
    db = MoorDatabase.custom(VmDatabase.memory(
      // Change the logStatement argument to true to print each SQL query for
      // debugging if needed. This is set to false to not pollute test logs.
      logStatements: false,
    ));
    systemTime = MockSystemTime();
    when(() => systemTime.now()).thenReturn(DateTime(2020));
    dao = DecksDaoImpl(db: db, systemTime: systemTime);
  });

  tearDown(() async {
    await db.close();
  });

  Future<List<DeckModel>> selectAll() async {
    return db.select(db.decks).get();
  }

  group(
    'DecksDaoImpl create',
    () {
      group(
        'when passed legal name (called twice to create two decks)',
        () {
          late DeckModel deck1, deck2;
          setUp(() async {
            deck1 = await dao.create(name: 'Leo');
            deck2 = await dao.create(name: 'Libra');
          });

          test(
            'should create expected records in decks table',
            () async {
              expect(
                await selectAll(),
                [
                  DeckModel(
                    id: 1,
                    name: 'Leo',
                    created: DateTime(2020),
                    lastEdited: DateTime(2020),
                    authorName: ModelDefaultConstants.deckAuthorName,
                    description: ModelDefaultConstants.deckDescription,
                  ),
                  DeckModel(
                    id: 2,
                    name: 'Libra',
                    created: DateTime(2020),
                    lastEdited: DateTime(2020),
                    authorName: ModelDefaultConstants.deckAuthorName,
                    description: ModelDefaultConstants.deckDescription,
                  ),
                ],
              );
            },
          );

          test(
            'should return expected DeckModels',
            () {
              expect(
                deck1,
                DeckModel(
                  id: 1,
                  name: 'Leo',
                  created: DateTime(2020),
                  lastEdited: DateTime(2020),
                  authorName: ModelDefaultConstants.deckAuthorName,
                  description: ModelDefaultConstants.deckDescription,
                ),
              );

              expect(
                deck2,
                DeckModel(
                  id: 2,
                  name: 'Libra',
                  created: DateTime(2020),
                  lastEdited: DateTime(2020),
                  authorName: ModelDefaultConstants.deckAuthorName,
                  description: ModelDefaultConstants.deckDescription,
                ),
              );
            },
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
              authorName: ModelDefaultConstants.deckAuthorName,
              description: ModelDefaultConstants.deckDescription,
            ),
          );
        },
      );

      test(
        'when no decks in the db has the same id as the passed id, '
        'should return null',
        () async {
          final deck = await dao.getById(id: -1);
          expect(deck, isNull);
        },
      );
    },
  );

  group(
    'DecksDaoImpl getByName',
    () {
      test(
        'when passed legal name, '
        'should return expected DeckModel',
        () async {
          await dao.create(name: 'Cancer');

          final deck = await dao.getByName(name: 'Cancer');
          expect(
            deck,
            DeckModel(
              id: 1,
              name: 'Cancer',
              created: DateTime(2020),
              lastEdited: DateTime(2020),
              authorName: ModelDefaultConstants.deckAuthorName,
              description: ModelDefaultConstants.deckDescription,
            ),
          );
        },
      );

      test(
        'when no decks in the db has the same name as the passed name, '
        'should return null',
        () async {
          final deck = await dao.getByName(name: 'Does not exist');
          expect(deck, isNull);
        },
      );
    },
  );

  group(
    'DecksDaoImpl getAll',
    () {
      test(
        'when there are no decks in the db, '
        'should return an empty list',
        () async {
          final decks = await dao.getAll();

          expect(decks, <DeckModel>[]);
        },
      );

      test(
        'when there are multiple decks in the db, '
        'should return the expected DeckModels '
        'with the most recently created at the start of the list',
        () async {
          when(() => systemTime.now()).thenReturn(DateTime(1999));
          await dao.create(name: 'Aries');

          when(() => systemTime.now()).thenReturn(DateTime(2000));
          await dao.create(name: 'Taurus');

          when(() => systemTime.now()).thenReturn(DateTime(2001));
          await dao.create(name: 'Gemini');

          final decks = await dao.getAll();
          expect(
            decks,
            [
              DeckModel(
                id: 3,
                name: 'Gemini',
                created: DateTime(2001),
                lastEdited: DateTime(2001),
                authorName: ModelDefaultConstants.deckAuthorName,
                description: ModelDefaultConstants.deckDescription,
              ),
              DeckModel(
                id: 2,
                name: 'Taurus',
                created: DateTime(2000),
                lastEdited: DateTime(2000),
                authorName: ModelDefaultConstants.deckAuthorName,
                description: ModelDefaultConstants.deckDescription,
              ),
              DeckModel(
                id: 1,
                name: 'Aries',
                created: DateTime(1999),
                lastEdited: DateTime(1999),
                authorName: ModelDefaultConstants.deckAuthorName,
                description: ModelDefaultConstants.deckDescription,
              ),
            ],
          );
        },
      );
    },
  );

  group(
    'DecksDaoImpl edit',
    () {
      group(
        'when passed legal newDeck, '
        'should update changed fields',
        () {
          group(
            'when authorName and description are unchanged',
            () {
              late DeckModel editedDeck;
              setUp(() async {
                when(() => systemTime.now()).thenReturn(DateTime(1990));
                final deck = await dao.create(name: 'Capricorn');

                when(() => systemTime.now()).thenReturn(DateTime(2000));
                editedDeck = await dao.edit(
                  newDeck: deck.copyWith(name: 'Aquarius'),
                );
              });

              test(
                'should update expected record in decks table',
                () async {
                  expect(
                    await selectAll(),
                    [
                      DeckModel(
                        id: 1,
                        name: 'Aquarius',
                        created: DateTime(1990),
                        lastEdited: DateTime(2000),
                        authorName: ModelDefaultConstants.deckAuthorName,
                        description: ModelDefaultConstants.deckDescription,
                      ),
                    ],
                  );
                },
              );

              test(
                'should return edited DeckModel',
                () {
                  expect(
                    editedDeck,
                    DeckModel(
                      id: 1,
                      name: 'Aquarius',
                      created: DateTime(1990),
                      lastEdited: DateTime(2000),
                      authorName: ModelDefaultConstants.deckAuthorName,
                      description: ModelDefaultConstants.deckDescription,
                    ),
                  );
                },
              );
            },
          );

          group(
            'when authorName and description are changed',
            () {
              late DeckModel editedDeck;
              setUp(() async {
                when(() => systemTime.now()).thenReturn(DateTime(1990));
                final deck = await dao.create(name: 'Capricorn');

                when(() => systemTime.now()).thenReturn(DateTime(2000));
                editedDeck = await dao.edit(
                  newDeck: deck.copyWith(
                    name: 'Aquarius',
                    authorName: 'Me',
                    description: 'This is a string.',
                  ),
                );
              });

              test(
                'should update expected record in decks table',
                () async {
                  expect(await selectAll(), [
                    DeckModel(
                      id: 1,
                      name: 'Aquarius',
                      created: DateTime(1990),
                      lastEdited: DateTime(2000),
                      authorName: 'Me',
                      description: 'This is a string.',
                    ),
                  ]);
                },
              );

              test(
                'should return edited DeckModel',
                () {
                  expect(
                    editedDeck,
                    DeckModel(
                      id: 1,
                      name: 'Aquarius',
                      created: DateTime(1990),
                      lastEdited: DateTime(2000),
                      authorName: 'Me',
                      description: 'This is a string.',
                    ),
                  );
                },
              );
            },
          );

          group(
            'when created or lastEdited are changed',
            () {
              late DeckModel editedDeck;
              setUp(() async {
                when(() => systemTime.now()).thenReturn(DateTime(1990));
                final deck = await dao.create(name: 'Capricorn');

                when(() => systemTime.now()).thenReturn(DateTime(2000));
                editedDeck = await dao.edit(
                  newDeck: deck.copyWith(
                    name: 'Aquarius',
                    created: DateTime(2020),
                    lastEdited: DateTime(2030),
                  ),
                );
              });

              test(
                'should update expected record in decks table',
                () async {
                  expect(
                    await selectAll(),
                    [
                      DeckModel(
                        id: 1,
                        name: 'Aquarius',
                        created: DateTime(1990),
                        lastEdited: DateTime(2000),
                        authorName: ModelDefaultConstants.deckAuthorName,
                        description: ModelDefaultConstants.deckDescription,
                      ),
                    ],
                  );
                },
              );

              test(
                'should return edited DeckModel',
                () {
                  expect(
                    editedDeck,
                    DeckModel(
                      id: 1,
                      name: 'Aquarius',
                      created: DateTime(1990),
                      lastEdited: DateTime(2000),
                      authorName: ModelDefaultConstants.deckAuthorName,
                      description: ModelDefaultConstants.deckDescription,
                    ),
                  );
                },
              );
            },
          );

          group(
            'when name is unchanged',
            () {
              late DeckModel editedDeck;
              setUp(() async {
                when(() => systemTime.now()).thenReturn(DateTime(1990));
                final deck = await dao.create(name: 'Capricorn');

                when(() => systemTime.now()).thenReturn(DateTime(2000));
                editedDeck = await dao.edit(
                  newDeck: deck.copyWith(
                    authorName: 'You',
                  ),
                );
              });

              test(
                'should update expected records in decks table',
                () async {
                  expect(
                    await selectAll(),
                    [
                      DeckModel(
                        id: 1,
                        name: 'Capricorn',
                        created: DateTime(1990),
                        lastEdited: DateTime(2000),
                        authorName: 'You',
                        description: ModelDefaultConstants.deckDescription,
                      ),
                    ],
                  );
                },
              );

              test(
                'should return edited DeckModel',
                () {
                  expect(
                    editedDeck,
                    DeckModel(
                      id: 1,
                      name: 'Capricorn',
                      created: DateTime(1990),
                      lastEdited: DateTime(2000),
                      authorName: 'You',
                      description: ModelDefaultConstants.deckDescription,
                    ),
                  );
                },
              );
            },
          );
        },
      );

      test(
        'when no decks in the db has the same ID as the passed newDeck\'s id, '
        'should fail asserts',
        () async {
          expect(
            () async {
              await dao.edit(
                newDeck: DeckModel(
                  id: 1,
                  name: 'Aquarius',
                  created: DateTime(1990),
                  lastEdited: DateTime(2000),
                  authorName: 'Me',
                  description: 'This is a string.',
                ),
              );
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when another deck in the db has the same name '
        'as the passed newDeck\'s name, '
        'should fail asserts',
        () async {
          await dao.create(name: 'Scorpio');
          await dao.create(name: 'Pisces');

          expect(
            () async {
              await dao.edit(
                newDeck: DeckModel(
                  id: 1,
                  name: 'Pisces',
                  created: DateTime(1990),
                  lastEdited: DateTime(2000),
                  authorName: 'Me',
                  description: 'This is a string.',
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
    'DecksDaoImpl remove',
    () {
      test(
        'when passed legal id, '
        'should delete expected record in decks table',
        () async {
          await dao.create(name: 'Apple');
          await dao.create(name: 'Banana');
          await dao.remove(id: 1);

          expect(
            await selectAll(),
            [
              DeckModel(
                id: 2,
                name: 'Banana',
                created: DateTime(2020),
                lastEdited: DateTime(2020),
                authorName: ModelDefaultConstants.deckAuthorName,
                description: ModelDefaultConstants.deckDescription,
              ),
            ],
          );
        },
      );

      test(
        'when no decks in the db has the same ID as the passed id, '
        'should fail asserts',
        () async {
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
