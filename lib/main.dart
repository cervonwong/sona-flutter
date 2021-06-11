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

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'core/di/injection_container.dart' as injection_container;
import 'core/presentation/change_notifiers/color_notifier.dart';
import 'core/presentation/theme/themes.dart' as themes;
import 'screens/home_screen.dart';

void main() {
  injection_container.configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorNotifier(theme: ColorTheme.light),
      child: SonaApp(),
    ),
  );
}

class SonaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sona',
      theme: themes.createLightTheme(),
      home: HomeScreen(),
    );
  }
}
