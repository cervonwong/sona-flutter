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
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_entity_to_model_mapper.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';

void main() {
  test(
    'DeckEntityToModelMapper when passed null deck, '
    'should return null',
    () {
      final result = DeckEntityToModelMapper()(deck: null);

      expect(result, isNull);
    },
  );

  group(
    'DeckEntityToModelMapper when passed legal Deck, '
    'should return expected mapped DeckModel',
    () {
      test(
        'passed deck has null fields',
        () {
          final model = DeckEntityToModelMapper()(
            deck: Deck(
              id: 1,
              name: 'Name',
              createdDateTime: DateTime(2020),
              lastEditedDateTime: DateTime(2020),
              authorName: null,
              description: null,
            ),
          );

          expect(
            model,
            DeckModel(
              id: 1,
              name: 'Name',
              created: DateTime(2020),
              lastEdited: DateTime(2020),
              authorName: null,
              description: null,
            ),
          );
        },
      );

      test(
        'passed deck does not have null fields',
        () {
          final model = DeckEntityToModelMapper()(
            deck: Deck(
              id: 1,
              name: 'Name',
              createdDateTime: DateTime(2020),
              lastEditedDateTime: DateTime(2020),
              authorName: 'C3rv0N w0ng',
              description: 'made this.',
            ),
          );

          expect(
            model,
            DeckModel(
              id: 1,
              name: 'Name',
              created: DateTime(2020),
              lastEdited: DateTime(2020),
              authorName: 'C3rv0N w0ng',
              description: 'made this.',
            ),
          );
        },
      );
    },
  );
}
