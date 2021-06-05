// @dart=2.9

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
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/delete_deck.dart';

class MockDeckRepositoryImpl extends Mock implements DeckRepository {}

void main() {
  /*late*/ DeckRepository repository;
  /*late*/ DeleteDeck deleteDeck;

  setUp(() {
    repository = MockDeckRepositoryImpl();
    deleteDeck = DeleteDeck(repository: repository);
  });

  test(
    'DeleteDeck when passed legal arguments, '
    'should call DeckRepository.delete with expected arguments',
    () async {
      final deck = Deck(
        id: 1,
        name: 'Yass',
        createdDateTime: DateTime(2020),
        lastEditedDateTime: DateTime(2020),
        authorName: 'Noooo!',
        description: 'Nevermind...',
      );
      when(() => repository.delete(deck: deck)).thenAnswer((_) async {});

      await deleteDeck(deck: deck);
      // verify is only used for testing void and stubbed methods.
      verify(() => repository.delete(deck: deck));
    },
  );
}
