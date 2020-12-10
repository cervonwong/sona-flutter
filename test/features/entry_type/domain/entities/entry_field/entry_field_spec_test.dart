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
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field/entry_field_spec.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field/entry_field_type.dart';

void main() {
  group(
    'EntryFieldSpec when constructed',
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
                  EntryFieldSpec(
                    id: null,
                    name: 'Not null name',
                    type: EntryFieldType.text,
                  );
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
                  EntryFieldSpec(
                    id: 1,
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
                  EntryFieldSpec(
                    id: 2,
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
    'EntryFieldSpec copyWith, '
    'should return EntryFieldSpec with expected altered fields',
    () {
      final entryFieldSpec = EntryFieldSpec(
        id: 3,
        name: 'Random name',
        type: EntryFieldType.text,
      );

      expect(entryFieldSpec.id, 3);
      expect(entryFieldSpec.name, 'Random name');
      expect(entryFieldSpec.type, EntryFieldType.text);

      final newEntryFieldSpec = entryFieldSpec.copyWith(
        name: 'New name',
      );

      expect(entryFieldSpec.id, 3);
      expect(newEntryFieldSpec.name, 'New name');
      expect(entryFieldSpec.type, EntryFieldType.text);
    },
  );

  group(
    'EntryFieldSpec when equating',
    () {
      test(
        'logically equal EntryFieldSpecs, '
        'should return true',
        () {
          final entryFieldSpec1 = EntryFieldSpec(
            id: 4,
            name: 'Equal entryFieldSpec',
            type: EntryFieldType.image,
          );

          final entryFieldSpec2 = EntryFieldSpec(
            id: 4,
            name: 'Another equal entryFieldSpec',
            type: EntryFieldType.text,
          );

          expect(entryFieldSpec1, entryFieldSpec2);
        },
      );

      test(
        'logically unequal EntryFieldSpecs, '
        'should return false',
        () {
          final entryFieldSpec1 = EntryFieldSpec(
            id: 5,
            name: 'Name alpha',
            type: EntryFieldType.image,
          );

          final entryFieldSpec2 = EntryFieldSpec(
            id: 6,
            name: 'Name alpha',
            type: EntryFieldType.image,
          );

          expect(entryFieldSpec1, isNot(entryFieldSpec2));
        },
      );
    },
  );
}
