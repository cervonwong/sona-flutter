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

import '../../../../core/domain/entities/material/entry/entry.dart';
import '../entities/entry_type.dart';

abstract class EntryTypeRepository {
  // COUNT

  Future<int> getCount();

  // NAVIGABLE ACCESSORS

  Future<EntryType> getByCard();

  Future<List<Entry>> getEntries(EntryType entryType);

  // CRUD

  Future<List<EntryType>> getAll();

  Future<EntryType> create();

  // TODO(cervonwong): 13/11/2020 This will require communication with Card and
  //  Entry data sources to prevent invalid states.
  Future<void> update(EntryType entryType);

  // TODO(cervonwong): 13/11/2020 This will require communication with Card and
  //  Entry data sources to prevent invalid states.
  Future<void> delete(EntryType entryType);
}
