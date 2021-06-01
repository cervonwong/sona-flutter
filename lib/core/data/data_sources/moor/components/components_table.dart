// @dart=2.9

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

import 'package:moor/moor.dart';

@DataClassName('ComponentModel')
class Components extends Table {
  IntColumn get structureId => integer().customConstraint(
        'NOT NULL REFERENCES structures(id)',
      )();

  IntColumn get position => integer().customConstraint('NOT NULL UNIQUE')();

  IntColumn get componentTypeId => integer().customConstraint(
        'NOT NULL REFERENCES component_types(id)',
      )();

  TextColumn get name => text()();

  @override
  List<String> get customConstraints => [
        // Creates a unique constraint on multiple columns.
        // See https://sqlite.org/lang_createtable.html#unique_constraints.
        'UNIQUE(structure_id, name)',
      ];

  @override
  Set<Column> get primaryKey => {structureId, position};
}
