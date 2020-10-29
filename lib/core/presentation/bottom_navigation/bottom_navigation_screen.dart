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

import 'package:flutter/material.dart';
import 'package:sona_flutter/features/deck_view/presentation/widgets/destination/deck_view_bot_nav_destination.dart';
import 'package:sona_flutter/features/settings/presentation/settings_bot_nav_destination.dart';

import 'bot_nav_destination.dart';

class BottomNavigationScreen extends StatefulWidget {
  static final List<BotNavDestination> _allDestinations = [
    DeckViewBotNavDestination(),
    SettingsBotNavDestination(),
  ];

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  void _onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _items = BottomNavigationScreen._allDestinations.map((destinationData) {
      return BottomNavigationBarItem(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        label: destinationData.label,
        icon: destinationData.icon,
        activeIcon: destinationData.activeIcon,
      );
    }).toList();

    var currentDestination =
        BottomNavigationScreen._allDestinations[_currentIndex];

    return Scaffold(
      appBar: currentDestination.appBar,
      body: SafeArea(
        child: currentDestination,
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
