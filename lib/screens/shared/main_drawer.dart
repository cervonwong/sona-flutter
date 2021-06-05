// @dart=2.9

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

import '../../core/presentation/change_notifiers/color_notifier.dart';
import '../../core/presentation/constants/widget_constants.dart';

enum SelectableDrawerDestination { home, browse, progress, settings }

class MainDrawer extends StatelessWidget {
  final SelectableDrawerDestination selected;

  MainDrawer({@required this.selected});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        right: Radius.circular(WidgetConstants.cornerRadius32),
      ),
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ListTileTheme(
            style: ListTileStyle.drawer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(WidgetConstants.cornerRadius32),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  _DrawerTile(
                    selected: selected == SelectableDrawerDestination.home,
                    title: 'Home',
                    icon: FluentIcons.home_24_regular,
                    selectedIcon: FluentIcons.home_24_filled,
                    onTap: () {},
                  ),
                  _DrawerTile(
                    selected: selected == SelectableDrawerDestination.browse,
                    title: 'Browse',
                    icon: FluentIcons.search_24_regular,
                    selectedIcon: FluentIcons.search_24_filled,
                    onTap: () {},
                  ),
                  // _DrawerTile(
                  //   selected: false,
                  //   title: 'Edit',
                  //   icon: FluentIcons.edit_24_regular,
                  //   selectedIcon: FluentIcons.edit_24_filled,
                  //   onTap: () {},
                  // ),
                  _DrawerTile(
                    selected: selected == SelectableDrawerDestination.progress,
                    title: 'Progress',
                    icon: FluentIcons.data_pie_24_regular,
                    selectedIcon: FluentIcons.data_pie_24_filled,
                    onTap: () {},
                  ),
                  const Spacer(),
                  const Divider(indent: 16.0),
                  _DrawerTile(
                    selected: selected == SelectableDrawerDestination.settings,
                    title: 'Settings',
                    icon: FluentIcons.settings_24_regular,
                    selectedIcon: FluentIcons.settings_24_filled,
                    onTap: () {},
                  ),
                  _DrawerTile(
                    selected: false,
                    title: 'Help',
                    icon: FluentIcons.question_circle_24_regular,
                    selectedIcon: FluentIcons.question_circle_24_filled,
                    onTap: () {},
                  ),
                  Consumer<ColorNotifier>(
                    builder: (_, cn, __) {
                      return AboutListTile(
                        icon: Icon(
                          FluentIcons.info_24_regular,
                          color: cn.onSurface.lowEmphasis,
                        ),
                        applicationName: 'Sona',
                        applicationVersion: 'v.DEV',
                        applicationLegalese: 'Copyright (C) 2020 Cervon Wong',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final GestureTapCallback onTap;

  _DrawerTile({
    @required this.selected,
    @required this.title,
    @required this.icon,
    @required this.selectedIcon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).colorScheme.primary : null,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(WidgetConstants.cornerRadius32),
        ),
      ),
      child: ListTile(
        dense: true,
        selected: selected,
        leading: Consumer<ColorNotifier>(
          builder: (_, cn, __) {
            return Icon(
              selected ? selectedIcon : icon,
              color: selected
                  ? cn.onPrimary.highEmphasis
                  : cn.onSurface.lowEmphasis,
            );
          },
        ),
        title: Consumer<ColorNotifier>(
          builder: (_, cn, __) {
            return Text(
              title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: selected ? cn.onPrimary.highEmphasis : null,
                    fontWeight: selected ? FontWeight.w600 : null,
                  ),
            );
          },
        ),
        onTap: onTap,
      ),
    );
  }
}
