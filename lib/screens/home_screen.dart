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
      appBar: _HomeAppBar(),
      drawer: SonaDrawer(),
      floatingActionButton: _HomeFAB(),
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
              dateString: '1 day ago',
              reviewedCardCount: 2,
              dueCardCount: 120,
            ),
            DeckListTile(
              title: 'Chess opening names (from the book)',
              dateString: '2 days ago',
              reviewedCardCount: 1,
              dueCardCount: 6,
            ),
            DeckListTile(
              title: 'French Vocabulary B2',
              dateString: '9 hours ago',
              reviewedCardCount: 2,
              dueCardCount: 6,
            ),
            DeckListTile(
              title: 'CM3232 2020 | Chemistry Olympiad Training | '
                  'Thermodynamics',
              dateString: '12 days ago',
              reviewedCardCount: 4,
              dueCardCount: 6,
            ),
            DeckListTile(
              title: 'Kanto Pokémon (name + image)',
              dateString: '3 months ago',
              reviewedCardCount: 5,
              dueCardCount: 6,
            ),
            DeckListTile(
              title: 'Chemistry 2021 Chapters 1-10',
              dateString: '1 day ago',
              reviewedCardCount: 12,
              dueCardCount: 12,
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Home'),
      leading: IconButton(
        icon: Icon(FluentIcons.list_24_regular),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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

class SonaDrawer extends StatelessWidget {
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
                DrawerTile(
                  selected: true,
                  title: 'Home',
                  icon: FluentIcons.home_24_regular,
                  selectedIcon: FluentIcons.home_24_filled,
                  onTap: () {},
                ),
                DrawerTile(
                  selected: false,
                  title: 'Browse',
                  icon: FluentIcons.search_24_regular,
                  selectedIcon: FluentIcons.search_24_filled,
                  onTap: () {},
                ),
                DrawerTile(
                  selected: false,
                  title: 'Edit',
                  icon: FluentIcons.edit_24_regular,
                  selectedIcon: FluentIcons.edit_24_filled,
                  onTap: () {},
                ),
                DrawerTile(
                  selected: false,
                  title: 'Progress',
                  icon: FluentIcons.data_pie_24_regular,
                  selectedIcon: FluentIcons.data_pie_24_filled,
                  onTap: () {},
                ),
                DrawerTile(
                  selected: false,
                  title: 'Settings',
                  icon: FluentIcons.settings_24_regular,
                  selectedIcon: FluentIcons.settings_24_filled,
                  onTap: () {},
                ),
                DrawerTile(
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

class DrawerTile extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final GestureTapCallback onTap;

  DrawerTile({
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
        dense: true,
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

class _HomeFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
      child: FloatingActionButton(
        tooltip: 'Addition options',
        onPressed: () {},
        child: Icon(FluentIcons.add_24_regular),
      ),
    );
  }
}
