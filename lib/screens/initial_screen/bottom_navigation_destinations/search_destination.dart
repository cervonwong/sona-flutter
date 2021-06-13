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
import 'shared/app_bar_bottom_border.dart';

class SearchDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Search'),
      bottom: const AppBarBottomBorder(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchDestinationFab extends StatelessWidget {
  const SearchDestinationFab();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: cn.onBackground.shadowPrimary,
          ),
          child: child!,
        );
      },
      child: Consumer<ColorNotifier>(
        builder: (_, cn, __) {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(FluentIcons.arrow_up_24_regular),
          );
        },
      ),
    );
  }
}
