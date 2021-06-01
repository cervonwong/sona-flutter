// @dart=2.9

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
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';

void main() {
  group(
    'EntryTag when constructed',
    () {
      group(
        'with null arguments, '
        'should fail asserts',
        () {
          test(
            'id is null',
            () {
              expect(
                () {
                  EntryTag(id: null, name: 'Noun');
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'name is null',
            () {
              expect(
                () {
                  EntryTag(id: 1, name: null);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );
    },
  );

  test(
    'EntryTag copyWith, '
    'should return EntryTag with expected altered fields',
    () {
      final entryTag = EntryTag(id: 100, name: 'First name');

      expect(entryTag.id, 100);
      expect(entryTag.name, 'First name');

      final newEntryTag = entryTag.copyWith(name: 'Second name');

      expect(newEntryTag.id, 100);
      expect(newEntryTag.name, 'Second name');
    },
  );

  group(
    'EntryTag when equating',
    () {
      test(
        'logically equal EntryTags, '
        'should return true',
        () {
          final entryTag1 = EntryTag(id: 666, name: 'Verb');
          final entryTag2 = EntryTag(id: 666, name: 'Adjective');

          expect(entryTag1, entryTag2);
        },
      );

      test(
        'logically unequal EntryTags, '
        'should return false',
        () {
          final entryTag1 = EntryTag(id: 666, name: 'Verb');
          final entryTag2 = EntryTag(id: 667, name: 'Verb');

          expect(entryTag1, isNot(entryTag2));
        },
      );
    },
  );
}
