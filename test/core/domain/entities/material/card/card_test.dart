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
import 'package:sona_flutter/core/domain/entities/material/card/card.dart';

void main() {
  group(
    'Card when constructed',
    () {
      test(
        'without optional arguments, '
        'should have expected default fields',
        () {
          final card = Card(
            id: 1,
          );

          expect(card.id, 1);
          expect(card.isStarred, false);
          expect(card.isHidden, false);
        },
      );

      test(
        'with null arguments, '
        'should fail asserts',
        () {
          expect(
            () {
              Card(id: null);
            },
            throwsAssertionError,
          );

          expect(
            () {
              Card(id: 1, isStarred: null);
            },
            throwsAssertionError,
          );

          expect(
            () {
              Card(id: 1, isHidden: null);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  test(
    'Card copyWith, '
    'should return Card with expected altered fields',
    () {
      final card1 = Card(
        id: 123,
        isStarred: false,
        isHidden: true,
      );
      expect(card1.id, 123);
      expect(card1.isStarred, false);
      expect(card1.isHidden, true);

      final card2 = card1.copyWith(isStarred: true);
      expect(card2.id, 123);
      expect(card2.isStarred, true);
      expect(card2.isHidden, true);

      final card3 = card2.copyWith(isHidden: false);
      expect(card3.id, 123);
      expect(card3.isStarred, true);
      expect(card3.isHidden, false);
    },
  );

  group(
    'Card when equating',
    () {
      test(
        'logically equal Cards, '
        'should return true',
        () {
          final card1 = Card(id: 1001);
          final card2 = card1.copyWith(isStarred: true);
          final card3 = card1.copyWith(isHidden: true);
          final card4 = card1.copyWith(isStarred: true, isHidden: true);

          expect(card1, card2);
          expect(card1, card3);
          expect(card1, card4);
          expect(card2, card3);
        },
      );

      test(
        'logically unequal Cards, '
        'should return false',
        () {
          final card1 = Card(id: 111);
          final card2 = Card(id: 110);

          expect(card1, isNot(card2));
        },
      );
    },
  );
}
