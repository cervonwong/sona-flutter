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

import 'package:sona_flutter/core/constants/icon_symbol_constants.dart';
import 'package:sona_flutter/core/constants/lookup_and_mapper_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/cards/cards_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/decks/decks_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/entries/entries_dao.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_entity_to_model_mapper.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_model_to_entity_mapper.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_repository_impl.dart';
import 'package:sona_flutter/core/domain/domain_exceptions.dart';
import 'package:sona_flutter/core/domain/entities/material/card/card.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck_icon_spec.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry.dart';
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';

class MockDeck extends Mock implements Deck {}

class MockDeckModel extends Mock implements DeckModel {}

class MockEntry extends Mock implements Entry {}

class MockEntryModel extends Mock implements EntryModel {}

class MockCard extends Mock implements Card {}

class MockCardId extends Mock implements CardId {}

class MockCardModel extends Mock implements CardModel {}

class MockDecksDaoImpl extends Mock implements DecksDao {}

class MockEntriesDaoImpl extends Mock implements EntriesDao {}

class MockCardsDaoImpl extends Mock implements CardsDao {}

class MockDeckModelToEntityMapper extends Mock
    implements DeckModelToEntityMapper {}

class MockDeckEntityToModelMapper extends Mock
    implements DeckEntityToModelMapper {}

void main() {
  late DecksDao decksDao;
  late EntriesDao entriesDao;
  late CardsDao cardsDao;
  late DeckRepository repository;
  late DeckModelToEntityMapper toEntity;
  late DeckEntityToModelMapper toModel;

  late Deck deck1;
  late DeckModel deckModel1;
  late Entry entry1;
  late EntryModel entryModel1;
  late Card card1;
  late CardId cardId1;
  late CardModel cardModel1;

  setUp(
    () {
      decksDao = MockDecksDaoImpl();
      entriesDao = MockEntriesDaoImpl();
      cardsDao = MockCardsDaoImpl();
      toEntity = MockDeckModelToEntityMapper();
      toModel = MockDeckEntityToModelMapper();

      repository = DeckRepositoryImpl(
        decksDao: decksDao,
        entriesDao: entriesDao,
        cardsDao: cardsDao,
        toEntity: toEntity,
        toModel: toModel,
      );

      deck1 = MockDeck();
      deckModel1 = MockDeckModel();
      when(() => toEntity(model: deckModel1)).thenReturn(deck1);
      when(() => toModel(entity: deck1)).thenReturn(deckModel1);

      entry1 = MockEntry();
      entryModel1 = MockEntryModel();

      card1 = MockCard();
      cardId1 = MockCardId();
      cardModel1 = MockCardModel();
      when(() => card1.id).thenReturn(cardId1);
    },
  );

  group(
    'DeckRepositoryImpl create',
    () {
      test(
        'when passed legal arguments, '
        'should return expected Deck',
        () async {
          when(() => toModel.mapToIconColorId(color: DeckIconColor.blue))
              .thenReturn(LookupAndMapperConstants.iconColorBlueId);
          when(() => toModel.mapToIconSymbolId(symbol: DeckIconSymbol.flask))
              .thenReturn(IconSymbolConstants.flaskId);

          when(() => decksDao.create(
                name: 'Joseph',
                authorName: null,
                description: 'This is a string.',
                iconSymbolId: IconSymbolConstants.flaskId,
                iconColorId: LookupAndMapperConstants.iconColorBlueId,
              )).thenAnswer((_) async => deckModel1);

          final deck = await repository.create(
            name: 'Joseph',
            authorName: null,
            description: 'This is a string.',
            iconSpec: DeckIconSpec(
              color: DeckIconColor.blue,
              symbol: DeckIconSymbol.flask,
            ),
          );
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
          when(() => decksDao.getById(id: 5))
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.getById(id: 5);
          expect(deck, deck1);
        },
      );

      test(
        'when DecksDao.getById returns null, '
        'should return null',
        () async {
          when(() => decksDao.getById(id: 5)).thenAnswer((_) async => null);

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
          when(() => decksDao.getByName(name: 'Peter'))
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.getByName(name: 'Peter');
          expect(deck, deck1);
        },
      );

      test(
        'when DecksDao.getByName returns null, '
        'should return null',
        () async {
          when(() => decksDao.getByName(name: 'Peter'))
              .thenAnswer((_) async => null);

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
          when(() => decksDao.getAll()).thenAnswer((_) async => <DeckModel>[]);

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

          when(() => toEntity(model: deckModel2)).thenReturn(deck2);
          when(() => toEntity(model: deckModel3)).thenReturn(deck3);

          when(() => decksDao.getAll())
              .thenAnswer((_) async => [deckModel1, deckModel2, deckModel3]);

          final decks = await repository.getAll();
          expect(decks, [deck1, deck2, deck3]);
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getByEntry',
    () {
      test(
        'when EntriesDao.getSingle and DecksDao.getById '
        'return expected data classes, '
        'should return expected Deck which the passed Entry belongs to',
        () async {
          when(() => entry1.id).thenReturn(69);
          when(() => entryModel1.deckId).thenReturn(88);
          when(() => entriesDao.getSingle(id: 69))
              .thenAnswer((_) async => entryModel1);
          when(() => decksDao.getById(id: 88))
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.getByEntry(entry: entry1);
          expect(deck, deck1);
        },
      );

      test(
        'when EntriesDao.getSingle returns null (entry not found), '
        'should throw EntityNotFoundException',
        () async {
          when(() => entry1.id).thenReturn(69);
          when(() => entriesDao.getSingle(id: 69))
              .thenAnswer((_) async => null);

          expect(
            () async {
              await repository.getByEntry(entry: entry1);
            },
            throwsA(isA<EntityNotFoundException>()),
          );
        },
      );

      test(
        'when DecksDao.getById returns null (deck not found), '
        'should throw EntityNavigationException',
        () async {
          when(() => entry1.id).thenReturn(69);
          when(() => entryModel1.deckId).thenReturn(88);
          when(() => entriesDao.getSingle(id: 69))
              .thenAnswer((_) async => entryModel1);
          when(() => decksDao.getById(id: 88)).thenAnswer((_) async => null);

          expect(
            () async {
              await repository.getByEntry(entry: entry1);
            },
            throwsA(isA<EntityNavigationException>()),
          );
        },
      );
    },
  );

  group(
    'DeckRepositoryImpl getByCard',
    () {
      test(
        'when CardsDao.getSingle, EntriesDao.getSingle and DecksDao.getById '
        'return expected data classes, '
        'should return expected Deck which the passed Card belongs to',
        () async {
          when(() => cardId1.entryId).thenReturn(100);
          when(() => cardId1.position).thenReturn(234);
          when(() => cardsDao.getSingle(entryId: 100, position: 234))
              .thenAnswer((_) async => cardModel1);
          when(() => cardModel1.entryId).thenReturn(111);
          when(() => entriesDao.getSingle(id: 111))
              .thenAnswer((_) async => entryModel1);
          when(() => entryModel1.deckId).thenReturn(69);
          when(() => decksDao.getById(id: 69))
              .thenAnswer((_) async => deckModel1);

          final deck = await repository.getByCard(card: card1);
          expect(deck, deck1);
        },
      );

      test(
        'when CardsDao.getSingle returns null (card not found), '
        'should throw EntityNotFoundException',
        () async {
          when(() => cardId1.entryId).thenReturn(100);
          when(() => cardId1.position).thenReturn(234);
          when(() => cardsDao.getSingle(entryId: 100, position: 234))
              .thenAnswer((_) async => null);

          expect(
            () async {
              await repository.getByCard(card: card1);
            },
            throwsA(isA<EntityNotFoundException>()),
          );
        },
      );

      test(
        'when EntriesDao.getSingle returns null (entry not found), '
        'should throw EntityNavigationException',
        () async {
          when(() => cardId1.entryId).thenReturn(100);
          when(() => cardId1.position).thenReturn(234);
          when(() => cardsDao.getSingle(entryId: 100, position: 234))
              .thenAnswer((_) async => cardModel1);
          when(() => cardModel1.entryId).thenReturn(111);
          when(() => entriesDao.getSingle(id: 111))
              .thenAnswer((_) async => null);

          expect(
            () async {
              await repository.getByCard(card: card1);
            },
            throwsA(isA<EntityNavigationException>()),
          );
        },
      );

      test(
        'when DecksDao.getById returns null (deck not found), '
        'should throw EntityNavigationException',
        () async {
          when(() => cardId1.entryId).thenReturn(100);
          when(() => cardId1.position).thenReturn(234);
          when(() => cardsDao.getSingle(entryId: 100, position: 234))
              .thenAnswer((_) async => cardModel1);
          when(() => cardModel1.entryId).thenReturn(111);
          when(() => entriesDao.getSingle(id: 111))
              .thenAnswer((_) async => entryModel1);
          when(() => entryModel1.deckId).thenReturn(69);
          when(() => decksDao.getById(id: 69)).thenAnswer((_) async => null);

          expect(
            () async {
              await repository.getByCard(card: card1);
            },
            throwsA(isA<EntityNavigationException>()),
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
          when(() => decksDao.edit(newDeck: deckModel1))
              .thenAnswer((_) async => deckModel1);

          await repository.update(deck: deck1);
          // verify is only used for testing void and stubbed methods.
          verify(() => decksDao.edit(newDeck: deckModel1));
        },
      );
    },
  );

  group(
    'DeckRepository delete',
    () {
      test(
        'when passed legal arguments, '
        'should call '
        'DecksDao.remove, EntriesDao.removeAll, and CardsDao.removeAll '
        'with expected arguments',
        () async {
          final entryModel2 = MockEntryModel();
          final cardModel2 = MockCardModel();
          final cardModel3 = MockCardModel();
          final cardModel4 = MockCardModel();

          when(() => deck1.id).thenReturn(123);

          when(() => entryModel1.id).thenReturn(10001);
          when(() => entryModel2.id).thenReturn(10002);
          when(() => entriesDao.getAll(deckId: 123))
              .thenAnswer((_) async => [entryModel1, entryModel2]);

          when(() => cardsDao.getAll(entryIds: {10001, 10002})).thenAnswer(
              (_) async => [cardModel1, cardModel2, cardModel3, cardModel4]);

          when(() => decksDao.remove(id: 123)).thenAnswer((_) async {});
          when(() => entriesDao.removeAll(
                entryList: [entryModel1, entryModel2],
              )).thenAnswer((_) async {});
          when(() => cardsDao.removeAll(
                cardList: [cardModel1, cardModel2, cardModel3, cardModel4],
              )).thenAnswer((_) async {});

          await repository.delete(deck: deck1);
          // verify is only used for testing void and stubbed methods.
          verify(() => decksDao.remove(id: 123));
          verify(() =>
              entriesDao.removeAll(entryList: [entryModel1, entryModel2]));
          verify(() => cardsDao.removeAll(
              cardList: [cardModel1, cardModel2, cardModel3, cardModel4]));
        },
      );
    },
  );
}
