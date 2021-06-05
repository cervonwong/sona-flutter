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

import '../../entities/material/card/card.dart';

// You can neither create nor delete Cards. Treat Cards as a composition of an
// Entry, whereby the lifecycle, including the generation, disposal, and
// restructuring of Cards depends on corresponding changes of the Card's Entry.
abstract class CardRepository {
  // COUNT

  // TODO(cervonwong): 12/11/2020 Add filter (stackable), sort, and sorting direction parameters.
  Future<int> getCount();

  // CRUD

  // TODO(cervonwong): 12/11/2020 Add filter (stackable), sort, and sorting direction parameters.
  // TODO: 6/5/2021 Also add filter by deck, entry, etc.
  Future<List<Card>> get({
    int offset = 0,
    required int size,
  });

  Future<void> update(Card card);
}
