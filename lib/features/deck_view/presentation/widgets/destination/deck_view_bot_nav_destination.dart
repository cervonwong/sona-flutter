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
import 'package:sona_flutter/core/presentation/bottom_navigation/bot_nav_destination.dart';

class DeckViewBotNavDestination extends BotNavDestination {
  DeckViewBotNavDestination()
      : super(
          appBar: AppBar(
            title: Text('Deck View Destination'),
          ),
          label: 'Decks',
          icon: Icon(FluentIcons.dictionary_24_regular),
          activeIcon: Icon(FluentIcons.dictionary_24_filled),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Placeholder(),
    );
  }
}
