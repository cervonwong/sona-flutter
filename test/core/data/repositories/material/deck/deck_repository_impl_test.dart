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
import 'package:sona_flutter/core/data/data_sources/moor/decks/decks_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_entity_to_model_mapper.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_model_to_entity_mapper.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_repository_impl.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';

// ignore: must_be_immutable
class MockDeck extends Mock implements Deck {}

class MockDeckModel extends Mock implements DeckModel {}

class MockDecksDaoImpl extends Mock implements DecksDao {}

class MockDeckModelToEntityMapper extends Mock
    implements DeckModelToEntityMapper {}

class MockDeckEntityToModelMapper extends Mock
    implements DeckEntityToModelMapper {}

void main() {
  DecksDao decksDao;
  DeckRepository repository;
  DeckModelToEntityMapper toEntity;
  DeckEntityToModelMapper toModel;

  Deck deck1;
  DeckModel deckModel1;

  setUp(
    () {
      decksDao = MockDecksDaoImpl();
      toEntity = MockDeckModelToEntityMapper();
      toModel = MockDeckEntityToModelMapper();

      repository = DeckRepositoryImpl(
        decksDao: decksDao,
        toEntity: toEntity,
        toModel: toModel,
      );

      deck1 = MockDeck();
      deckModel1 = MockDeckModel();

      when(toEntity(model: argThat(equals(deckModel1), named: 'model')))
          .thenReturn(deck1);
      when(toModel(deck: argThat(equals(deck1), named: 'deck')))
          .thenReturn(deckModel1);
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
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.create(name: 'Joseph');
          expect(deck, deck1);
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getById',
    () {
      test(
        'when DecksDao.getById returns a DeckModel, '
        'should return expected Deck',
        () async {
          when(decksDao.getById(id: argThat(equals(5), named: 'id')))
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.getById(id: 5);
          expect(deck, deck1);
        },
      );

      test(
        'when DecksDao.getById returns null, '
        'should return null',
        () async {
          when(decksDao.getById(id: argThat(equals(5), named: 'id')))
              .thenAnswer((_) async => null);
          when(toEntity(model: argThat(isNull, named: 'model')))
              .thenReturn(null);

          final deck = await repository.getById(id: 5);
          expect(deck, isNull);
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getByName',
    () {
      test(
        'when DecksDao.getByName returns a DeckModel, '
        'should return expected Deck',
        () async {
          when(decksDao.getByName(
            name: argThat(equals('Peter'), named: 'name'),
          )).thenAnswer((_) async => deckModel1);

          final deck = await repository.getByName(name: 'Peter');
          expect(deck, deck1);
        },
      );

      test(
        'when DecksDao.getByName returns null, '
        'should return null',
        () async {
          when(decksDao.getByName(
            name: argThat(equals('Peter'), named: 'name'),
          )).thenAnswer((_) async => null);
          when(toEntity(model: argThat(isNull, named: 'model')))
              .thenReturn(null);

          final deck = await repository.getByName(name: 'Peter');
          expect(deck, isNull);
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
          final deck2 = MockDeck(), deck3 = MockDeck();
          final deckModel2 = MockDeckModel(), deckModel3 = MockDeckModel();

          when(toEntity(model: argThat(equals(deckModel2), named: 'model')))
              .thenReturn(deck2);
          when(toEntity(model: argThat(equals(deckModel3), named: 'model')))
              .thenReturn(deck3);

          when(decksDao.getAll()).thenAnswer(
            (_) async => [deckModel1, deckModel2, deckModel3],
          );

          final decks = await repository.getAll();
          expect(decks, [deck1, deck2, deck3]);
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
          when(decksDao.edit(
            newDeck: argThat(equals(deckModel1), named: 'newDeck'),
          )).thenAnswer((_) async => deckModel1);

          await repository.update(deck: deck1);
          // verify is only used for testing void and stubbed methods.
          verify(decksDao.edit(newDeck: deckModel1));
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
          when(deck1.id).thenReturn(123);
          when(
            decksDao.remove(id: argThat(equals(123), named: 'id')),
          ).thenAnswer((_) async => deckModel1);

          await repository.delete(deck: deck1);
          // verify is only used for testing void and stubbed methods.
          verify(decksDao.remove(id: 123));
        },
      );
    },
  );
}
