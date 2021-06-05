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
import 'package:mockito/mockito.dart';

import 'package:sona_flutter/core/domain/entities/material/entry_type/card_format.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_field/entry_field_spec.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/entry_type.dart';

// ignore: must_be_immutable
class MockCardFormat extends Mock implements CardFormat {}

// ignore: must_be_immutable
class MockEntryFieldSpec extends Mock implements EntryFieldSpec {}

void main() {
  late CardFormat cardFormat1;
  late CardFormat cardFormat2;
  late CardFormat cardFormat3;
  late EntryFieldSpec fieldSpec1;
  late EntryFieldSpec fieldSpec2;
  late EntryFieldSpec fieldSpec3;

  late EntryType entryType;

  setUp(() {
    cardFormat1 = MockCardFormat();
    cardFormat2 = MockCardFormat();
    cardFormat3 = MockCardFormat();
    fieldSpec1 = MockEntryFieldSpec();
    fieldSpec2 = MockEntryFieldSpec();
    fieldSpec3 = MockEntryFieldSpec();

    entryType = EntryType(
      id: 666,
      name: 'Suspicious name',
      cardFormats: [cardFormat1],
      fieldSpecs: [fieldSpec1],
    );
  });

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

      test(
        'with cardFormats '
        'with at least a pair of CardFormats with equal id (duplicate), '
        'should fail asserts',
        () {
          final cardFormat100 = MockCardFormat();
          final cardFormat101 = MockCardFormat();

          when(cardFormat100.id).thenReturn(100);
          when(cardFormat101.id).thenReturn(100);

          expect(
            () {
              EntryType(
                id: 1,
                name: 'Something',
                cardFormats: [cardFormat100, cardFormat101],
                fieldSpecs: [fieldSpec1],
              );
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'with fieldSpecs '
        'with at least a pair of EntryFieldSpecs with equal id (duplicate), '
        'should fail asserts',
        () {
          final fieldSpec100 = MockEntryFieldSpec();
          final fieldSpec101 = MockEntryFieldSpec();

          when(fieldSpec100.id).thenReturn(100);
          when(fieldSpec101.id).thenReturn(100);

          expect(
            () {
              EntryType(
                id: 1,
                name: 'Something',
                cardFormats: [cardFormat1],
                fieldSpecs: [fieldSpec100, fieldSpec101],
              );
            },
            throwsAssertionError,
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
    'EntryType removeCardFormat',
    () {
      late EntryType entryType2;

      setUp(() {
        when(cardFormat1.id).thenReturn(1);
        when(cardFormat2.id).thenReturn(1);
        when(cardFormat3.id).thenReturn(2);

        entryType2 = EntryType(
          id: 999,
          name: 'Internal name',
          cardFormats: [cardFormat1, cardFormat3],
          fieldSpecs: [fieldSpec1],
        );
      });

      test(
        'when passed legal cardFormat, '
        'should remove correct CardFormat in cardFormats',
        () {
          final entryType3 = entryType2.removeCardFormat(
            cardFormat: cardFormat2,
          );

          expect(entryType3.cardFormats, [cardFormat3]);

          final entryType4 = entryType2.removeCardFormat(
            cardFormat: cardFormat3,
          );

          expect(entryType4.cardFormats, [cardFormat1]);
        },
      );

      test(
        'when passed cardFormat '
        'which does not have the same id as any existing CardFormat, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.removeCardFormat(cardFormat: cardFormat3);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntryType insertFieldSpec',
    () {
      setUp(() {
        when(fieldSpec1.id).thenReturn(1);
        when(fieldSpec2.id).thenReturn(2);
        when(fieldSpec3.id).thenReturn(3);
      });

      test(
        'when not passed index, '
        'should insert passed fieldSpec to the end of fieldSpecs',
        () {
          final entryType2 = entryType
              .insertFieldSpec(fieldSpec: fieldSpec2)
              .insertFieldSpec(fieldSpec: fieldSpec3);

          expect(entryType2.fieldSpecs, [fieldSpec1, fieldSpec2, fieldSpec3]);
        },
      );

      test(
        'when passed legal index, '
        'should insert passed fieldSpec to specified position in fieldSpecs',
        () {
          final entryType2 = entryType
              .insertFieldSpec(fieldSpec: fieldSpec2, index: 1)
              .insertFieldSpec(fieldSpec: fieldSpec3, index: 1);

          expect(entryType2.fieldSpecs, [fieldSpec1, fieldSpec3, fieldSpec2]);
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
                  entryType.insertFieldSpec(fieldSpec: fieldSpec2, index: 2);
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
                  entryType.insertFieldSpec(fieldSpec: fieldSpec2, index: -1);
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'when passed fieldSpec,'
        'which has the same id as an existing EntryFieldSpec, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.insertFieldSpec(fieldSpec: fieldSpec1, index: 0);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntryType updateFieldSpec',
    () {
      setUp(() {
        when(fieldSpec1.id).thenReturn(1);
        when(fieldSpec2.id).thenReturn(1);
        when(fieldSpec3.id).thenReturn(2);
      });

      test(
        'when passed legal newFieldSpec, '
        'should replace correct EntryFieldSpec in fieldSpecs',
        () {
          final entryType2 = entryType.updateFieldSpec(
            newFieldSpec: fieldSpec2,
          );

          expect(entryType2.fieldSpecs, [fieldSpec2]);

          final entryType3 = entryType2.updateFieldSpec(
            newFieldSpec: fieldSpec1,
          );

          expect(entryType3.fieldSpecs, [fieldSpec1]);
        },
      );

      test(
        'when passed newFieldSpec '
        'which does not have the same id as any existing EntryFieldSpec, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.updateFieldSpec(newFieldSpec: fieldSpec3);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'EntryType removeFieldSpec',
    () {
      late EntryType entryType2;

      setUp(() {
        when(fieldSpec1.id).thenReturn(1);
        when(fieldSpec2.id).thenReturn(1);
        when(fieldSpec3.id).thenReturn(2);

        entryType2 = EntryType(
          id: 999,
          name: 'Internal name',
          cardFormats: [cardFormat1],
          fieldSpecs: [fieldSpec1, fieldSpec3],
        );
      });

      test(
        'when passed legal field spec, '
        'should remove EntryFieldSpec in fieldSpecs',
        () {
          final entryType3 = entryType2.removeFieldSpec(fieldSpec: fieldSpec2);

          expect(entryType3.fieldSpecs, [fieldSpec3]);

          final entryType4 = entryType2.removeFieldSpec(fieldSpec: fieldSpec3);

          expect(entryType4.fieldSpecs, [fieldSpec1]);
        },
      );

      test(
        'when passed fieldSpec '
        'which does not have the same id as any existing EntryFieldSpec, '
        'should fail asserts',
        () {
          expect(
            () {
              entryType.removeFieldSpec(fieldSpec: fieldSpec3);
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
