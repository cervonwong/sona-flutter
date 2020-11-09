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

import '../../../../../../core/constants/app_colors.dart';

class DeckListTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                'Decks',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(width: 12.0),
              Text(
                '136 cards due',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(kMediumEmphasisOpacity),
                    ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              splashRadius: 24.0,
              padding: const EdgeInsets.all(0.0),
              icon: Icon(FluentIcons.search_24_regular),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
