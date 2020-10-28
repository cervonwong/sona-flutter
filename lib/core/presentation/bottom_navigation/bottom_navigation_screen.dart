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
import 'package:sona_flutter/core/presentation/bottom_navigation/bottom_navigation_destination_data.dart';
import 'package:sona_flutter/features/deck_view/presentation/widgets/destination/deck_view_destination.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<BottomNavigationDestinationData> _allDestinations = [
    BottomNavigationDestinationData(
      widget: DeckViewDestination(),
      label: 'Decks',
      icon: Icon(FluentIcons.dictionary_24_regular),
      activeIcon: Icon(FluentIcons.dictionary_24_filled),
    ),
    BottomNavigationDestinationData(
      widget: Placeholder(),
      label: 'Search',
      icon: Icon(FluentIcons.search_24_regular),
      activeIcon: Icon(FluentIcons.search_24_filled),
    ),
    BottomNavigationDestinationData(
      widget: Placeholder(),
      label: 'Learn',
      icon: Icon(FluentIcons.flash_on_24_regular),
      activeIcon: Icon(FluentIcons.flash_on_24_filled),
    ),
    BottomNavigationDestinationData(
      widget: Placeholder(),
      label: 'Stats',
      icon: Icon(FluentIcons.data_pie_24_regular),
      activeIcon: Icon(FluentIcons.data_pie_24_filled),
    ),
    BottomNavigationDestinationData(
      widget: Placeholder(),
      label: 'Settings',
      icon: Icon(FluentIcons.settings_24_regular),
      activeIcon: Icon(FluentIcons.settings_24_filled),
    ),
  ];

  void _onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _items = _allDestinations.map((destinationData) {
      return BottomNavigationBarItem(
        label: destinationData.label,
        icon: destinationData.icon,
        activeIcon: destinationData.activeIcon,
      );
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _allDestinations[_currentIndex].widget,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: _items,
      ),
    );
  }
}
