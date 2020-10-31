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
import 'package:sona_flutter/core/domain/entities/material/card_format/components/text_component.dart';

void main() {
  test(
    'TextComponent when constructed without optional parameters, '
    'should have expected default fields',
    () {
      final textComponent = TextComponent(
        name: 'My Component',
        data: 'The quick brown fox.',
      );

      expect(textComponent.name, 'My Component');
      expect(textComponent.data, 'The quick brown fox.');
      expect(textComponent.size, 1.0);
      expect(textComponent.alignment, TextComponentAlignment.center);
      expect(textComponent.fillColor, TextComponentFillColor.neutral);
      expect(textComponent.highlightColor, TextComponentHighlightColor.none);
      expect(textComponent.isBold, false);
      expect(textComponent.isItalic, false);
      expect(textComponent.isUnderlined, false);
    },
  );

  test(
    'TextComponent when constructed with null parameters, '
    'should fail asserts',
    () {
      expect(
        () => TextComponent(
          name: null,
          data: 'Null component data',
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          size: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          alignment: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          fillColor: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          highlightColor: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          isBold: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          isItalic: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Null component name',
          data: 'Null component data',
          isUnderlined: null,
        ),
        throwsAssertionError,
      );
    },
  );

  test(
    'TextComponent when constructed with illegal name, '
    'should fail asserts',
    () {
      expect(
        () => TextComponent(
          name: 'x' * 151, // name > 150 characters is illegal.
          data: 'Illegal component data',
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'x' * 150, // name <= 150 characters is legal.
          data: 'Legal component data',
        ),
        isNot(throwsAssertionError),
      );
    },
  );

  test(
    'TextComponent when constructed with illegal size, '
    'should fail asserts',
    () {
      expect(
        () => TextComponent(
          name: 'Illegal component name',
          data: 'Illegal component data',
          size: 0.09, // size < 0.1 is illegal.
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Illegal component name',
          data: 'Illegal component data',
          size: 0.10, // size >= 0.10 and size <= 10.0 is legal.
        ),
        isNot(throwsAssertionError),
      );

      expect(
        () => TextComponent(
          name: 'Illegal component name',
          data: 'Illegal component data',
          size: 10.01, // size > 10.0 is illegal.
        ),
        throwsAssertionError,
      );

      expect(
        () => TextComponent(
          name: 'Illegal component name',
          data: 'Illegal component data',
          size: 10.0, // size >= 0.10 and size <= 10.0 is legal.
        ),
        isNot(throwsAssertionError),
      );
    },
  );

  test(
    'TextComponent copyWith, '
    'should return Card with expected altered fields',
    () {
      final textComponent1 = TextComponent(
        name: 'Name',
        data: 'Data',
        size: 5.0,
        alignment: TextComponentAlignment.justify,
        fillColor: TextComponentFillColor.blue,
        highlightColor: TextComponentHighlightColor.blue,
        isBold: false,
        isItalic: true,
        isUnderlined: false,
      );
      expect(textComponent1.name, 'Name');
      expect(textComponent1.data, 'Data');
      expect(textComponent1.size, 5.0);
      expect(textComponent1.alignment, TextComponentAlignment.justify);
      expect(textComponent1.fillColor, TextComponentFillColor.blue);
      expect(textComponent1.highlightColor, TextComponentHighlightColor.blue);
      expect(textComponent1.isBold, false);
      expect(textComponent1.isItalic, true);
      expect(textComponent1.isUnderlined, false);

      final textComponent2 = textComponent1.copyWith(
        name: 'New name',
        data: 'New data',
        size: 8.0,
        alignment: TextComponentAlignment.start,
        fillColor: TextComponentFillColor.red,
        highlightColor: TextComponentHighlightColor.pink,
        isBold: true,
        isItalic: false,
        isUnderlined: true,
      );
      expect(textComponent2.name, 'New name');
      expect(textComponent2.data, 'New data');
      expect(textComponent2.size, 8.0);
      expect(textComponent2.alignment, TextComponentAlignment.start);
      expect(textComponent2.fillColor, TextComponentFillColor.red);
      expect(textComponent2.highlightColor, TextComponentHighlightColor.pink);
      expect(textComponent2.isBold, true);
      expect(textComponent2.isItalic, false);
      expect(textComponent2.isUnderlined, true);
    },
  );

  test(
    'TextComponent when equating logically equal Cards, '
    'should return true',
    () {
      var textComponent = TextComponent(name: 'Equal name', data: 'Equal data');
      expect(textComponent, textComponent.copyWith());
    },
  );

  // Chose not to test unequal equation.
}
