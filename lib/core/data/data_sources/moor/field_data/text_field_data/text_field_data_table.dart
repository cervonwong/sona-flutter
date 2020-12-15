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

@DataClassName('TextFieldDatumModel')
class TextFieldData extends Table {
  IntColumn get entryId => integer()();

  IntColumn get fieldSpecId => integer()();

  TextColumn get rawText => text()();

  @override
  List<String> get customConstraints => [
        // Creates a composite foreign key constraint.
        // See https://sqlite.org/foreignkeys.html#fk_composite.
        'FOREIGN KEY(entryId, fieldSpecId) '
            'REFERENCES field_data(entryId, fieldSpecId)',
      ];

  @override
  Set<Column> get primaryKey => {entryId, fieldSpecId};
}
