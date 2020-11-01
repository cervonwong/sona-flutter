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
import 'package:sona_flutter/core/constants/app_colors.dart';
import 'package:sona_flutter/core/presentation/bottom_navigation/bot_nav_destination.dart';

import '../deck_view_app_bar.dart';

class DeckViewBotNavDestination extends BotNavDestination {
  DeckViewBotNavDestination()
      : super(
          appBar: DeckViewAppBar(),
          label: 'Decks',
          icon: Icon(FluentIcons.dictionary_24_regular),
          activeIcon: Icon(FluentIcons.dictionary_24_filled),
        );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 50; i++)
          Ink(
            color: Theme.of(context).colorScheme.surface,
            child: _DeckListTile(i: i),
          ),
      ],
    );
  }
}

class _DeckListTile extends StatelessWidget {
  const _DeckListTile({@required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Deck Title',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        '15 Due · 1000 Total · 90% Seen',
        style: Theme.of(context).textTheme.caption,
      ),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: i % 2 == 0 ? kSecondaryCyanColor : kSecondaryPinkColor,
          ),
        ),
      ),
      onTap: null,
    );
  }
}
