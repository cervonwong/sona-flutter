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
import 'package:sona_flutter/core/domain/entities/material/entry/entry.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';

// ignore: must_be_immutable
class MockEntryTag extends Mock implements EntryTag {}

void main() {
  final tag1 = MockEntryTag();
  final tag2 = MockEntryTag();

  group(
    'Entry when constructed',
    () {
      group(
        'with null parameters, '
        'should fail asserts',
        () {
          test(
            'id is null',
            () {
              expect(
                () {
                  Entry(id: null, tags: {}, fieldData: {});
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'tags is null',
            () {
              expect(
                () {
                  Entry(id: 100, tags: null, fieldData: {});
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'fieldData is null',
            () {
              expect(
                () {
                  Entry(id: 100, tags: {}, fieldData: null);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      group(
        'with parameters containing null, '
        'should fail asserts',
        () {
          test(
            'tags contains null',
            () {
              expect(
                () {
                  Entry(id: 100, tags: {null}, fieldData: {});
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      group(
        'with iterable parameters, '
        'should shallow copy them',
        () {
          test(
            'tags is passed',
            () {
              final tags = {tag1};

              final entry = Entry(id: 999, tags: tags, fieldData: {});

              tags.add(tag2);

              expect(entry.tags, {tag1});
            },
          );

          test(
            'fieldData is passed',
            () {
              final fieldData = {'TEST': 'test'};

              final entry = Entry(id: 999, tags: {}, fieldData: fieldData);

              fieldData['WOW'] = 'wow';

              expect(entry.fieldData, {'TEST': 'test'});
            },
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
        tags: {tag1},
        fieldData: {'Field 1': 'Data 1', 'Field 2': 'Data 2'},
      );

      expect(entry.id, 7);
      expect(entry.tags, {tag1});
      expect(entry.fieldData, {'Field 1': 'Data 1', 'Field 2': 'Data 2'});

      final newEntry = entry.copyWith(
        tags: {tag2},
        fieldData: {'New field 1': 'New data 1'},
      );

      expect(newEntry.id, 7);
      expect(newEntry.tags, {tag2});
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
          final entry1 = Entry(id: 1, tags: {}, fieldData: {});
          final entry2 = entry1.copyWith(tags: {tag1, tag2});
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
            tags: {},
            fieldData: {},
          );
          final entry2 = Entry(
            id: 9998,
            tags: {},
            fieldData: {},
          );

          expect(entry1, isNot(entry2));
        },
      );
    },
  );
}
