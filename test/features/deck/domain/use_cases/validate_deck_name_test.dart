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
import 'package:sona_flutter/core/domain/repositories/material/deck/deck_repository.dart';
import 'package:sona_flutter/features/deck/domain/use_cases/validate_deck_name.dart';

class MockDeckRepositoryImpl extends Mock implements DeckRepository {}

class MockDeck extends Mock implements Deck {}

void main() {
  DeckRepository repository;
  ValidateDeckName validateDeckName;

  setUp(() {
    repository = MockDeckRepositoryImpl();
    validateDeckName = ValidateDeckName(repository: repository);
  });

  test(
    'ValidateDeckName when called with name which no deck in the db has, '
    'should return DeckNameValidationResult.valid',
    () async {
      when(repository.getByName(
        name: argThat(equals('Valid'), named: 'name'),
      )).thenAnswer((_) async => null);

      final result = await validateDeckName(name: 'Valid');
      expect(result, DeckNameValidationResult.valid);
    },
  );

  test(
    'ValidateDeckName when called with empty String for name, '
    'should return DeckNameValidationResult.empty',
    () async {
      final result = await validateDeckName(name: '');
      expect(result, DeckNameValidationResult.empty);
    },
  );

  test(
    'ValidateDeckName when called with name which a deck in the db has, '
    'should return DeckNameValidationResult.duplicate',
    () async {
      when(repository.getByName(
        name: argThat(equals('Duplicate'), named: 'name'),
      )).thenAnswer((_) async => MockDeck());

      final result = await validateDeckName(name: 'Duplicate');
      expect(result, DeckNameValidationResult.duplicate);
    },
  );
}
