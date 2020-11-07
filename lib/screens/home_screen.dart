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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_widget_constants.dart';
import '../features/stats/streak/presentation/widgets/deck_list/deck_list_tile.dart';
import '../features/stats/streak/presentation/widgets/deck_list/deck_list_title_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: CustomDrawer(),
      drawerScrimColor: kNeutralColor8.withOpacity(0.50),
      body: SafeArea(
        child: ListView(
          children: [
            HomeHeader(),
            SizedBox(height: 32.0),
            DeckListTitleBar(),
            SizedBox(height: 8.0),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
            Divider(),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
            Divider(),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
            Divider(),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
            Divider(),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
            Divider(),
            DeckListTile(
              title: 'Toki Pona Base Terms Deck',
              dateMetadata: '1 day ago',
              dueCardCount: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        height: 300,
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(
          kLargeCornerRadius,
        ),
      ),
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ListTileTheme(
            style: ListTileStyle.drawer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(kSmallCornerRadius),
              ),
            ),
            child: ListView(
              children: [
                CustomListTile(
                  selected: true,
                  title: 'Home',
                  icon: FluentIcons.home_24_regular,
                  selectedIcon: FluentIcons.home_24_filled,
                  onTap: () {},
                ),
                CustomListTile(
                  selected: false,
                  title: 'Browse',
                  icon: FluentIcons.search_24_regular,
                  selectedIcon: FluentIcons.search_24_filled,
                  onTap: () {},
                ),
                CustomListTile(
                  selected: false,
                  title: 'Edit',
                  icon: FluentIcons.edit_24_regular,
                  selectedIcon: FluentIcons.edit_24_filled,
                  onTap: () {},
                ),
                CustomListTile(
                  selected: false,
                  title: 'Progress',
                  icon: FluentIcons.data_pie_24_regular,
                  selectedIcon: FluentIcons.data_pie_24_filled,
                  onTap: () {},
                ),
                CustomListTile(
                  selected: false,
                  title: 'Settings',
                  icon: FluentIcons.settings_24_regular,
                  selectedIcon: FluentIcons.settings_24_filled,
                  onTap: () {},
                ),
                CustomListTile(
                  selected: false,
                  title: 'Help',
                  icon: FluentIcons.question_circle_24_regular,
                  selectedIcon: FluentIcons.question_circle_24_filled,
                  onTap: () {},
                ),
                AboutListTile(
                  icon: Icon(FluentIcons.info_24_regular),
                  applicationName: 'Sona',
                  applicationVersion: 'v.DEV',
                  applicationLegalese: 'Copyright (C) 2020 Cervon Wong',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final GestureTapCallback onTap;

  CustomListTile({
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
        color: selected
            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
            : null,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(kSmallCornerRadius),
        ),
      ),
      child: ListTile(
        tileColor: Colors.transparent,
        selected: selected,
        leading: selected ? Icon(selectedIcon) : Icon(icon),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: selected ? Theme.of(context).colorScheme.primary : null,
                fontWeight: selected ? FontWeight.w500 : null,
              ),
        ),
        onTap: onTap,
      ),
    );
  }
}
