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

import 'package:sona_flutter/core/domain/entities/material/entry/entry.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_spec.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_type.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/input/entry_field_input.dart';

class MockEntryTag extends Mock implements EntryTag {}

class MockEntryFieldSpec extends Mock implements EntryFieldSpec {}

class MockEntryFieldInput extends Mock implements EntryFieldInput {}

void main() {
  final tag1 = MockEntryTag();
  final tag2 = MockEntryTag();

  final spec1 = MockEntryFieldSpec();
  final spec2 = MockEntryFieldSpec();
  final input1 = MockEntryFieldInput();
  final input2 = MockEntryFieldInput();

  setUp(() {
    when(() => spec1.type).thenReturn(EntryFieldType.text);
    when(() => spec2.type).thenReturn(EntryFieldType.image);
    when(() => input1.type).thenReturn(EntryFieldType.text);
    when(() => input2.type).thenReturn(EntryFieldType.image);
  });

  group(
    'Entry when constructed',
    () {
      group(
        'with collection type arguments, '
        'should shallow copy them',
        () {
          test(
            'tags is passed',
            () {
              final tags = {tag1};

              final entry = Entry(
                id: 999,
                tags: tags,
                fieldInputs: {spec1: input1},
              );

              tags.add(tag2);

              expect(entry.tags, {tag1});
            },
          );

          test(
            'fieldInputs is passed',
            () {
              final fieldInputs = {spec1: input1};

              final entry = Entry(id: 999, tags: {}, fieldInputs: fieldInputs);

              fieldInputs[spec2] = input2;

              expect(entry.fieldInputs, {spec1: input1});
            },
          );
        },
      );

      test(
        'with fieldInputs with entries with key and value with different types, '
        'should fail asserts',
        () {
          expect(
            () {
              Entry(
                id: 2,
                tags: {},
                fieldInputs: {spec1: input2},
              );
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntryType getters for collection type fields, '
    'should return a shallow copy',
    () {
      test(
        'tags getter',
        () {
          final entry = Entry(
            id: 2,
            tags: {tag1},
            fieldInputs: {spec1: input1},
          );
          expect(entry.tags, {tag1});

          final tags = entry.tags..clear();
          expect(tags, <EntryTag>{});
          expect(entry.tags, {tag1});
        },
      );

      test(
        'fieldInputs getter',
        () {
          final entry = Entry(
            id: 2,
            tags: {},
            fieldInputs: {spec1: input1},
          );
          expect(entry.fieldInputs, {spec1: input1});

          final fieldInputs = entry.fieldInputs..clear();
          expect(fieldInputs, <EntryFieldSpec, EntryFieldInput>{});
          expect(entry.fieldInputs, {spec1: input1});
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
        fieldInputs: {spec1: input1},
      );

      expect(entry.id, 7);
      expect(entry.tags, {tag1});
      expect(entry.fieldInputs, {spec1: input1});

      final newEntry = entry.copyWith(
        tags: {tag2},
        fieldInputs: {spec2: input2},
      );

      expect(newEntry.id, 7);
      expect(newEntry.tags, {tag2});
      expect(newEntry.fieldInputs, {spec2: input2});
    },
  );

  group(
    'Entry when equating',
    () {
      test(
        'logically equal Entries, '
        'should return true',
        () {
          final entry1 = Entry(id: 1, tags: {}, fieldInputs: {spec1: input1});
          final entry2 = entry1.copyWith(tags: {tag1, tag2});
          final entry3 = entry1.copyWith(fieldInputs: {spec2: input2});

          expect(entry1, entry2);
          expect(entry1, entry3);
          expect(entry2, entry3);
        },
      );

      test(
        'logically unequal Entries, '
        'should return false',
        () {
          final entry1 = Entry(
            id: 9999,
            tags: {},
            fieldInputs: {spec1: input1},
          );
          final entry2 = Entry(
            id: 9998,
            tags: {},
            fieldInputs: {spec1: input1},
          );

          expect(entry1, isNot(entry2));
        },
      );
    },
  );
}
