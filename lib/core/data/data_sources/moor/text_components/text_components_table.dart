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

@DataClassName('TextComponentModel')
class TextComponents extends Table {
  IntColumn get structureId => integer()();

  IntColumn get position => integer()();

  TextColumn get data => text()();

  RealColumn get size => real()();

  IntColumn get alignmentId => integer().customConstraint(
        'NOT NULL REFERENCES alignments(id)',
      )();

  IntColumn get fillColorId => integer().customConstraint(
        'NOT NULL REFERENCES fill_colors(id)',
      )();

  IntColumn get highlightColorId => integer().customConstraint(
        'NOT NULL REFERENCES highlight_colors(id)',
      )();

  BoolColumn get bold => boolean()();

  BoolColumn get italic => boolean()();

  BoolColumn get underlined => boolean()();

  @override
  List<String> get customConstraints => [
        // Creates a composite foreign key constraint.
        // See https://sqlite.org/foreignkeys.html#fk_composite.
        'FOREIGN KEY(structure_id, position) '
            'REFERENCES components(structure_id, position)',
      ];

  @override
  Set<Column> get primaryKey => {structureId, position};
}
