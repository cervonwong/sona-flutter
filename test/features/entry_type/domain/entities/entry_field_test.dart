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
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field.dart';

void main() {
  group(
    'EntryField when constructed',
    () {
      group(
        'with null parameters, '
        'should fail asserts',
        () {
          test(
            'name is null',
            () {
              expect(
                () {
                  EntryField(
                    name: null,
                    type: EntryFieldType.text,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'type is null',
            () {
              expect(
                () {
                  EntryField(
                    name: 'Not null name',
                    type: null,
                  );
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
    'EntryField copyWith, '
    'should return EntryField with expected altered fields',
    () {
      final entryField = EntryField(
        name: 'Random name',
        type: EntryFieldType.text,
      );

      expect(entryField.name, 'Random name');
      expect(entryField.type, EntryFieldType.text);

      final newEntryField = entryField.copyWith(
        name: 'New name',
        type: EntryFieldType.image,
      );

      expect(newEntryField.name, 'New name');
      expect(newEntryField.type, EntryFieldType.image);
    },
  );

  group(
    'EntryField when equating',
    () {
      test(
        'logically equal EntryFields, '
        'should return true',
        () {
          final entryField = EntryField(
            name: 'Equal entryField',
            type: EntryFieldType.image,
          );

          expect(entryField, entryField.copyWith());
        },
      );

      test(
        'logically unequal EntryFields, '
        'should return true',
        () {
          final entryField1 = EntryField(
            name: 'Name alpha',
            type: EntryFieldType.image,
          );

          final entryField2 = EntryField(
            name: 'Name beta',
            type: EntryFieldType.image,
          );

          final entryField3 = EntryField(
            name: 'Name alpha',
            type: EntryFieldType.text,
          );

          expect(entryField1, isNot(entryField2));
          expect(entryField1, isNot(entryField3));
        },
      );
    },
  );
}
