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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_widget_constants.dart';

class DeckListTile extends StatelessWidget {
  final String title;
  final String dateString;
  final int reviewedCardCount;
  final int dueCardCount;

  final int toReviewCardCount;
  final bool hasCompletedReview;

  const DeckListTile({
    @required this.title,
    @required this.dateString,
    @required this.reviewedCardCount,
    @required this.dueCardCount,
  })  : assert(title != null),
        assert(dateString != null),
        assert(reviewedCardCount != null),
        assert(dueCardCount != null),
        assert(reviewedCardCount >= 0),
        assert(dueCardCount >= 0),
        assert(reviewedCardCount <= dueCardCount),
        toReviewCardCount = dueCardCount - reviewedCardCount,
        hasCompletedReview = reviewedCardCount == dueCardCount;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Theme.of(context).colorScheme.surface,
      child: ListTile(
        key: Key(title),
        title: Text(
          title,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
        subtitle: Text(
          dateString,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withOpacity(kMediumEmphasisOpacity),
              ),
        ),
        leading: _ReviewIndicator(
          toReviewCardCount: toReviewCardCount,
          hasCompletedReview: hasCompletedReview,
        ),
        trailing: SizedBox(
          height: 24.0,
          width: 24.0,
          child: IconButton(
            splashRadius: 24.0,
            padding: const EdgeInsets.all(0.0),
            icon: Icon(FluentIcons.more_vertical_24_regular),
            onPressed: () {},
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _ReviewIndicator extends StatelessWidget {
  final int toReviewCardCount;
  final bool hasCompletedReview;

  const _ReviewIndicator({
    @required this.toReviewCardCount,
    @required this.hasCompletedReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primary
            .withOpacity(hasCompletedReview ? 1.0 : 0.2),
        borderRadius: BorderRadius.circular(kSmallCornerRadius),
      ),
      child: hasCompletedReview
          ? Icon(
              FluentIcons.checkmark_24_regular,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          : Text(
              '$toReviewCardCount',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
    );
  }
}
