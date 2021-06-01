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
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/datum/text_entry_field_datum.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_type.dart';
import 'package:sona_flutter/core/utils/nullable.dart';

void main() {
  group(
    'TextEntryFieldDatum when constructed',
    () {
      test(
        'should have type EntryFieldType.text',
        () {
          final datum = TextEntryFieldDatum(rawText: 'rawText');

          expect(datum.type, EntryFieldType.text);
        },
      );

      test(
        'should accept null for rawText',
        () {
          final datum = TextEntryFieldDatum(rawText: null);

          expect(datum.rawText, null);
        },
      );
    },
  );

  group(
    'TextEntryFieldDatum copyWith, '
    'should return TextEntryFieldDatum with expected altered fields',
    () {
      test(
        'rawText becomes non-null',
        () {
          final datum1 = TextEntryFieldDatum(rawText: null);

          expect(datum1.rawText, null);

          final datum2 = datum1.copyWith(rawText: Nullable('something'));

          expect(datum2.rawText, 'something');
        },
      );

      test(
        'rawText becomes null',
        () {
          final datum1 = TextEntryFieldDatum(rawText: 'anything');

          expect(datum1.rawText, 'anything');

          final datum2 = datum1.copyWith(rawText: Nullable(null));

          expect(datum2.rawText, null);
        },
      );
    },
  );

  group(
    'TextEntryFieldDatum when equating',
    () {
      test(
        'logically equal TextEntryFieldData, '
        'should return true',
        () {
          final datum = TextEntryFieldDatum(rawText: 'Hello World');

          expect(datum, datum.copyWith());
        },
      );

      test(
        'logically unequal TextEntryFieldData, '
        'should return false',
        () {
          final datum = TextEntryFieldDatum(rawText: 'Hello World');

          expect(
            datum,
            isNot(datum.copyWith(rawText: Nullable('Goodbye world'))),
          );
        },
      );
    },
  );
}
