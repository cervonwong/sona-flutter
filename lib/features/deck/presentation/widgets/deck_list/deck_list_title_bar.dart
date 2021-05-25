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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/change_notifiers/color_notifier.dart';

class DeckListTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Consumer<ColorNotifier>(
                builder: (_, cn, __) {
                  return Text(
                    'Decks',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: cn.onBackground.highEmphasis,
                        ),
                  );
                },
              ),
              const SizedBox(width: 12.0),
              Consumer<ColorNotifier>(
                builder: (_, cn, __) {
                  return Text(
                    '136 cards to review',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: cn.onBackground.mediumEmphasis,
                        ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              splashRadius: 24.0,
              padding: const EdgeInsets.all(0.0),
              icon: Consumer<ColorNotifier>(
                builder: (_, cn, __) {
                  return Icon(
                    FluentIcons.filter_24_regular,
                    color: cn.onBackground.mediumEmphasis,
                  );
                },
              ),
              tooltip: 'Filter and sort',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
