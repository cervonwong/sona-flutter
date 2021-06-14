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
import '../../features/deck/presentation/widgets/deck_list_pane.dart';
import 'bottom_navigation_destinations/home_destination.dart';
import 'bottom_navigation_destinations/profile_destination.dart';
import 'bottom_navigation_destinations/progress_destination.dart';
import 'bottom_navigation_destinations/search_destination.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _currentIndex = 0;

  static const _appBars = <PreferredSizeWidget>[
    HomeDestinationAppBar(),
    SearchDestinationAppBar(),
    ProgressDestinationAppBar(),
    ProfileDestinationAppBar(),
  ];
  static const _fabs = [
    HomeDestinationFab(),
    SearchDestinationFab(),
    null,
    null,
  ];
  static final _bodies = <Widget>[
    const DeckListPane(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentIndex],
      floatingActionButton: _fabs[_currentIndex],
      drawer: const Drawer(),
      bottomNavigationBar: StyledBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      body: SafeArea(
        child: _bodies[_currentIndex],
      ),
    );
  }
}

class StyledBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;

  static const _itemLabels = ['Home', 'Search', 'Progress', 'Profile'];
  static const _unselectedIconData = [
    FluentIcons.home_24_regular,
    FluentIcons.search_24_regular,
    FluentIcons.arrow_growth_24_regular,
    FluentIcons.person_24_regular,
  ];
  static const _selectedIconData = [
    FluentIcons.home_24_filled,
    FluentIcons.search_24_filled,
    FluentIcons.arrow_growth_24_filled,
    FluentIcons.person_24_filled,
  ];

  const StyledBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, colorNotifier, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: colorNotifier.onSurface.borderRegular,
              width: WidgetConstants.borderThickness,
            ),
          ),
          child: child,
        );
      },
      child: BottomNavigationBar(
        items: [
          for (int i = 0; i < 4; i++)
            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == i
                    ? _selectedIconData[i]
                    : _unselectedIconData[i],
              ),
              label: _itemLabels[i],
            ),
        ],
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
