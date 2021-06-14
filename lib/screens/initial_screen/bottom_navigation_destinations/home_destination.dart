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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/change_notifiers/color_notifier.dart';
import '../../../features/stats/streak/presentation/widgets/streak_counter.dart';
import 'shared/app_bar_bottom_border.dart';
import 'shared/drawer_icon_button.dart';

class HomeDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Good morning'),
      leading: const DrawerIconButton(),
      actions: [
        const StreakCounter(streakCount: 0, isActive: false),
      ],
      bottom: const AppBarBottomBorder(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeDestinationFab extends StatelessWidget {
  const HomeDestinationFab();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, colorNotifier, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: colorNotifier.onBackground.shadowPrimary,
          ),
          child: child!,
        );
      },
      child: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(FluentIcons.document_add_24_regular),
          );
        },
      ),
    );
  }
}
