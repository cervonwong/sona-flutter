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

import 'package:sona_flutter/core/domain/entities/material/deck/deck_icon_spec.dart';

void main() {
  group(
    'DeckIconSpec when constructed',
    () {
      test(
        'with unnamed constructor, '
        'should have expected fields',
        () {
          final deckIconSpec = const DeckIconSpec(
            color: DeckIconColor.blue,
            symbol: DeckIconSymbol.book,
          );

          expect(deckIconSpec.color, DeckIconColor.blue);
          expect(deckIconSpec.symbol, DeckIconSymbol.book);
        },
      );
    },
  );

  test(
    'DeckIconSpec copyWith, '
    'should return DeckIconSpec with expected altered fields',
    () {
      final deckIconSpec = const DeckIconSpec(
        color: DeckIconColor.blue,
        symbol: DeckIconSymbol.book,
      );

      expect(deckIconSpec.color, DeckIconColor.blue);
      expect(deckIconSpec.symbol, DeckIconSymbol.book);

      final newDeckIconSpec = deckIconSpec.copyWith(
        color: DeckIconColor.cyan,
        symbol: DeckIconSymbol.flask,
      );

      expect(newDeckIconSpec.color, DeckIconColor.cyan);
      expect(newDeckIconSpec.symbol, DeckIconSymbol.flask);
    },
  );

  group(
    'DeckIconSpec when equating',
    () {
      test(
        'structurally equal DeckIconSpecs, '
        'should return true',
        () {
          final spec1 = const DeckIconSpec(
            color: DeckIconColor.blue,
            symbol: DeckIconSymbol.flask,
          );

          expect(spec1, spec1.copyWith());
        },
      );

      test(
        'structurally unequal DeckIconSpecs, '
        'should return false',
        () {
          final spec1 = const DeckIconSpec(
            color: DeckIconColor.blue,
            symbol: DeckIconSymbol.flask,
          );
          final spec2 = spec1.copyWith(color: DeckIconColor.cyan);
          final spec3 = spec1.copyWith(symbol: DeckIconSymbol.book);

          expect(spec1, isNot(spec2));
          expect(spec1, isNot(spec3));
        },
      );
    },
  );
}
