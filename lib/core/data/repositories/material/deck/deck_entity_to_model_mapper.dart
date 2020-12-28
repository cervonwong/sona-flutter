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

import 'package:meta/meta.dart';

import '../../../../domain/entities/material/deck/deck.dart';
import '../../../data_sources/moor/moor_database.dart';

class DeckEntityToModelMapper {
  DeckModel call({@required Deck deck}) {
    if (deck == null) return null;

    return DeckModel(
      id: deck.id,
      name: deck.name,
      created: deck.createdDateTime,
      lastEdited: deck.lastEditedDateTime,
      authorName: deck.authorName,
      description: deck.description,
    );
  }
}
