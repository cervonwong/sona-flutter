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
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/input/image_entry_field_input.dart';
import 'package:sona_flutter/core/utils/nullable.dart';

void main() {
  group(
    'ImageEntryFieldInput when constructed',
    () {
      test(
        'should have type EntryFieldType.image',
        () {
          final input = ImageEntryFieldInput(imageId: 1);

          expect(input.type, EntryFieldType.image);
        },
      );

      test(
        'should accept null for imageId',
        () {
          final input = ImageEntryFieldInput(imageId: null);

          expect(input.imageId, null);
        },
      );
    },
  );

  group(
    'ImageEntryFieldInput copyWith, '
    'should return ImageEntryFieldInput with expected altered fields',
    () {
      test(
        'imageId becomes non-null',
        () {
          final input1 = ImageEntryFieldInput(imageId: null);

          expect(input1.imageId, null);

          final input2 = input1.copyWith(imageId: Nullable(888));

          expect(input2.imageId, 888);
        },
      );

      test(
        'imageId becomes null',
        () {
          final input1 = ImageEntryFieldInput(imageId: 123);

          expect(input1.imageId, 123);

          final input2 = input1.copyWith(imageId: Nullable(null));

          expect(input2.imageId, null);
        },
      );
    },
  );

  group(
    'ImageEntryFieldInput when equating',
    () {
      test(
        'logically equal ImageEntryFieldInputs, '
        'should return true',
        () {
          final input = ImageEntryFieldInput(imageId: 1234);

          expect(input, input.copyWith());
        },
      );

      test(
        'logically unequal ImageEntryFieldInputs, '
        'should return false',
        () {
          final input = ImageEntryFieldInput(imageId: 2);

          expect(
            input,
            isNot(input.copyWith(imageId: Nullable(3))),
          );
        },
      );
    },
  );
}
