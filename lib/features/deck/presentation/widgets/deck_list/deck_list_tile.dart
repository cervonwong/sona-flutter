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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/color_notifier.dart';

class DeckListTile extends StatelessWidget {
  // Constructor parameters
  final String deckName;
  final int totalCardCount;
  final int dueCardCount;
  final int reviewedCardCount;
  final int unscheduledCardCount;

  // Derived values
  final int unreviewedCardCount;

  const DeckListTile({
    @required this.deckName,
    @required this.totalCardCount,
    @required this.dueCardCount,
    @required this.reviewedCardCount,
    @required this.unscheduledCardCount,
  })  : assert(deckName != null),
        assert(totalCardCount != null),
        assert(totalCardCount >= dueCardCount),
        assert(dueCardCount != null),
        assert(dueCardCount >= 0),
        assert(dueCardCount <= totalCardCount),
        assert(reviewedCardCount != null),
        assert(reviewedCardCount >= 0),
        assert(reviewedCardCount <= dueCardCount),
        assert(unscheduledCardCount != null),
        assert(unscheduledCardCount >= 0),
        assert(unscheduledCardCount <= totalCardCount),
        unreviewedCardCount = dueCardCount - reviewedCardCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(deckName),
      margin: const EdgeInsets.all(0.0),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                _DeckNameTitle(deckName: deckName),
                SizedBox(width: 24.0),
                _UnreviewedCardCounter(
                  unreviewedCardCount: unreviewedCardCount,
                ),
              ],
            ),
            SizedBox(height: 12.0),
            _FamiliarityPercentIndicator(),
          ],
        ),
      ),
    );
  }
}

class _DeckNameTitle extends StatelessWidget {
  final String deckName;

  const _DeckNameTitle({
    @required this.deckName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ColorNotifier>(
        builder: (_, cn, __) {
          return Text(
            deckName,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: cn.onSurface.highEmphasisTextColor,
                ),
          );
        },
      ),
    );
  }
}

class _UnreviewedCardCounter extends StatelessWidget {
  final int unreviewedCardCount;

  const _UnreviewedCardCounter({
    @required this.unreviewedCardCount,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Text(
          '$unreviewedCardCount',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: cn.onSurface.mediumFamiliarityColor,
              ),
        );
      },
    );
  }
}

class _FamiliarityPercentIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return LinearPercentIndicator(
          percent: 0.50,
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          progressColor: cn.onSurface.mediumFamiliarityColor,
          backgroundColor: cn.onSurface.mediumFamiliarityColor.withOpacity(0.2),
          fillColor: Theme.of(context).colorScheme.surface,
          lineHeight: 8.0,
        );
      },
    );
  }
}
