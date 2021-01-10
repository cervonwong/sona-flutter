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

import 'package:meta/meta.dart';

import '../../entities/material/card/card.dart';
import '../../entities/material/entry/entry.dart';

abstract class EntryRepository {
  // COUNT

  // TODO(cervonwong): 12/11/2020 Add filter (stackable), sort, and sorting direction parameters.
  Future<int> getCount();

  // NAVIGABLE ACCESSOR

  Future<Entry> getByCard({@required Card card});

  // CRUD

  // TODO(cervonwong): 12/11/2020 Add filter (stackable), sort, and sorting direction parameters.
  Future<Entry> get({
    int offset = 0,
    @required int size,
  });

  Future<Entry> create();

  Future<void> update({@required Entry entry});

  Future<void> delete({@required Entry entry});
}
