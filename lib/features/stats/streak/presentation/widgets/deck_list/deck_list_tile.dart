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

import '../../../../../../core/constants/app_colors.dart';

class DeckListTile extends StatelessWidget {
  final String title;
  final String dateMetadata;
  final int dueCardCount;

  const DeckListTile({
    @required this.title,
    @required this.dateMetadata,
    @required this.dueCardCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                dateMetadata,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kNeutralColor8.withOpacity(kMediumEmphasisOpacity),
                    ),
              ),
              Spacer(),
              Text(
                '$dueCardCount to review',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kNeutralColor8.withOpacity(kMediumEmphasisOpacity),
                    ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(title, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
