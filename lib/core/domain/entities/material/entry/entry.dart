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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../entry_type/entry_field/datum/entry_field_datum.dart';
import '../entry_type/entry_field/entry_field_spec.dart';
import 'entry_tag.dart';

@immutable
class Entry extends Equatable {
  final int id;
  final Set<EntryTag> _tags;
  final Map<EntryFieldSpec, EntryFieldDatum> _fieldData;

  Set<EntryTag> get tags => _tags.toSet();

  Map<EntryFieldSpec, EntryFieldDatum> get fieldData => Map.of(_fieldData);

  Entry({
    @required this.id,
    @required Set<EntryTag> tags,
    @required Map<EntryFieldSpec, EntryFieldDatum> fieldData,
  })  : assert(id != null),
        assert(tags != null),
        assert(!tags.contains(null)),
        assert(fieldData != null),
        assert(fieldData.isNotEmpty),
        assert(!fieldData.containsKey(null)),
        assert(!fieldData.containsValue(null)),
        assert(_checkFieldDataType(fieldData)),
        _tags = tags.toSet(),
        _fieldData = Map.of(fieldData);

  static bool _checkFieldDataType(
    Map<EntryFieldSpec, EntryFieldDatum> fieldData,
  ) {
    for (var mapEntry in fieldData.entries) {
      if (mapEntry.key.type != mapEntry.value.type) {
        return false;
      }
    }
    return true;
  }

  Entry copyWith({
    Set<EntryTag> tags,
    Map<EntryFieldSpec, EntryFieldDatum> fieldData,
  }) {
    return Entry(
      id: id,
      tags: tags ?? _tags,
      fieldData: fieldData ?? _fieldData,
    );
  }

  @override
  List<Object> get props => [id];
}
