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
import 'package:sona_flutter/core/domain/entities/material/entry/entry.dart';

void main() {
  group(
    'Entry when constructed',
    () {
      test(
        'without optional parameters, '
        'should have expected default fields',
        () {
          final entry = Entry(
            id: 1,
            entryTypeId: 2,
          );

          expect(entry.id, 1);
          expect(entry.entryTypeId, 2);
          expect(entry.tags, <String>{});
          expect(entry.fieldData, <String, String>{});
        },
      );

      test(
        'with null parameters, '
        'should fail asserts',
        () {
          expect(
            () => Entry(
              id: null,
              entryTypeId: 1,
            ),
            throwsAssertionError,
          );

          expect(
            () => Entry(
              id: 100,
              entryTypeId: null,
            ),
            throwsAssertionError,
          );

          expect(
            () => Entry(
              id: 100,
              entryTypeId: 1,
              tags: null,
            ),
            throwsAssertionError,
          );

          expect(
            () => Entry(
              id: 100,
              entryTypeId: 1,
              fieldData: null,
            ),
            throwsAssertionError,
          );
        },
      );
    },
  );

  test(
    'Entry copyWith, '
    'should return Entry with expected altered fields',
    () {
      final entry = Entry(
        id: 7,
        entryTypeId: 3,
        tags: {'Tag 1', 'Tag 2'},
        fieldData: {'Field 1': 'Data 1', 'Field 2': 'Data 2'},
      );

      expect(entry.id, 7);
      expect(entry.entryTypeId, 3);
      expect(entry.tags, {'Tag 1', 'Tag 2'});
      expect(entry.fieldData, {'Field 1': 'Data 1', 'Field 2': 'Data 2'});

      final newEntry = entry.copyWith(
        tags: {'New tag 1', 'New tag 2', 'New tag 3'},
        fieldData: {'New field 1': 'New data 1'},
      );

      expect(newEntry.id, 7);
      expect(newEntry.entryTypeId, 3);
      expect(newEntry.tags, {'New tag 1', 'New tag 2', 'New tag 3'});
      expect(newEntry.fieldData, {'New field 1': 'New data 1'});
    },
  );

  group(
    'Entry when equating',
    () {
      test(
        'logically equal Entries, '
        'should return true',
        () {
          final entry1 = Entry(id: 1, entryTypeId: 2);
          final entry2 = entry1.copyWith(tags: {'Sona', 'Is', 'Good'});
          final entry3 = entry1.copyWith(fieldData: {
            'Sona': 'Is',
            'Very': 'Good',
          });
          final entry4 = entry2.copyWith(fieldData: {'Remember': 'Facts'});

          expect(entry1, entry2);
          expect(entry1, entry3);
          expect(entry1, entry4);
          expect(entry2, entry3);
          expect(entry2, entry4);
          expect(entry3, entry4);
        },
      );

      test(
        'logically unequal Entries, '
        'should return false',
        () {
          final entry1 = Entry(
            id: 9999,
            entryTypeId: 1,
          );
          final entry2 = Entry(
            id: 9998,
            entryTypeId: 1,
          );

          expect(entry1, isNot(entry2));
        },
      );
    },
  );
}
