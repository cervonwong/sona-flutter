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

import 'entry_tag.dart';

@immutable
class Entry extends Equatable {
  final int id;
  final Set<EntryTag> tags;
  final Map<String, String> fieldData;

  Entry({
    @required this.id,
    @required Set<EntryTag> tags,
    @required Map<String, String> fieldData,
  })  : assert(id != null),
        assert(tags != null),
        assert(!tags.contains(null)),
        assert(fieldData != null),
        tags = tags.toSet(),
        fieldData = Map.of(fieldData);

  Entry copyWith({
    Set<EntryTag> tags,
    Map<String, String> fieldData,
  }) {
    return Entry(
      id: id,
      tags: tags ?? this.tags,
      fieldData: fieldData ?? this.fieldData,
    );
  }

  @override
  List<Object> get props => [id];
}
