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
  final cardFormat3 = MockCardFormat();
  final fieldSpec1 = MockEntryFieldSpec();
  final fieldSpec2 = MockEntryFieldSpec();
  final fieldSpec3 = MockEntryFieldSpec();

  final entryType = EntryType(
    id: 666,
    name: 'Suspicious name',
    cardFormats: [cardFormat1],
    fieldSpecs: [fieldSpec1],
  );

  group(
    'EntryType when constructed',
    () {
      test(
        'with all arguments, '
        'should have expected fields '
        '(this class does not have optional arguments)',
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
        'with null arguments, '
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
                    cardFormats: [cardFormat1],
                    fieldSpecs: [fieldSpec1],
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
                    cardFormats: [cardFormat1],
                    fieldSpecs: [fieldSpec1],
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
                    cardFormats: [cardFormat1],
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
        'with collection type arguments containing null, '
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
                    fieldSpecs: [fieldSpec1],
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
                    cardFormats: [cardFormat1],
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
        'with all arguments, '
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

      group(
        'with empty collection type arguments, '
        'should fail asserts',
        () {
          test(
            'cardFormats is empty',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Random name',
                    cardFormats: [],
                    fieldSpecs: [fieldSpec1],
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'fieldSpecs is empty',
            () {
              expect(
                () {
                  EntryType(
                    id: 1,
                    name: 'Random name',
                    cardFormats: [cardFormat1],
                    fieldSpecs: [],
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

  group(
    'EntryType getters for collection type fields, '
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

  test(
    'EntryType copyWith, '
    'should return EntryType with expected altered fields',
    () {
      final entryType1 = EntryType(
        id: 1,
        name: 'Initial name',
        cardFormats: [cardFormat1],
        fieldSpecs: [fieldSpec1],
      );

      expect(entryType1.id, 1);
      expect(entryType1.name, 'Initial name');
      expect(entryType1.cardFormats, [cardFormat1]);
      expect(entryType1.fieldSpecs, [fieldSpec1]);

      final entryType2 = entryType1.copyWith(name: 'New name');

      expect(entryType2.id, 1);
      expect(entryType2.name, 'New name');
      expect(entryType2.cardFormats, [cardFormat1]);
      expect(entryType2.fieldSpecs, [fieldSpec1]);
    },
  );

  group(
    'EntryType insertCardFormat',
    () {
      setUp(() {
        when(cardFormat1.id).thenReturn(1);
        when(cardFormat2.id).thenReturn(2);
        when(cardFormat3.id).thenReturn(3);
      });

      test(
        'when not passed index, '
        'should insert passed cardFormat to the end of cardFormats',
        () {
          final entryType1 = entryType
              .insertCardFormat(cardFormat: cardFormat2)
              .insertCardFormat(cardFormat: cardFormat3);

          expect(
            entryType1.cardFormats,
            [cardFormat1, cardFormat2, cardFormat3],
          );
        },
      );

      test(
        'when passed legal index, '
        'should insert passed cardFormat to specified position in cardFormats',
        () {
          final entryType1 = entryType.insertCardFormat(
            cardFormat: cardFormat2,
            index: 0,
          );
          expect(entryType1.cardFormats, [cardFormat2, cardFormat1]);

          final entryType2 = entryType1.insertCardFormat(
            cardFormat: cardFormat3,
            index: 1,
          );
          expect(
            entryType2.cardFormats,
            [cardFormat2, cardFormat3, cardFormat1],
          );
        },
      );

      test(
        'when passed null cardFormat, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.insertCardFormat(cardFormat: null);
            },
            throwsAssertionError,
          );

          expect(
            () {
              entryType.insertCardFormat(cardFormat: null, index: 0);
            },
            throwsAssertionError,
          );
        },
      );

      group(
        'when passed index out of bounds, '
        'should fail asserts',
        () {
          test(
            'out of upper bound',
            () {
              expect(
                () {
                  entryType.insertCardFormat(
                    cardFormat: cardFormat2,
                    index: 2,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'out of lower bound',
            () {
              expect(
                () {
                  entryType.insertCardFormat(
                    cardFormat: cardFormat2,
                    index: -1,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'when passed cardFormat '
        'which has the same id as an existing CardFormat, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.insertCardFormat(cardFormat: cardFormat1);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntryType updateCardFormat',
    () {
      setUp(() {
        when(cardFormat1.id).thenReturn(1);
        when(cardFormat2.id).thenReturn(1);
        when(cardFormat3.id).thenReturn(2);
      });

      test(
        'when passed legal newCardFormat, '
        'should replace correct CardFormat in cardFormats',
        () {
          final entryType1 = entryType.updateCardFormat(
            newCardFormat: cardFormat2,
          );

          expect(entryType1.cardFormats, [cardFormat2]);

          final entryType2 = entryType.updateCardFormat(
            newCardFormat: cardFormat1,
          );

          expect(entryType2.cardFormats, [cardFormat1]);
        },
      );

      test(
        'when passed null newCardFormat, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.updateCardFormat(newCardFormat: null);
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when passed newCardFormat '
        'which does not have the same id as any existing CardFormat, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.updateCardFormat(newCardFormat: cardFormat3);
            },
            throwsAssertionError,
          );
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
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          final entryType2 = EntryType(
            id: 1,
            name: 'Second name',
            cardFormats: [cardFormat2],
            fieldSpecs: [fieldSpec2],
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
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          final entryType2 = EntryType(
            id: 2,
            name: 'Name name',
            cardFormats: [cardFormat1],
            fieldSpecs: [fieldSpec1],
          );

          expect(entryType1, isNot(entryType2));
        },
      );
    },
  );
}
