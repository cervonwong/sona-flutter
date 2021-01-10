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

@DataClassName('FieldDatumModel')
class FieldData extends Table {
  IntColumn get entryId => integer().customConstraint(
        'NOT NULL REFERENCES entries(id)',
      )();

  IntColumn get fieldSpecId => integer().customConstraint(
        'NOT NULL REFERENCES field_specs(id)',
      )();

  // TODO(cervonwong): 15/12/2020 Check that the fieldSpec of fieldSpecId is
  //  contained within the entry of entryId's entryType of entryTypeId's
  //  fieldSpecs from their entryTypeIds.

  @override
  Set<Column> get primaryKey => {entryId, fieldSpecId};
}
