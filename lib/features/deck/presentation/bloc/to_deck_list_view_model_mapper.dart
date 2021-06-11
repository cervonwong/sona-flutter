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
import '../view_models/deck_list_view_model.dart';

class ToDeckListViewModelMapper {
  final IconSymbolConstants _iconSymbolConstants;

  ToDeckListViewModelMapper({
    IconSymbolConstants iconSymbolConstants = const IconSymbolConstants(),
  }) : _iconSymbolConstants = iconSymbolConstants;

  DeckListViewModel call(List<Deck> decks) {
    return DeckListViewModel(
      items: decks
          .map(
            // TODO: 6/11/2021 Change these hard coded values in future.
            (deck) => DeckListViewModelItem(
              id: deck.id,
              name: deck.name,
              hasEntries: true,
              subtitle: '20 entries · 60/60 cards seen',
              dueText: '2 due',
              iconData: _iconSymbolConstants.values
                  .firstWhere(
                      (metadata) => metadata.symbol == deck.iconSpec.symbol)
                  .iconData,
              iconColor:
                  _mapToDeckListViewModelItemIconColor(deck.iconSpec.color),
              hasCompletedRevision: false,
              progressPercent: 0.80,
            ),
          )
          .toList(),
    );
  }

  // TODO: 6/11/2021 I could not figure out how to use a ColorNotifier singleton
  //  instance to listen to, and get a Color out. Do I need to send another
  //  DeckListLoaded state if theme changes? Anyways, I decided to create
  //  another enum which is exactly the same as DeckIconColor, but it is part of
  //  the ViewModel and not part of Entity.
  DeckListViewModelItemIconColor _mapToDeckListViewModelItemIconColor(
    DeckIconColor deckIconColor,
  ) {
    switch (deckIconColor) {
      case DeckIconColor.red:
        return DeckListViewModelItemIconColor.red;
      case DeckIconColor.orange:
        return DeckListViewModelItemIconColor.orange;
      case DeckIconColor.yellow:
        return DeckListViewModelItemIconColor.yellow;
      case DeckIconColor.lime:
        return DeckListViewModelItemIconColor.lime;
      case DeckIconColor.green:
        return DeckListViewModelItemIconColor.green;
      case DeckIconColor.teal:
        return DeckListViewModelItemIconColor.teal;
      case DeckIconColor.cyan:
        return DeckListViewModelItemIconColor.cyan;
      case DeckIconColor.sky:
        return DeckListViewModelItemIconColor.sky;
      case DeckIconColor.blue:
        return DeckListViewModelItemIconColor.blue;
      case DeckIconColor.purple:
        return DeckListViewModelItemIconColor.purple;
      case DeckIconColor.pink:
        return DeckListViewModelItemIconColor.pink;
    }
  }
}
