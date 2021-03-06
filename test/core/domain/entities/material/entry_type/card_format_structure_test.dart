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
import 'package:mocktail/mocktail.dart';

import 'package:sona_flutter/core/domain/entities/material/entry_type/card_format_structure.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/components/component.dart';

class MockComponent extends Mock implements Component {}

void main() {
  final mockComponent1 = MockComponent();
  final mockComponent2 = MockComponent();
  final mockComponent3 = MockComponent();

  final emptyStructure = const CardFormatStructure.empty();
  final smallStructure = CardFormatStructure(components: [mockComponent1]);
  final mediumStructure = CardFormatStructure(components: [
    mockComponent1,
    mockComponent2,
  ]);
  final largeStructure = CardFormatStructure(components: [
    mockComponent1,
    mockComponent2,
    mockComponent3,
  ]);

  test('CardFormatStructure constructor smoke test', () {
    // emptyStructure tested in named constructor test.
    expect(smallStructure.components, [mockComponent1]);
    expect(mediumStructure.components, [mockComponent1, mockComponent2]);
    expect(largeStructure.components, [
      mockComponent1,
      mockComponent2,
      mockComponent3,
    ]);
  });

  group(
    'CardFormatStructure when constructed',
    () {
      test(
        'by named constructor \'empty\', '
        'should have an empty state',
        () {
          expect(emptyStructure.components, []);
        },
      );

      test(
        'with components, '
        'should shallow copy the passed instance',
        () {
          final components = [mockComponent1];
          final structure = CardFormatStructure(components: components);

          expect(components, [mockComponent1]);
          expect(structure.components, [mockComponent1]);

          components.add(mockComponent2);

          expect(components, [mockComponent1, mockComponent2]);
          expect(structure.components, [mockComponent1]);
        },
      );
    },
  );

  test(
    'CardFormatStructure components getter, '
    'should return a shallow copy',
    () {
      final structure = CardFormatStructure(components: [mockComponent1]);
      final components = structure.components..add(mockComponent2);

      expect(components, [mockComponent1, mockComponent2]);
      expect(structure.components, [mockComponent1]);
    },
  );

  group(
    'CardFormatStructure insert',
    () {
      test(
        'when not passed index, '
        'should add passed component to the end of the component list',
        () {
          final structure1 = smallStructure.insert(component: mockComponent2);
          expect(
            structure1.components,
            [mockComponent1, mockComponent2],
          );

          final structure2 = emptyStructure.insert(component: mockComponent1);
          expect(structure2.components, [mockComponent1]);
        },
      );

      test(
        'when passed legal index, '
        'should add passed component to specified index',
        () {
          final structure1 = mediumStructure.insert(
            component: mockComponent3,
            index: 0,
          );
          expect(
            structure1.components,
            [mockComponent3, mockComponent1, mockComponent2],
          );

          final structure2 = mediumStructure.insert(
            component: mockComponent3,
            index: 1,
          );
          expect(
            structure2.components,
            [mockComponent1, mockComponent3, mockComponent2],
          );

          final structure3 = mediumStructure.insert(
            component: mockComponent3,
            index: 2,
          );
          expect(
            structure3.components,
            [mockComponent1, mockComponent2, mockComponent3],
          );
        },
      );

      test(
        'when passed illegal index, '
        'should fail asserts',
        () {
          expect(
            () {
              smallStructure.insert(component: mockComponent2, index: -1);
            },
            throwsAssertionError,
          );

          expect(
            () {
              smallStructure.insert(component: mockComponent2, index: 2);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'CardFormatStructure update',
    () {
      test(
        'when passed legal arguments, '
        'should replace specified component at index with passed component',
        () {
          final structure1 = mediumStructure.update(
            component: mockComponent3,
            index: 0,
          );
          expect(structure1.components, [mockComponent3, mockComponent2]);

          final structure2 = mediumStructure.update(
            component: mockComponent3,
            index: 1,
          );
          expect(structure2.components, [mockComponent1, mockComponent3]);
        },
      );

      test(
        'when passed illegal index, '
        'should fail asserts',
        () {
          expect(
            () {
              emptyStructure.update(component: mockComponent1, index: 0);
            },
            throwsAssertionError,
          );

          expect(
            () {
              smallStructure.update(component: mockComponent1, index: -1);
            },
            throwsAssertionError,
          );

          expect(
            () {
              mediumStructure.update(component: mockComponent1, index: 2);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  group(
    'CardFormatStructure remove',
    () {
      test(
        'when passed legal index, '
        'should remove specified component at index',
        () {
          final structure1 = mediumStructure.remove(index: 0);
          expect(structure1.components, [mockComponent2]);

          final structure2 = mediumStructure.remove(index: 1);
          expect(structure2.components, [mockComponent1]);

          final structure3 = structure2.remove(index: 0);
          expect(structure3.components, []);
        },
      );

      test(
        'when passed illegal index, '
        'should fail asserts',
        () {
          expect(
            () {
              emptyStructure.remove(index: 0);
            },
            throwsAssertionError,
          );

          expect(
            () {
              largeStructure.remove(index: -1);
            },
            throwsAssertionError,
          );

          expect(
            () {
              largeStructure.remove(index: 3);
            },
            throwsAssertionError,
          );
        },
      );
    },
  );

  test(
    'CardFormatStructure when equating logically equal CardFormatStructures, '
    'should return true',
    () {
      expect(emptyStructure, const CardFormatStructure.empty());
      expect(
        mediumStructure,
        CardFormatStructure(components: [mockComponent1, mockComponent2]),
      );
    },
  );
}
