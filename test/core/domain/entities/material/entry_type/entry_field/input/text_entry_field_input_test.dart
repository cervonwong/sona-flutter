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

import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_type.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/input/text_entry_field_input.dart';
import 'package:sona_flutter/core/utils/nullable.dart';

void main() {
  group(
    'TextEntryFieldInput when constructed',
    () {
      test(
        'should have type EntryFieldType.text',
        () {
          final input = TextEntryFieldInput(rawText: 'rawText');

          expect(input.type, EntryFieldType.text);
        },
      );

      test(
        'should accept null for rawText',
        () {
          final input = TextEntryFieldInput(rawText: null);

          expect(input.rawText, null);
        },
      );
    },
  );

  group(
    'TextEntryFieldInput copyWith, '
    'should return TextEntryFieldInput with expected altered fields',
    () {
      test(
        'rawText becomes non-null',
        () {
          final input1 = TextEntryFieldInput(rawText: null);

          expect(input1.rawText, null);

          final input2 = input1.copyWith(rawText: Nullable('something'));

          expect(input2.rawText, 'something');
        },
      );

      test(
        'rawText becomes null',
        () {
          final input1 = TextEntryFieldInput(rawText: 'anything');

          expect(input1.rawText, 'anything');

          final input2 = input1.copyWith(rawText: Nullable(null));

          expect(input2.rawText, null);
        },
      );
    },
  );

  group(
    'TextEntryFieldInput when equating',
    () {
      test(
        'logically equal TextEntryFieldInputs, '
        'should return true',
        () {
          final input = TextEntryFieldInput(rawText: 'Hello World');

          expect(input, input.copyWith());
        },
      );

      test(
        'logically unequal TextEntryFieldInputs, '
        'should return false',
        () {
          final input = TextEntryFieldInput(rawText: 'Hello World');

          expect(
            input,
            isNot(input.copyWith(rawText: Nullable('Goodbye world'))),
          );
        },
      );
    },
  );
}
