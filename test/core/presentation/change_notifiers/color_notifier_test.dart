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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sona_flutter/core/presentation/change_notifiers/color_notifier.dart';

void main() {
  ColorNotifier colorNotifier;

  setUp(
    () {
      colorNotifier = ColorNotifier(theme: ColorTheme.light);
    },
  );

  test(
    'ColorNotifier when theme changes, '
    'should have different colors for onSurface',
    () {
      final color1 = colorNotifier.onSurface.highlightNeutral;

      colorNotifier.theme = ColorTheme.dark;
      final color2 = colorNotifier.onSurface.highlightNeutral;

      expect(color1, isNot(color2));
    },
  );

  test(
    'ColorNotifier when listened, '
    'should get different colors for onSurface when theme changes',
    () {
      final color1 = colorNotifier.onSurface.highlightNeutral;
      Color color2;

      colorNotifier.addListener(
        () {
          color2 = colorNotifier.onSurface.highlightNeutral;
          expect(color2, isNot(color1));
        },
      );

      colorNotifier.theme = ColorTheme.dark;
      // Expect that the closure inside of addListener is called.
      expect(color2, isNotNull);
    },
  );

  test(
    'ColorNotifier when theme changes, '
    'should have themeMode change accordingly',
    () {
      expect(colorNotifier.themeMode, ThemeMode.light);

      colorNotifier.theme = ColorTheme.dark;
      expect(colorNotifier.themeMode, ThemeMode.dark);
    },
  );

  test(
    'ColorNotifier when listened, '
    'should have themeMode change when theme changes accordingly',
    () {
      ThemeMode themeMode;

      colorNotifier.addListener(
        () {
          themeMode = colorNotifier.themeMode;
          expect(themeMode, ThemeMode.dark);
        },
      );

      colorNotifier.theme = ColorTheme.dark;
      // Expect that the closure inside of addListener is called.
      expect(themeMode, isNotNull);
    },
  );

  group(
    'ColorNotifier null tests',
    () {
      test(
        'ColorNotifier when constructed with null theme, '
        'should fail asserts',
        () {
          expect(
            () {
              ColorNotifier(theme: null);
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'ColorNotifier when set theme to null, '
        'should fail asserts',
        () {
          expect(
            () {
              colorNotifier.theme = null;
            },
            throwsAssertionError,
          );
        },
      );
    },
  );
}
