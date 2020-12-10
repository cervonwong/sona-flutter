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
import 'package:sona_flutter/core/utils/nullable.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field/datum/image_entry_field_datum.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field/entry_field_type.dart';

void main() {
  group(
    'ImageEntryFieldDatum when constructed',
    () {
      test(
        'should have type EntryFieldType.image',
        () {
          final datum = ImageEntryFieldDatum(imageId: 1);

          expect(datum.type, EntryFieldType.image);
        },
      );

      test(
        'should accept null for imageId',
        () {
          final datum = ImageEntryFieldDatum(imageId: null);

          expect(datum.imageId, null);
        },
      );
    },
  );

  group(
    'ImageEntryFieldDatum copyWith, '
    'should return ImageEntryFieldDatum with expected altered fields',
    () {
      test(
        'imageId becomes non-null',
        () {
          final datum1 = ImageEntryFieldDatum(imageId: null);

          expect(datum1.imageId, null);

          final datum2 = datum1.copyWith(imageId: Nullable(888));

          expect(datum2.imageId, 888);
        },
      );

      test(
        'imageId becomes null',
        () {
          final datum1 = ImageEntryFieldDatum(imageId: 123);

          expect(datum1.imageId, 123);

          final datum2 = datum1.copyWith(imageId: Nullable(null));

          expect(datum2.imageId, null);
        },
      );
    },
  );

  group(
    'ImageEntryFieldDatum when equating',
    () {
      test(
        'logically equal ImageEntryFieldData, '
        'should return true',
        () {
          final datum = ImageEntryFieldDatum(imageId: 1234);

          expect(datum, datum.copyWith());
        },
      );

      test(
        'logically unequal ImageEntryFieldData, '
        'should return false',
        () {
          final datum = ImageEntryFieldDatum(imageId: 2);

          expect(
            datum,
            isNot(datum.copyWith(imageId: Nullable(3))),
          );
        },
      );
    },
  );
}
