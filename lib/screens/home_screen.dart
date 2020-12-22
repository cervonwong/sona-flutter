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

import '../core/presentation/constants/color_constants.dart';
import '../features/deck/presentation/widgets/deck_list/deck_list_tile.dart';
import '../features/deck/presentation/widgets/deck_list/deck_list_title_bar.dart';
import 'shared/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar(),
      drawer: MainDrawer(selected: SelectableDrawerDestination.home),
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
              deckName: 'Toki Pona Base Terms Deck',
              totalCardCount: 1000,
              dueCardCount: 120,
              reviewedCardCount: 2,
              unscheduledCardCount: 500,
            ),
            DeckListTile(
              deckName: 'Chess opening names (from the book)',
              totalCardCount: 1000,
              dueCardCount: 120,
              reviewedCardCount: 60,
              unscheduledCardCount: 5,
            ),
            DeckListTile(
              deckName: 'French Vocabulary B2',
              totalCardCount: 1000,
              dueCardCount: 120,
              reviewedCardCount: 2,
              unscheduledCardCount: 5,
            ),
            DeckListTile(
              deckName: 'CM3232 2020 | Chemistry Olympiad Training | '
                  'Thermodynamics',
              totalCardCount: 1000,
              dueCardCount: 120,
              reviewedCardCount: 120,
              unscheduledCardCount: 5,
            ),
            DeckListTile(
              deckName: 'Kanto Pokémon (name + image)',
              totalCardCount: 1000,
              dueCardCount: 500,
              reviewedCardCount: 2,
              unscheduledCardCount: 5,
            ),
            DeckListTile(
              deckName: 'Chemistry 2021 Chapters 1-10',
              totalCardCount: 1000,
              dueCardCount: 120,
              reviewedCardCount: 2,
              unscheduledCardCount: 5,
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
        splashColor: kLightSplashColor,
        highlightColor: kLightHighlightColor,
        icon: Icon(FluentIcons.list_24_regular),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        onPressed: () => Scaffold.of(context).openDrawer(),
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

class _HomeFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(FluentIcons.add_24_regular),
      ),
    );
  }
}
