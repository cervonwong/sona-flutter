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

import '../../../../core/constants/icon_symbol_constants.dart';
import '../../../../core/domain/entities/material/deck/deck.dart';
import '../../../../core/domain/entities/material/deck/deck_icon_spec.dart';
import '../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../view_models/deck_list_view_model.dart';

class ToDeckListViewModelMapper {
  final IconSymbolConstants _iconSymbolConstants;

  ToDeckListViewModelMapper({
    IconSymbolConstants iconSymbolConstants = const IconSymbolConstants(),
  }) : _iconSymbolConstants = iconSymbolConstants;

  DeckListViewModel call({required List<Deck> decks}) {
    return DeckListViewModel(
      items: decks
          .map(
            // TODO: 6/11/2021 Change these hard coded values in future.
            (deck) => DeckListItemViewModel(
              id: deck.id,
              name: deck.name,
              hasEntries: true,
              subtitle: '20 entries · 60/60 cards seen',
              dueText: '2 due',
              iconData: _iconSymbolConstants.values
                  .firstWhere(
                      (metadata) => metadata.symbol == deck.iconSpec.symbol)
                  .iconData,
              colorId: _mapToOnColorId(deck.iconSpec.color),
              hasCompletedRevision: false,
              progressPercent: 0.80,
            ),
          )
          .toList(),
    );
  }

  OnColorId _mapToOnColorId(
    DeckIconColor deckIconColor,
  ) {
    switch (deckIconColor) {
      case DeckIconColor.red:
        return OnColors.accentRedId;
      case DeckIconColor.orange:
        return OnColors.accentOrangeId;
      case DeckIconColor.yellow:
        return OnColors.accentYellowId;
      case DeckIconColor.lime:
        return OnColors.accentLimeId;
      case DeckIconColor.green:
        return OnColors.accentGreenId;
      case DeckIconColor.teal:
        return OnColors.accentTealId;
      case DeckIconColor.cyan:
        return OnColors.accentCyanId;
      case DeckIconColor.sky:
        return OnColors.accentSkyId;
      case DeckIconColor.blue:
        return OnColors.accentBlueId;
      case DeckIconColor.purple:
        return OnColors.accentPurpleId;
      case DeckIconColor.pink:
        return OnColors.accentPinkId;
    }
  }
}
