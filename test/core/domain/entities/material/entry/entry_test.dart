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
import 'package:sona_flutter/core/domain/entities/material/entry/entry.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/datum/entry_field_datum.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_spec.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_type.dart';

// ignore: must_be_immutable
class MockEntryTag extends Mock implements EntryTag {}

// ignore: must_be_immutable
class MockEntryFieldSpec extends Mock implements EntryFieldSpec {}

// ignore: must_be_immutable
class MockEntryFieldDatum extends Mock implements EntryFieldDatum {}

void main() {
  final tag1 = MockEntryTag();
  final tag2 = MockEntryTag();

  final spec1 = MockEntryFieldSpec();
  final spec2 = MockEntryFieldSpec();
  final datum1 = MockEntryFieldDatum();
  final datum2 = MockEntryFieldDatum();

  setUp(() {
    when(spec1.type).thenReturn(EntryFieldType.text);
    when(spec2.type).thenReturn(EntryFieldType.image);
    when(datum1.type).thenReturn(EntryFieldType.text);
    when(datum2.type).thenReturn(EntryFieldType.image);
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
                fieldData: {spec1: datum1},
              );

              tags.add(tag2);

              expect(entry.tags, {tag1});
            },
          );

          test(
            'fieldData is passed',
            () {
              final fieldData = {spec1: datum1};

              final entry = Entry(id: 999, tags: {}, fieldData: fieldData);

              fieldData[spec2] = datum2;

              expect(entry.fieldData, {spec1: datum1});
            },
          );
        },
      );

      test(
        'with fieldData with entries with key and value with different types, '
        'should fail asserts',
        () {
          expect(
            () {
              Entry(
                id: 2,
                tags: {},
                fieldData: {spec1: datum2},
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
            fieldData: {spec1: datum1},
          );
          expect(entry.tags, {tag1});

          final tags = entry.tags..clear();
          expect(tags, <EntryTag>{});
          expect(entry.tags, {tag1});
        },
      );

      test(
        'fieldData getter',
        () {
          final entry = Entry(
            id: 2,
            tags: {},
            fieldData: {spec1: datum1},
          );
          expect(entry.fieldData, {spec1: datum1});

          final fieldData = entry.fieldData..clear();
          expect(fieldData, <EntryFieldSpec, EntryFieldDatum>{});
          expect(entry.fieldData, {spec1: datum1});
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
        fieldData: {spec1: datum1},
      );

      expect(entry.id, 7);
      expect(entry.tags, {tag1});
      expect(entry.fieldData, {spec1: datum1});

      final newEntry = entry.copyWith(
        tags: {tag2},
        fieldData: {spec2: datum2},
      );

      expect(newEntry.id, 7);
      expect(newEntry.tags, {tag2});
      expect(newEntry.fieldData, {spec2: datum2});
    },
  );

  group(
    'Entry when equating',
    () {
      test(
        'logically equal Entries, '
        'should return true',
        () {
          final entry1 = Entry(id: 1, tags: {}, fieldData: {spec1: datum1});
          final entry2 = entry1.copyWith(tags: {tag1, tag2});
          final entry3 = entry1.copyWith(fieldData: {spec2: datum2});

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
            fieldData: {spec1: datum1},
          );
          final entry2 = Entry(
            id: 9998,
            tags: {},
            fieldData: {spec1: datum1},
          );

          expect(entry1, isNot(entry2));
        },
      );
    },
  );
}
