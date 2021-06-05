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

import 'package:sona_flutter/core/domain/entities/material/deck/deck.dart';
import 'package:sona_flutter/core/utils/nullable.dart';

void main() {
  group(
    'Deck when constructed',
    () {
      test(
        'without optional arguments, '
        'should have expected default fields',
        () {
          final deck = Deck(
              id: 1,
              name: 'My deck',
              createdDateTime: DateTime(2020, 1, 1),
              lastEditedDateTime: DateTime(2020, 10, 29));

          expect(deck.id, 1);
          expect(deck.name, 'My deck');
          expect(deck.createdDateTime, DateTime(2020, 1, 1));
          expect(deck.lastEditedDateTime, DateTime(2020, 10, 29));
          expect(deck.authorName, null);
          expect(deck.description, null);
        },
      );

      test(
        'with all arguments, '
        'should have expected fields',
        () {
          final deck = Deck(
            id: 2,
            name: 'Full deck',
            createdDateTime: DateTime(2010, 3, 4),
            lastEditedDateTime: DateTime(2020, 10, 30),
            authorName: 'Cervon Wong',
            description: 'A deck with all of its arguments set.',
          );

          expect(deck.id, 2);
          expect(deck.name, 'Full deck');
          expect(deck.createdDateTime, DateTime(2010, 3, 4));
          expect(deck.lastEditedDateTime, DateTime(2020, 10, 30));
          expect(deck.authorName, 'Cervon Wong');
          expect(deck.description, 'A deck with all of its arguments set.');
        },
      );

      test(
        'with createdDateTime after lastEditedDateTime, '
        'should fail asserts',
        () {
          expect(
            () {
              Deck(
                id: 6,
                name: 'Time Traveller Deck',
                createdDateTime: DateTime(2000, 12, 5),
                lastEditedDateTime: DateTime(1999, 9, 13),
              );
            },
            throwsAssertionError,
          );

          expect(
            () {
              Deck(
                id: 7,
                name: 'Time Traveller Deck',
                createdDateTime: DateTime(2000, 12, 5),
                lastEditedDateTime: DateTime(2000, 12, 5),
              );
            },
            isNot(throwsAssertionError),
          );
        },
      );
    },
  );

  test(
    'Deck copyWith, '
    'should return Deck with expected altered fields',
    () {
      final deck1 = Deck(
        id: 8,
        name: 'Random Deck',
        createdDateTime: DateTime(1999, 12, 31),
        lastEditedDateTime: DateTime(2000, 1, 1),
        authorName: 'Random Author',
        description: 'A random deck.',
      );
      expect(deck1.id, 8);
      expect(deck1.name, 'Random Deck');
      expect(deck1.createdDateTime, DateTime(1999, 12, 31));
      expect(deck1.lastEditedDateTime, DateTime(2000, 1, 1));
      expect(deck1.authorName, 'Random Author');
      expect(deck1.description, 'A random deck.');

      final deck2 = deck1.copyWith(
        name: 'New Deck',
        lastEditedDateTime: DateTime(2000, 1, 2),
      );
      expect(deck2.id, 8);
      expect(deck2.name, 'New Deck');
      expect(deck2.createdDateTime, DateTime(1999, 12, 31));
      expect(deck2.lastEditedDateTime, DateTime(2000, 1, 2));
      expect(deck2.authorName, 'Random Author');
      expect(deck2.description, 'A random deck.');

      final deck3 = deck2.copyWith(
        authorName: Nullable<String>('New Author'),
        description: Nullable<String>('This is a new deck.'),
      );
      expect(deck3.id, 8);
      expect(deck3.name, 'New Deck');
      expect(deck3.createdDateTime, DateTime(1999, 12, 31));
      expect(deck3.lastEditedDateTime, DateTime(2000, 1, 2));
      expect(deck3.authorName, 'New Author');
      expect(deck3.description, 'This is a new deck.');

      final deck4 = deck3.copyWith(
        authorName: Nullable<String>(null),
        description: Nullable<String>(null),
      );
      expect(deck4.id, 8);
      expect(deck4.name, 'New Deck');
      expect(deck4.createdDateTime, DateTime(1999, 12, 31));
      expect(deck4.lastEditedDateTime, DateTime(2000, 1, 2));
      expect(deck4.authorName, null);
      expect(deck4.description, null);
    },
  );

  group(
    'Deck when equating',
    () {
      test(
        'structurally equal Decks, '
        'should return true',
        () {
          final deck1 = Deck(
            id: 9,
            name: 'Equal Deck',
            createdDateTime: DateTime(2020, 10, 30),
            lastEditedDateTime: DateTime(2020, 10, 30),
          );

          expect(deck1, deck1.copyWith());
        },
      );

      test(
        'structurally unequal Decks, '
        'should return false',
        () {
          final name = 'Same Deck Name';
          final createdDateTime = DateTime(2019, 10, 30);
          final lastEditedDateTime = DateTime(2020, 10, 30);
          final authorName = 'Same Author';
          final description = 'Same description.';

          final deck1 = Deck(
            id: 1,
            name: name,
            createdDateTime: createdDateTime,
            lastEditedDateTime: lastEditedDateTime,
            authorName: authorName,
            description: description,
          );

          final deck2 = Deck(
            id: 1,
            name: name,
            createdDateTime: createdDateTime,
            lastEditedDateTime: lastEditedDateTime,
            authorName: authorName,
            description: null,
          );

          expect(deck1, isNot(deck2));
        },
      );
    },
  );
}
