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
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/create_deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/delete_deck.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/get_all_decks.dart';
import 'package:sona_flutter/features/deck/presentation/bloc/deck_bloc.dart';

class MockCreateDeck extends Mock implements CreateDeck {}

class MockGetAllDecks extends Mock implements GetAllDecks {}

class MockDeleteDeck extends Mock implements DeleteDeck {}

// ignore: must_be_immutable
class MockDeck extends Mock implements Deck {}

void main() {
  CreateDeck createDeck;
  GetAllDecks getAllDecks;
  DeleteDeck deleteDeck;

  Deck deck1, deck2, deck3;

  DeckBloc bloc;

  setUp(() {
    createDeck = MockCreateDeck();
    getAllDecks = MockGetAllDecks();
    deleteDeck = MockDeleteDeck();
    deck1 = MockDeck();
    deck2 = MockDeck();
    deck3 = MockDeck();
    bloc = DeckBloc(
      createDeck: createDeck,
      getAllDecks: getAllDecks,
      deleteDeck: deleteDeck,
    );
  });

  test(
    'DeckBloc when created, '
    'should have initial state DeckInitial',
    () {
      final state = bloc.state;

      expect(state, DeckInitial());
    },
  );

  test(
    'DeckBloc when added DeckInitialized, '
    'should emit expected state with list of decks',
    () async {
      when(getAllDecks())..thenAnswer((_) async => [deck1, deck2, deck3]);

      bloc..add(DeckInitialized());

      await expectLater(
        bloc,
        emitsInOrder(
          [
            DeckLoading(),
            DeckLoaded(decks: [deck1, deck2, deck3]),
          ],
        ),
      );

      verify(getAllDecks()).called(1);
    },
  );

  test(
    'DeckBloc when added DeckInitialized then DeckCreated, '
    'should emit expected state with list of decks with created deck',
    () async {
      when(getAllDecks())..thenAnswer((_) async => [deck1, deck2]);

      bloc.add(DeckInitialized());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            DeckLoading(),
            DeckLoaded(decks: [deck1, deck2]),
          ],
        ),
      );

      when(createDeck(name: argThat(equals('Prague'), named: 'name')))
          .thenAnswer(
        (_) async => deck3,
      );
      when(getAllDecks())..thenAnswer((_) async => [deck1, deck2, deck3]);

      bloc.add(DeckCreated(name: 'Prague'));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            DeckLoading(),
            DeckLoaded(decks: [deck1, deck2, deck3]),
          ],
        ),
      );

      verifyInOrder(
        [
          getAllDecks(),
          createDeck(name: 'Prague'),
          getAllDecks(),
        ],
      );
      verifyNoMoreInteractions(createDeck);
      verifyNoMoreInteractions(getAllDecks);
    },
  );

  test(
    'DeckBloc when added DeckInitialized then DeckDeleted, '
    'should emit expected state with list of decks with deleted deck',
    () async {
      when(getAllDecks())..thenAnswer((_) async => [deck1, deck2, deck3]);
      when(deleteDeck(deck: argThat(equals(deck2), named: 'deck'))).thenAnswer(
        (_) async {},
      );

      bloc..add(DeckInitialized())..add(DeckDeleted(deck: deck2));

      await expectLater(
        bloc,
        emitsInOrder(
          [
            DeckLoading(),
            DeckLoaded(decks: [deck1, deck2, deck3]),
            DeckLoading(),
            DeckLoaded(decks: [deck1, deck3]),
          ],
        ),
      );

      verifyInOrder(
        [
          getAllDecks(),
          deleteDeck(deck: deck2),
        ],
      );
      verifyNoMoreInteractions(getAllDecks);
      verifyNoMoreInteractions(deleteDeck);
    },
  );
}
