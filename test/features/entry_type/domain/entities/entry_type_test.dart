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
import 'package:sona_flutter/features/entry_type/domain/entities/entry_field/entry_field_spec.dart';
import 'package:sona_flutter/features/entry_type/domain/entities/entry_type.dart';

// ignore: must_be_immutable
class MockCardFormat extends Mock implements CardFormat {}

// ignore: must_be_immutable
class MockEntryFieldSpec extends Mock implements EntryFieldSpec {}

void main() {
  final cardFormat1 = MockCardFormat();
  final cardFormat2 = MockCardFormat();
  final fieldSpec1 = MockEntryFieldSpec();
  final fieldSpec2 = MockEntryFieldSpec();

  group(
    'EntryType when constructed',
    () {
      test(
        'with all parameters, '
        'should have expected fields '
        '(this class does not have optional parameters)',
        () {
          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          expect(entryType.id, 1);
          expect(entryType.name, 'Entry Type Name');
          expect(entryType.cardFormats, [cardFormat1]);
          expect(entryType.fieldSpecs, [fieldSpec1]);
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
                    fieldSpecs: [],
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
                    fieldSpecs: [],
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
                    fieldSpecs: [],
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
                    fieldSpecs: null,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      group(
        'with iterable parameters containing null, '
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
                    fieldSpecs: [],
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'fieldSpecs contains null',
                () {
              expect(
                    () {
                  EntryType(
                    id: 1,
                    name: 'Null EntryType',
                    cardFormats: [],
                    fieldSpecs: [null],
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
          final cardFormats = [cardFormat1];
          final fieldSpecs = [fieldSpec1];

          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: cardFormats,
            fieldSpecs: fieldSpecs,
          );

          cardFormats.add(cardFormat2);
          fieldSpecs.add(fieldSpec2);

          expect(entryType.cardFormats, [cardFormat1]);
          expect(entryType.fieldSpecs, [fieldSpec1]);
        },
      );
    },
  );

  group(
    'EntryType getters for iterable fields, '
        'should return a shallow copy',
        () {
      test(
        'cardFormats getter',
            () {
          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          expect(entryType.cardFormats, [cardFormat1]);

          final cardFormats = entryType.cardFormats..clear();

          expect(cardFormats, []);

          expect(entryType.cardFormats, [cardFormat1]);
        },
      );

      test(
        'fieldSpecs getter',
            () {
          final entryType = EntryType(
            id: 1,
            name: 'Entry Type Name',
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          expect(entryType.fieldSpecs, [fieldSpec1]);

          final fieldSpecs = entryType.fieldSpecs..clear();

          expect(fieldSpecs, []);

          expect(entryType.fieldSpecs, [fieldSpec1]);
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
            fieldSpecs: [],
          );

          final entryType2 = EntryType(
            id: 1,
            name: 'Second name',
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
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
            fieldSpecs: [],
          );

          final entryType2 = EntryType(
            id: 2,
            name: 'Name name',
            cardFormats: [],
            fieldSpecs: [],
          );

          expect(entryType1, isNot(entryType2));
        },
      );
    },
  );
}
