// @dart=2.9

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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/change_notifiers/color_notifier.dart';

class DeckListTile extends StatelessWidget {
  // Constructor parameters
  final String deckName;
  final int totalCardCount;
  final int dueCardCount;
  final int reviewedCardCount;
  final int unscheduledCardCount;

  // Derived values
  final int scheduledCardCount;
  final int unreviewedCardCount;
  final double familiarCardPercentage;

  DeckListTile({
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
        scheduledCardCount = totalCardCount - unscheduledCardCount,
        unreviewedCardCount = dueCardCount - reviewedCardCount,
        familiarCardPercentage = 1 -
            (dueCardCount - reviewedCardCount) /
                (totalCardCount - unscheduledCardCount);

  @override
  Widget build(BuildContext context) {
    final color = _calculateColor(context);

    return Material(
      key: Key(deckName),
      color: Theme.of(context).colorScheme.surface,
      child: Consumer<ColorNotifier>(
        builder: (_, cn, child) {
          return InkWell(
            onTap: () {},
            onLongPress: () {},
            highlightColor: cn.onSurface.highlightPrimary,
            splashColor: cn.onSurface.splashPrimary,
            child: child,
          );
        },
        child: Card(
          color: Colors.transparent,
          margin: const EdgeInsets.all(0.0),
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _DeckNameTitle(deckName: deckName),
                    const SizedBox(width: 24.0),
                    unreviewedCardCount == 0
                        ? _CompletedReviewCheckmark()
                        : _UnreviewedCardCounter(
                            unreviewedCardCount: unreviewedCardCount,
                            color: color,
                          ),
                  ],
                ),
                const SizedBox(height: 12.0),
                _FamiliarityProgressBar(
                  familiarCardPercentage: familiarCardPercentage,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _calculateColor(BuildContext context) {
    // Naïve algorithm
    if (familiarCardPercentage >= 0.90) {
      return Provider.of<ColorNotifier>(context).onSurface.accentGreen;
    } else if (familiarCardPercentage >= 0.70) {
      return Provider.of<ColorNotifier>(context).onSurface.accentOrange;
    } else {
      return Provider.of<ColorNotifier>(context).onSurface.accentRed;
    }
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
                  color: cn.onSurface.highEmphasis,
                ),
          );
        },
      ),
    );
  }
}

class _UnreviewedCardCounter extends StatelessWidget {
  final int unreviewedCardCount;
  final Color color;

  const _UnreviewedCardCounter({
    @required this.unreviewedCardCount,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Text(
          '$unreviewedCardCount',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: color,
              ),
        );
      },
    );
  }
}

class _CompletedReviewCheckmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Icon(
          FluentIcons.checkmark_circle_24_filled,
          color: cn.onSurface.accentGreen,
        );
      },
    );
  }
}

class _FamiliarityProgressBar extends StatelessWidget {
  final double familiarCardPercentage;
  final Color color;

  _FamiliarityProgressBar({
    @required this.familiarCardPercentage,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    print(familiarCardPercentage);
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return LinearPercentIndicator(
          percent: familiarCardPercentage,
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          lineHeight: 8.0,
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        );
      },
    );
  }
}
