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

import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/create_deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/delete_deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/get_all_decks.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/validate_deck_name.dart';
import 'package:sona_flutter/features/deck/presentation/bloc/deck_list_bloc.dart';

class MockCreateDeck extends Mock implements CreateDeck {}

class MockGetAllDecks extends Mock implements GetAllDecks {}

class MockDeleteDeck extends Mock implements DeleteDeck {}

class MockValidateDeckName extends Mock implements ValidateDeckName {}

class MockDeck extends Mock implements Deck {}

void main() {
  late CreateDeck createDeck;
  late GetAllDecks getAllDecks;
  late DeleteDeck deleteDeck;
  late ValidateDeckName validateDeckName;

  late Deck deck1, deck2, deck3;

  late DeckListBloc bloc;

  setUp(() {
    createDeck = MockCreateDeck();
    getAllDecks = MockGetAllDecks();
    deleteDeck = MockDeleteDeck();
    validateDeckName = MockValidateDeckName();
    deck1 = MockDeck();
    deck2 = MockDeck();
    deck3 = MockDeck();
    bloc = DeckListBloc(
      createDeck: createDeck,
      getAllDecks: getAllDecks,
      deleteDeck: deleteDeck,
      validateDeckName: validateDeckName,
    );
  });

  test(
    'DeckListBloc when created, '
    'should have initial state DeckInitial',
    () {
      final state = bloc.state;

      expect(state, DeckListInitial());
    },
  );

  test(
    'DeckListBloc when added DeckInitialized, '
    'should emit expected state with list of decks',
    () async {
      when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2, deck3]);

      bloc.add(DeckListInitialized());

      await expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DeckListLoading(),
            DeckListLoaded(decks: [deck1, deck2, deck3]),
          ],
        ),
      );

      verify(() => getAllDecks()).called(1);
    },
  );

  group(
    'DeckListBloc when added DeckInitialized then DeckCreated',
    () {
      test(
        'and when ValidateDeckName when called returns '
        'DeckNameValidationResult.valid, '
        'should emit expected state with list of decks with created deck',
        () async {
          when(() => validateDeckName(name: 'Valid'))
              .thenAnswer((_) async => DeckNameValidationResult.valid);

          when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2]);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(decks: [deck1, deck2]),
              ],
            ),
          );

          when(() => createDeck(name: 'Valid')).thenAnswer(
            (_) async => deck3,
          );
          when(() => getAllDecks())
              .thenAnswer((_) async => [deck1, deck2, deck3]);

          bloc.add(const DeckCreated(name: 'Valid'));
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(decks: [deck1, deck2, deck3]),
              ],
            ),
          );

          verifyInOrder(
            [
              () => getAllDecks(),
              () => validateDeckName(name: 'Valid'),
              () => createDeck(name: 'Valid'),
              () => getAllDecks(),
            ],
          );
          verifyNoMoreInteractions(createDeck);
          verifyNoMoreInteractions(validateDeckName);
          verifyNoMoreInteractions(getAllDecks);
        },
      );

      test(
        'and when ValidateDeckName when called returns '
        'DeckNameValidationResult.nameIsEmpty, '
        'should emit DeckNameIsEmpty',
        () async {
          when(() => validateDeckName(name: ''))
              .thenAnswer((_) async => DeckNameValidationResult.nameIsEmpty);

          when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2]);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(decks: [deck1, deck2]),
              ],
            ),
          );

          bloc.add(const DeckCreated(name: ''));
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckNameIsEmpty(),
              ],
            ),
          );

          verifyInOrder(
            [
              () => getAllDecks(),
              () => validateDeckName(name: ''),
            ],
          );
          verifyNoMoreInteractions(createDeck);
          verifyNoMoreInteractions(validateDeckName);
        },
      );

      test(
        'and when ValidateDeckName when called returns '
        'DeckNameValidationResult.nameAlreadyExists, '
        'should emit DeckNameAlreadyExists',
        () async {
          when(() => validateDeckName(name: 'Duplicate')).thenAnswer(
            (_) async => DeckNameValidationResult.nameAlreadyExists,
          );

          when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2]);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(decks: [deck1, deck2]),
              ],
            ),
          );

          bloc.add(const DeckCreated(name: 'Duplicate'));
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckNameAlreadyExists(),
              ],
            ),
          );

          verifyInOrder(
            [
              () => getAllDecks(),
              () => validateDeckName(name: 'Duplicate'),
            ],
          );
          verifyNoMoreInteractions(createDeck);
          verifyNoMoreInteractions(validateDeckName);
        },
      );

      test(
        'and when ValidateDeckName when called returns '
        'DeckNameValidationResult.nameIsMultiline, '
        'should emit DeckNameIsMultiline',
        () async {
          when(() => validateDeckName(name: 'Hey\nHo')).thenAnswer(
            (_) async => DeckNameValidationResult.nameIsMultiline,
          );

          when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2]);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(decks: [deck1, deck2]),
              ],
            ),
          );

          bloc.add(const DeckCreated(name: 'Hey\nHo'));
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckNameIsMultiline(),
              ],
            ),
          );

          verifyInOrder(
            [
              () => getAllDecks(),
              () => validateDeckName(name: 'Hey\nHo'),
            ],
          );
          verifyNoMoreInteractions(createDeck);
          verifyNoMoreInteractions(validateDeckName);
        },
      );
    },
  );

  test(
    'DeckBloc when added DeckInitialized then DeckDeleted, '
    'should emit expected state with list of decks with deleted deck',
    () async {
      when(() => getAllDecks()).thenAnswer((_) async => [deck1, deck2, deck3]);
      when(() => deleteDeck(deck: deck2)).thenAnswer(
        (_) async {},
      );

      bloc..add(DeckListInitialized())..add(DeckDeleted(deck: deck2));

      await expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DeckListLoading(),
            DeckListLoaded(decks: [deck1, deck2, deck3]),
            DeckListLoading(),
            DeckListLoaded(decks: [deck1, deck3]),
          ],
        ),
      );

      verifyInOrder(
        [
          () => getAllDecks(),
          () => deleteDeck(deck: deck2),
        ],
      );
      verifyNoMoreInteractions(getAllDecks);
      verifyNoMoreInteractions(deleteDeck);
    },
  );
}
