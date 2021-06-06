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

class DeckEntityToModelMapper {
  DeckModel call({required Deck entity}) {
    return DeckModel(
      id: entity.id,
      name: entity.name,
      created: entity.createdDateTime,
      lastEdited: entity.lastEditedDateTime,
      authorName: entity.authorName,
      description: entity.description,
      iconSymbolId: mapToIconSymbolId(symbol: entity.iconSpec.symbol),
      iconColorId: mapToIconColorId(color: entity.iconSpec.color),
    );
  }

  int mapToIconSymbolId({required DeckIconSymbol symbol}) {
    return IconSymbolConstants.values
        .firstWhere((metadata) => metadata.symbol == symbol)
        .id;
  }

  int mapToIconColorId({required DeckIconColor color}) {
    return LookupAndMapperConstants.iconColorMapping.entries
        .firstWhere((entry) => entry.value == color)
        .key;
  }
}
