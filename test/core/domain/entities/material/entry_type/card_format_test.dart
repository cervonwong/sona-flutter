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
import 'package:mockito/mockito.dart';

import 'package:sona_flutter/core/domain/entities/material/entry_type/card_format.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/card_format_structure.dart';

// ignore: must_be_immutable
class MockCardFormatStructure extends Mock implements CardFormatStructure {}

void main() {
  group(
    'CardFormat when constructed',
    () {
      test(
        'without optional arguments, '
        'should have expected default fields',
        () {
          final cardFormat = CardFormat(id: 1, name: 'Basic Front Format');

          expect(cardFormat.id, 1);
          expect(cardFormat.name, 'Basic Front Format');
          expect(cardFormat.front, const CardFormatStructure.empty());
          expect(cardFormat.back, const CardFormatStructure.empty());
        },
      );

      test(
        'with illegal name, '
        'should fail asserts',
        () {
          expect(
            () {
              CardFormat(id: 5, name: 'x' * 151);
            },
            // name > 150 chars is illegal.
            throwsAssertionError,
          );

          expect(
            () {
              CardFormat(id: 6, name: 'x' * 150);
            },
            // name <= 150 chars is legal.
            isNot(throwsAssertionError),
          );
        },
      );
    },
  );

  test(
    'CardFormat copyWith, '
    'should return CardFormat with expected altered fields',
    () {
      final structure1 = MockCardFormatStructure();
      final structure2 = MockCardFormatStructure();

      final cardFormat1 = CardFormat(
        id: 7,
        name: 'First name',
        front: structure1,
        back: structure2,
      );

      expect(cardFormat1.id, 7);
      expect(cardFormat1.name, 'First name');
      expect(cardFormat1.front, structure1);
      expect(cardFormat1.back, structure2);

      final cardFormat2 = cardFormat1.copyWith(
        name: 'New name',
        front: structure2,
        back: structure1,
      );

      expect(cardFormat1.id, 7);
      expect(cardFormat2.name, 'New name');
      expect(cardFormat2.front, structure2);
      expect(cardFormat2.back, structure1);
    },
  );

  group(
    'CardFormat when equating',
    () {
      test(
        'logically equal CardFormats, '
        'should return true',
        () {
          final cardFormat = CardFormat(
            id: 8,
            name: 'Equal name',
            front: MockCardFormatStructure(),
            back: MockCardFormatStructure(),
          );

          expect(cardFormat, cardFormat.copyWith());
        },
      );

      test(
        'logically unequal CardFormats, '
        'should return false',
        () {
          final cardFormat = CardFormat(
            id: 8,
            name: 'Equal name',
            front: MockCardFormatStructure(),
            back: MockCardFormatStructure(),
          );

          expect(
            cardFormat,
            isNot(
              CardFormat(
                id: 9,
                name: 'Equal name',
                front: MockCardFormatStructure(),
                back: MockCardFormatStructure(),
              ),
            ),
          );
          expect(
            cardFormat,
            isNot(cardFormat.copyWith(name: 'Another name')),
          );
          expect(
            cardFormat,
            isNot(cardFormat.copyWith(front: MockCardFormatStructure())),
          );
          expect(
            cardFormat,
            isNot(cardFormat.copyWith(back: MockCardFormatStructure())),
          );
        },
      );
    },
  );
}
