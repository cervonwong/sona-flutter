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

import 'package:sona_flutter/core/constants/default_arg_constants.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck_icon_spec.dart';
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/create_deck.dart';

class MockDeckRepositoryImpl extends Mock implements DeckRepository {}

class MockDeck extends Mock implements Deck {}

class MockDeckIconSpec extends Mock implements DeckIconSpec {}

void main() {
  late DeckRepository repository;
  late CreateDeck createDeck;
  late Deck deck1;
  late DeckIconSpec iconSpec1;

  setUp(() {
    repository = MockDeckRepositoryImpl();
    createDeck = CreateDeck(repository: repository);
    deck1 = MockDeck();
    iconSpec1 = MockDeckIconSpec();
  });

  test(
    'CreateDeck when passed all arguments, '
    'should return expected Deck',
    () async {
      when(() => repository.create(
            name: 'Yass',
            authorName: 'bababooey',
            description: null,
            iconSpec: iconSpec1,
          )).thenAnswer((_) async => deck1);

      final deck = await createDeck(
        name: 'Yass',
        authorName: 'bababooey',
        description: null,
        iconSpec: iconSpec1,
      );
      expect(deck, deck1);
    },
  );

  test(
    'CreateDeck when passed all arguments except authorName, '
    'should return expected Deck with default authorName',
    () async {
      when(() => repository.create(
            name: 'Yass',
            authorName: DefaultArgConstants.deckAuthorName,
            description: null,
            iconSpec: iconSpec1,
          )).thenAnswer((_) async => deck1);

      final deck = await createDeck(
        name: 'Yass',
        description: null,
        iconSpec: iconSpec1,
      );
      expect(deck, deck1);
    },
  );

  test(
    'CreateDeck when passed all arguments except iconSpec, '
    'should return expected Deck with default iconSpec',
    () async {
      when(() => repository.create(
            name: 'Yass',
            authorName: 'bababooey',
            description: null,
            iconSpec: DefaultArgConstants.deckIconSpec,
          )).thenAnswer((_) async => deck1);

      final deck = await createDeck(
        name: 'Yass',
        authorName: 'bababooey',
        description: null,
      );
      expect(deck, deck1);
    },
  );

  test(
    'CreateDeck when passed only required arguments, '
    'should return expected Deck with expected default fields',
    () async {
      when(() => repository.create(
            name: 'LORD',
            authorName: DefaultArgConstants.deckAuthorName,
            description: DefaultArgConstants.deckDescription,
            iconSpec: DefaultArgConstants.deckIconSpec,
          )).thenAnswer((_) async => deck1);

      final deck = await createDeck(name: 'LORD');
      expect(deck, deck1);
    },
  );
}
