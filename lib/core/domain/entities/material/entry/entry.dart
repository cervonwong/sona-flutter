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

import '../entry_type/entry_field/entry_field_spec.dart';
import '../entry_type/entry_field/input/entry_field_input.dart';
import 'entry_tag.dart';

@immutable
class Entry extends Equatable {
  final int id;
  final Set<EntryTag> _tags;
  final Map<EntryFieldSpec, EntryFieldInput> _fieldInputs;

  Set<EntryTag> get tags => _tags.toSet();

  Map<EntryFieldSpec, EntryFieldInput> get fieldInputs => Map.of(_fieldInputs);

  Entry({
    required this.id,
    required Set<EntryTag> tags,
    required Map<EntryFieldSpec, EntryFieldInput> fieldInputs,
  })  : assert(fieldInputs.isNotEmpty),
        assert(_checkFieldInputsType(fieldInputs)),
        _tags = tags.toSet(),
        _fieldInputs = Map.of(fieldInputs);

  // TODO: 6/2/2021 Extract fieldInputs into a class to encapsulate checking logic.
  static bool _checkFieldInputsType(
    Map<EntryFieldSpec, EntryFieldInput> fieldInputs,
  ) {
    for (var mapEntry in fieldInputs.entries) {
      if (mapEntry.key.type != mapEntry.value.type) {
        return false;
      }
    }
    return true;
  }

  Entry copyWith({
    Set<EntryTag>? tags,
    Map<EntryFieldSpec, EntryFieldInput>? fieldInputs,
  }) {
    return Entry(
      id: id,
      tags: tags ?? _tags,
      fieldInputs: fieldInputs ?? _fieldInputs,
    );
  }

  @override
  List<Object> get props => [id];
}
