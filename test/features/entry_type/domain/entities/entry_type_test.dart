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
import 'package:sona_flutter/features/entry_type/domain/entities/card_format.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_type.dart';

// ignore: must_be_immutable
class MockCardFormat extends Mock implements CardFormat {}

// ignore: must_be_immutable
class MockEntryField extends Mock implements EntryField {}

void main() {
  group(
    'EntryType when constructed',
    () {
      test(
        'with all parameters, '
        'should have expected fields '
        '(this class does not have optional parameters)',
        () {
          var cardFormat = MockCardFormat();
          var field = MockEntryField();

          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: [cardFormat],
            fields: [field],
          );

          expect(entryType.id, 1);
          expect(entryType.name, 'Entry Type Name');
          expect(entryType.cardFormats, [cardFormat]);
          expect(entryType.fields, [field]);
        },
      );

      group(
        'with null parameters, '
        'should fail asserts',
        () {
          test(
            'id is null',
            () {
              expect(
                () {
                  EntryType(
                    id: null,
                    name: 'Null EntryType',
                    cardFormats: [],
                    fields: [],
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
                  EntryType(
                    id: 1,
                    name: null,
                    cardFormats: [],
                    fields: [],
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'cardFormats is null',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Null EntryType',
                    cardFormats: null,
                    fields: [],
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'cardFormats is null',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Null EntryType',
                    cardFormats: [],
                    fields: null,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      group(
        'with lists containing null, '
        'should fail asserts',
        () {
          test(
            'cardFormats contains null',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Null EntryType',
                    cardFormats: [null],
                    fields: [],
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'fields contains null',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Null EntryType',
                    cardFormats: [],
                    fields: [null],
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'with all parameters, '
        'should shallow copy lists',
        () {
          var cardFormat = MockCardFormat();
          var field = MockEntryField();

          final cardFormats = [cardFormat];
          final fields = [field];

          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: cardFormats,
            fields: fields,
          );

          cardFormats.add(MockCardFormat());
          fields.add(MockEntryField());

          expect(entryType.cardFormats, [cardFormat]);
          expect(entryType.fields, [field]);
        },
      );
    },
  );

  group(
    'EntryType when equating',
    () {
      test(
        'logically equal EntryTypes, '
        'should return true',
        () {
          final entryType1 = EntryType(
            id: 1,
            name: 'First name',
            cardFormats: [],
            fields: [],
          );

          final entryType2 = EntryType(
            id: 1,
            name: 'Second name',
            cardFormats: [MockCardFormat()],
            fields: [MockEntryField()],
          );

          expect(entryType1, entryType2);
        },
      );

      test(
        'logically unequal EntryTypes, '
        'should return false',
        () {
          final entryType1 = EntryType(
            id: 1,
            name: 'Name name',
            cardFormats: [],
            fields: [],
          );

          final entryType2 = EntryType(
            id: 2,
            name: 'Name name',
            cardFormats: [],
            fields: [],
          );

          expect(entryType1, isNot(entryType2));
        },
      );
    },
  );
}
