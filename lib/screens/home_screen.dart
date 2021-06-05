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

import '../core/presentation/change_notifiers/color_notifier.dart';
import '../features/stats/streak/presentation/widgets/streak_counter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const _itemLabels = ['Decks', 'Search', 'Progress', 'Profile'];
  static const _unselectedIconData = [
    FluentIcons.style_guide_24_regular,
    FluentIcons.search_24_regular,
    FluentIcons.arrow_growth_24_regular,
    FluentIcons.person_24_regular,
  ];
  static const _selectedIconData = [
    FluentIcons.style_guide_24_filled,
    FluentIcons.search_24_filled,
    FluentIcons.arrow_growth_24_filled,
    FluentIcons.person_24_filled,
  ];
  static const _appBars = <PreferredSizeWidget>[
    DecksDestinationAppBar(),
    SearchDestinationAppBar(),
    ProgressDestinationAppBar(),
    ProfileDestinationAppBar(),
  ];
  static const _fabs = [
    DecksDestinationFab(),
    SearchDestinationFab(),
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentIndex],
      floatingActionButton: _fabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (int i = 0; i < 4; i++)
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == i
                    ? _selectedIconData[i]
                    : _unselectedIconData[i],
              ),
              label: _itemLabels[i],
            ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}

class DecksDestinationFab extends StatelessWidget {
  const DecksDestinationFab();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
      child: Consumer<ColorNotifier>(
        builder: (_, cn, __) {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(FluentIcons.add_24_regular),
          );
        },
      ),
    );
  }
}

class SearchDestinationFab extends StatelessWidget {
  const SearchDestinationFab();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
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

class DecksDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DecksDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Your Decks'),
      actions: [
        const StreakCounter(streakCount: 0, isActive: false),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Search'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProgressDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProgressDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Progress'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProfileDestinationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileDestinationAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Profile'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
