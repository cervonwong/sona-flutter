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
import 'package:sona_flutter/features/deck/domain/use_cases/get_deck_list.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/validate_deck_name.dart';
import 'package:sona_flutter/features/deck/presentation/bloc/deck_list_bloc.dart';
import 'package:sona_flutter/features/deck/presentation/bloc/to_deck_list_view_model_mapper.dart';
import 'package:sona_flutter/features/deck/presentation/view_models/deck_list_view_model.dart';

class MockCreateDeck extends Mock implements CreateDeck {}

class MockGetDeckList extends Mock implements GetDeckList {}

class MockDeleteDeck extends Mock implements DeleteDeck {}

class MockValidateDeckName extends Mock implements ValidateDeckName {}

class MockToDeckListViewModelMapper extends Mock
    implements ToDeckListViewModelMapper {}

class MockDeck extends Mock implements Deck {}

class MockDeckListViewModel extends Mock implements DeckListViewModel {}

void main() {
  late CreateDeck createDeck;
  late GetDeckList getDeckList;
  late DeleteDeck deleteDeck;
  late ValidateDeckName validateDeckName;
  late ToDeckListViewModelMapper toDeckListViewModel;

  late Deck deck1, deck2, deck3;
  late DeckListViewModel deckListViewModel1, deckListViewModel2;

  late DeckListBloc bloc;

  setUp(() {
    createDeck = MockCreateDeck();
    getDeckList = MockGetDeckList();
    deleteDeck = MockDeleteDeck();
    validateDeckName = MockValidateDeckName();
    toDeckListViewModel = MockToDeckListViewModelMapper();
    deck1 = MockDeck();
    deck2 = MockDeck();
    deck3 = MockDeck();
    deckListViewModel1 = MockDeckListViewModel();
    deckListViewModel2 = MockDeckListViewModel();
    bloc = DeckListBloc(
      createDeck: createDeck,
      getDeckList: getDeckList,
      deleteDeck: deleteDeck,
      validateDeckName: validateDeckName,
      toDeckListViewModel: toDeckListViewModel,
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
      when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2, deck3]);
      when(() => toDeckListViewModel(decks: [deck1, deck2, deck3]))
          .thenReturn(deckListViewModel1);

      bloc.add(DeckListInitialized());

      await expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DeckListLoading(),
            DeckListLoaded(deckListViewModel: deckListViewModel1),
          ],
        ),
      );

      verify(() => getDeckList()).called(1);
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

          when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2]);
          when(() => toDeckListViewModel(decks: [deck1, deck2]))
              .thenReturn(deckListViewModel1);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(deckListViewModel: deckListViewModel1),
              ],
            ),
          );

          when(() => createDeck(name: 'Valid')).thenAnswer(
            (_) async => deck3,
          );
          when(() => getDeckList())
              .thenAnswer((_) async => [deck1, deck2, deck3]);
          when(() => toDeckListViewModel(decks: [deck1, deck2, deck3]))
              .thenReturn(deckListViewModel2);

          bloc.add(const DeckCreated(name: 'Valid'));
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(deckListViewModel: deckListViewModel2),
              ],
            ),
          );

          verifyInOrder(
            [
              () => getDeckList(),
              () => validateDeckName(name: 'Valid'),
              () => createDeck(name: 'Valid'),
              () => getDeckList(),
            ],
          );
          verifyNoMoreInteractions(createDeck);
          verifyNoMoreInteractions(validateDeckName);
          verifyNoMoreInteractions(getDeckList);
        },
      );

      test(
        'and when ValidateDeckName when called returns '
        'DeckNameValidationResult.nameIsEmpty, '
        'should emit DeckNameIsEmpty',
        () async {
          when(() => validateDeckName(name: ''))
              .thenAnswer((_) async => DeckNameValidationResult.nameIsEmpty);

          when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2]);
          when(() => toDeckListViewModel(decks: [deck1, deck2]))
              .thenReturn(deckListViewModel1);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(deckListViewModel: deckListViewModel1),
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
              () => getDeckList(),
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

          when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2]);
          when(() => toDeckListViewModel(decks: [deck1, deck2]))
              .thenReturn(deckListViewModel1);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(deckListViewModel: deckListViewModel1),
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
              () => getDeckList(),
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

          when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2]);
          when(() => toDeckListViewModel(decks: [deck1, deck2]))
              .thenReturn(deckListViewModel1);

          bloc.add(DeckListInitialized());
          await expectLater(
            bloc.stream,
            emitsInOrder(
              [
                DeckListLoading(),
                DeckListLoaded(deckListViewModel: deckListViewModel1),
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
              () => getDeckList(),
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
      when(() => getDeckList()).thenAnswer((_) async => [deck1, deck2, deck3]);
      when(() => toDeckListViewModel(decks: [deck1, deck2, deck3]))
          .thenReturn(deckListViewModel1);
      when(() => toDeckListViewModel(decks: [deck1, deck3]))
          .thenReturn(deckListViewModel2);

      when(() => deleteDeck(deck: deck2)).thenAnswer(
        (_) async {},
      );

      bloc..add(DeckListInitialized())..add(DeckDeleted(deck: deck2));

      await expectLater(
        bloc.stream,
        emitsInOrder(
          [
            DeckListLoading(),
            DeckListLoaded(deckListViewModel: deckListViewModel1),
            DeckListLoading(),
            DeckListLoaded(deckListViewModel: deckListViewModel2),
          ],
        ),
      );

      verifyInOrder(
        [
          () => getDeckList(),
          () => deleteDeck(deck: deck2),
        ],
      );
      verifyNoMoreInteractions(getDeckList);
      verifyNoMoreInteractions(deleteDeck);
    },
  );
}
