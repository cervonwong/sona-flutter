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

import 'package:sona_flutter/core/constants/icon_symbol_constants.dart';
import 'package:sona_flutter/core/constants/lookup_and_mapper_constants.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/deck/deck_entity_to_model_mapper.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/domain/entities/material/deck/deck_icon_spec.dart';

void main() {
  group(
    'DeckEntityToModelMapper when passed legal Deck, '
    'should return expected mapped DeckModel',
    () {
      test(
        'passed deck has null fields',
        () {
          final model = DeckEntityToModelMapper()(
            entity: Deck(
              id: 1,
              name: 'Name',
              createdDateTime: DateTime(2020),
              lastEditedDateTime: DateTime(2020),
              authorName: null,
              description: null,
              iconSpec: const DeckIconSpec(
                color: DeckIconColor.purple,
                symbol: DeckIconSymbol.deck,
              ),
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
              iconSymbolId: IconSymbolConstants.deckId,
              iconColorId: LookupAndMapperConstants.iconColorPurpleId,
            ),
          );
        },
      );

      test(
        'passed deck does not have null fields',
        () {
          final model = DeckEntityToModelMapper()(
            entity: Deck(
              id: 1,
              name: 'Name',
              createdDateTime: DateTime(2020),
              lastEditedDateTime: DateTime(2020),
              authorName: 'C3rv0N w0ng',
              description: 'made this.',
              iconSpec: const DeckIconSpec(
                color: DeckIconColor.blue,
                symbol: DeckIconSymbol.book,
              ),
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
              iconSymbolId: IconSymbolConstants.bookId,
              iconColorId: LookupAndMapperConstants.iconColorBlueId,
            ),
          );
        },
      );
    },
  );
}
