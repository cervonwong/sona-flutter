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

import '../../../../constants/icon_symbol_constants.dart';
import '../../../../constants/lookup_and_mapper_constants.dart';
import '../../../../domain/entities/material/deck/deck.dart';
import '../../../../domain/entities/material/deck/deck_icon_spec.dart';
import '../../../data_sources/moor/moor_database.dart';

class DeckModelToEntityMapper {
  // `IconSymbolConstants.value` is a large list which changes frequently. In
  // order to make predictable tests, a mocked instance of `IconSymbolConstants`
  // can be passed into classes which use it. By default, _iconSymbolConstants
  // is `const IconSymbolConstants()`.
  final IconSymbolConstants _iconSymbolConstants;

  DeckModelToEntityMapper({
    IconSymbolConstants iconSymbolConstants = const IconSymbolConstants(),
  }) : _iconSymbolConstants = iconSymbolConstants;

  Deck call({required DeckModel model}) {
    return Deck(
      id: model.id,
      name: model.name,
      createdDateTime: model.created,
      lastEditedDateTime: model.lastEdited,
      authorName: model.authorName,
      description: model.description,
      iconSpec: DeckIconSpec(
        color: _mapToColor(id: model.iconColorId),
        symbol: _mapToSymbol(id: model.iconSymbolId),
      ),
    );
  }

  DeckIconColor _mapToColor({required int id}) {
    return LookupAndMapperConstants.iconColorMapping.entries
        .firstWhere((entry) => entry.key == id)
        .value;
  }

  DeckIconSymbol _mapToSymbol({required int id}) {
    return _iconSymbolConstants.values
        .firstWhere((metadata) => metadata.id == id)
        .symbol;
  }
}
