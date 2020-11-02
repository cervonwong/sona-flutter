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
import 'package:sona_flutter/core/constants/app_colors.dart';

class DeckViewListTile extends StatelessWidget {
  const DeckViewListTile({@required this.i});

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
