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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'entry_field_type.dart';

/// A class specifying a field in an EntryType.
///
/// This class does not contain field data of an Entry. [id] ensures that when
/// a field is renamed, the data is preserved and migrated. [type] is not
/// included in [copyWith] as the [EntryFieldDatum] classes is not interoperable
/// with each other. Create a new field if a field with a different type is
/// required.
@immutable
class EntryFieldSpec extends Equatable {
  final int id;
  final EntryFieldType type;
  final String name;

  EntryFieldSpec({
    @required this.id,
    @required this.type,
    @required this.name,
  })  : assert(id != null),
        assert(name != null),
        assert(type != null);

  EntryFieldSpec copyWith({
    String name,
  }) {
    return EntryFieldSpec(
      id: id,
      type: type,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id];
}
