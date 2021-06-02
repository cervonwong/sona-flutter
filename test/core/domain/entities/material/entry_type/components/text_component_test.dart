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
import 'package:sona_flutter/core/domain/entities/material/entry_type/components/component.dart';
import 'package:sona_flutter/core/domain/entities/material/entry_type/components/text_component.dart';

void main() {
  group(
    'TextComponent when constructed',
    () {
      test(
        'should have type ComponentType.text',
        () {
          final textComponent = TextComponent(
            name: 'A random component',
            data: 'A slow brown fox',
          );

          expect(textComponent.type, ComponentType.text);
        },
      );

      test(
        'without optional arguments, '
        'should have expected default fields',
        () {
          final textComponent = TextComponent(
            name: 'My Component',
            data: 'The quick brown fox.',
          );

          expect(textComponent.name, 'My Component');
          expect(textComponent.data, 'The quick brown fox.');
          expect(textComponent.style.size, 1.0);
          expect(
            textComponent.style.alignment,
            TextComponentAlignment.center,
          );
          expect(
            textComponent.style.fillColor,
            TextComponentFillColor.neutral,
          );
          expect(
            textComponent.style.highlightColor,
            TextComponentHighlightColor.none,
          );
          expect(textComponent.style.isBold, false);
          expect(textComponent.style.isItalic, false);
          expect(textComponent.style.isUnderlined, false);
        },
      );

      test(
        'with illegal name, '
        'should fail asserts',
        () {
          expect(
            () {
              TextComponent(
                name: 'x' * 151, // name > 150 characters is illegal.
                data: 'Illegal component data',
              );
            },
            throwsAssertionError,
          );

          expect(
            () {
              TextComponent(
                name: 'x' * 150, // name <= 150 characters is legal.
                data: 'Legal component data',
              );
            },
            isNot(throwsAssertionError),
          );
        },
      );

      test(
        'with style with illegal size, '
        'should fail asserts',
        () {
          expect(
            () {
              TextComponent(
                name: 'Illegal component name',
                data: 'Illegal component data',
                style: TextComponentStyle(size: 0.09),
                // size < 0.1 is illegal.
              );
            },
            throwsAssertionError,
          );

          expect(
            () {
              TextComponent(
                name: 'Illegal component name',
                data: 'Illegal component data',
                style: const TextComponentStyle(size: 0.10),
                // size >= 0.10 and size <= 10.0 is legal.
              );
            },
            isNot(throwsAssertionError),
          );

          expect(
            () {
              TextComponent(
                name: 'Illegal component name',
                data: 'Illegal component data',
                style: TextComponentStyle(size: 10.01),
                // size > 10.0 is illegal.
              );
            },
            throwsAssertionError,
          );

          expect(
            () {
              TextComponent(
                name: 'Illegal component name',
                data: 'Illegal component data',
                style: const TextComponentStyle(size: 10.0),
                // 0.10 <= size <= 10.0 is legal.
              );
            },
            isNot(throwsAssertionError),
          );
        },
      );
    },
  );

  test(
    'TextComponent and TextComponentStyle copyWith, '
    'should return TextComponent with expected altered fields',
    () {
      final style1 = const TextComponentStyle(
        size: 5.0,
        alignment: TextComponentAlignment.justify,
        fillColor: TextComponentFillColor.blue,
        highlightColor: TextComponentHighlightColor.blue,
        isBold: false,
        isItalic: true,
        isUnderlined: false,
      );

      final textComponent1 = TextComponent(
        name: 'Name',
        data: 'Data',
        style: style1,
      );
      expect(textComponent1.name, 'Name');
      expect(textComponent1.data, 'Data');
      expect(textComponent1.style.size, 5.0);
      expect(
        textComponent1.style.alignment,
        TextComponentAlignment.justify,
      );
      expect(
        textComponent1.style.fillColor,
        TextComponentFillColor.blue,
      );
      expect(
        textComponent1.style.highlightColor,
        TextComponentHighlightColor.blue,
      );
      expect(textComponent1.style.isBold, false);
      expect(textComponent1.style.isItalic, true);
      expect(textComponent1.style.isUnderlined, false);

      final textComponent2 = textComponent1.copyWith(
        name: 'New name',
        data: 'New data',
        style: style1.copyWith(
          size: 8.0,
          alignment: TextComponentAlignment.start,
          fillColor: TextComponentFillColor.red,
          highlightColor: TextComponentHighlightColor.pink,
          isBold: true,
          isItalic: false,
          isUnderlined: true,
        ),
      );
      expect(textComponent2.name, 'New name');
      expect(textComponent2.data, 'New data');
      expect(textComponent2.style.size, 8.0);
      expect(
        textComponent2.style.alignment,
        TextComponentAlignment.start,
      );
      expect(
        textComponent2.style.fillColor,
        TextComponentFillColor.red,
      );
      expect(
        textComponent2.style.highlightColor,
        TextComponentHighlightColor.pink,
      );
      expect(textComponent2.style.isBold, true);
      expect(textComponent2.style.isItalic, false);
      expect(textComponent2.style.isUnderlined, true);
    },
  );

  test(
    'TextComponent when equating logically equal TextComponents, '
    'should return true',
    () {
      final textComponent =
          TextComponent(name: 'Equal name', data: 'Equal data');
      expect(
        textComponent,
        textComponent.copyWith(style: textComponent.style.copyWith()),
      );
    },
  );

  // Chose not to test unequal equation.
}
