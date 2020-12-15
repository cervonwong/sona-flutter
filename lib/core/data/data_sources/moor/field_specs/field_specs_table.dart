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

import 'package:moor/moor.dart';

@DataClassName('FieldSpecModel')
class FieldSpecs extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get fieldTypeId => integer().customConstraint(
        'NOT NULL REFERENCES field_types(id)',
      )();

  IntColumn get entryTypeId => integer().customConstraint(
        'NOT NULL REFERENCES entry_types(id)',
      )();

  TextColumn get name => text()();

  @override
  List<String> get customConstraints => [
        // Creates a unique constraint on multiple columns.
        // See https://sqlite.org/lang_createtable.html#unique_constraints.
        'UNIQUE(entry_type_id, name)',
      ];
}
