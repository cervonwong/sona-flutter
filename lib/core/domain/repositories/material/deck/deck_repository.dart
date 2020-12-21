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

import '../../../entities/material/card/card.dart';
import '../../../entities/material/deck/deck.dart';
import '../../../entities/material/entry/entry.dart';

abstract class DeckRepository {
  // COUNT

  Future<int> getCount();

  // NAVIGABLE ACCESSORS

  Future<Deck> getByCard({@required Card card});

  Future<Deck> getByEntry({@required Entry entry});

  // CRUD

  // TODO(cervonwong): 12/11/2020 Add filter (stackable), sort, and sorting direction parameters.
  Future<List<Deck>> get();

  Future<Deck> create();

  Future<void> update({@required Deck deck});

  Future<void> delete({@required Deck deck});
}
