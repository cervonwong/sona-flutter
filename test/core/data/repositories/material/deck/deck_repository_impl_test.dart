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
import 'package:sona_flutter/core/constants/material_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/decks/decks_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_repository_impl.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';

class MockDecksDaoImpl extends Mock implements DecksDao {}

void main() {
  DecksDao decksDao;
  DeckRepository repository;

  setUp(
    () {
      decksDao = MockDecksDaoImpl();
      repository = DeckRepositoryImpl(decksDao: decksDao);
    },
  );

  group(
    'DeckRepositoryImpl create',
    () {
      test(
        'when passed legal arguments, '
        'should return expected Deck',
        () async {
          when(decksDao.create(name: argThat(equals('Joseph'), named: 'name')))
              .thenAnswer(
            (_) async {
              return DeckModel(
                id: 1,
                name: 'Joseph',
                created: DateTime(2020),
                lastEdited: DateTime(2020),
                authorName: kDefaultDeckAuthorName,
                description: kDefaultDeckDescription,
              );
            },
          );

          final deck = await repository.create(name: 'Joseph');
          expect(
            deck,
            Deck(
              id: 1,
              name: 'Joseph',
              createdDateTime: DateTime(2020),
              lastEditedDateTime: DateTime(2020),
              authorName: kDefaultDeckAuthorName,
              description: kDefaultDeckDescription,
            ),
          );
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getById',
    () {
      test(
        'when passed legal arguments, '
        'should return expected Deck',
        () async {
          when(decksDao.getById(id: argThat(equals(5), named: 'id')))
              .thenAnswer(
            (_) async => DeckModel(
              id: 5,
              name: 'Adam',
              created: DateTime(1999),
              lastEdited: DateTime(1999),
              authorName: 'Eve',
              description: kDefaultDeckDescription,
            ),
          );

          final deck = await repository.getById(id: 5);
          expect(
            deck,
            Deck(
              id: 5,
              name: 'Adam',
              createdDateTime: DateTime(1999),
              lastEditedDateTime: DateTime(1999),
              authorName: 'Eve',
              description: kDefaultDeckDescription,
            ),
          );
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getAll',
    () {
      test(
        'when DecksDao.getAll returns an empty List of DeckModels, '
        'should return expected empty List of Decks',
        () async {
          when(decksDao.getAll()).thenAnswer(
            (_) async => <DeckModel>[],
          );

          final decks = await repository.getAll();
          expect(decks, <Deck>[]);
        },
      );

      test(
        'when DecksDao.getAll returns an List with three DeckModels, '
        'should return the mapped List with three Decks',
        () async {
          final baseModel = DeckModel(
            id: 1,
            name: 'Joseph',
            created: DateTime(2020),
            lastEdited: DateTime(2020),
            authorName: kDefaultDeckAuthorName,
            description: kDefaultDeckDescription,
          );

          when(decksDao.getAll()).thenAnswer(
            (_) async => [
              baseModel.copyWith(
                id: 2,
                name: 'Susan',
              ),
              baseModel.copyWith(
                id: 3,
                name: 'Susanne',
                lastEdited: DateTime(2021),
              ),
              baseModel.copyWith(
                id: 4,
                name: 'Susanson',
                description: 'Descriptive.',
              ),
            ],
          );

          final decks = await repository.getAll();
          expect(
            decks,
            [
              Deck(
                id: 2,
                name: 'Susan',
                createdDateTime: DateTime(2020),
                lastEditedDateTime: DateTime(2020),
                authorName: kDefaultDeckAuthorName,
                description: kDefaultDeckDescription,
              ),
              Deck(
                id: 3,
                name: 'Susanne',
                createdDateTime: DateTime(2020),
                lastEditedDateTime: DateTime(2021),
                authorName: kDefaultDeckAuthorName,
                description: kDefaultDeckDescription,
              ),
              Deck(
                id: 4,
                name: 'Susanson',
                createdDateTime: DateTime(2020),
                lastEditedDateTime: DateTime(2020),
                authorName: kDefaultDeckAuthorName,
                description: 'Descriptive.',
              ),
            ],
          );
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl update',
    () {
      test(
        'when passed legal arguments, '
        'should call DecksDao.edit with expected arguments',
        () async {
          final model = DeckModel(
            id: 60,
            name: 'Brandon',
            created: DateTime(1990),
            lastEdited: DateTime(1990),
            authorName: kDefaultDeckAuthorName,
            description: kDefaultDeckDescription,
          );

          when(decksDao.edit(
            newDeck: argThat(equals(model), named: 'newDeck'),
          )).thenAnswer((_) async => model);

          await repository.update(
            deck: Deck(
              id: 60,
              name: 'Brandon',
              createdDateTime: DateTime(1990),
              lastEditedDateTime: DateTime(1990),
              authorName: kDefaultDeckAuthorName,
              description: kDefaultDeckDescription,
            ),
          );
          // verify is only used for testing void and stubbed methosd.
          verify(decksDao.edit(newDeck: model));
        },
      );
    },
  );

  group(
    'DeckRepository delete',
    () {
      test(
        'when passed legal arguments, '
        'should call DecksDao.remove with expected arguments',
        () async {
          final model = DeckModel(
            id: 123,
            name: 'Julien',
            created: DateTime(2000),
            lastEdited: DateTime(2010),
            authorName: 'Julie',
            description: 'Same old bitter things...',
          );

          when(
            decksDao.remove(id: argThat(equals(123), named: 'id')),
          ).thenAnswer(
            (_) async => model,
          );

          await repository.delete(
            deck: Deck(
              id: 123,
              name: 'Julien',
              createdDateTime: DateTime(2000),
              lastEditedDateTime: DateTime(2010),
              authorName: 'Julie',
              description: 'Same old bitter things...',
            ),
          );
          // verify is only used for testing void and stubbed methods.
          verify(decksDao.remove(id: 123));
        },
      );
    },
  );
}
