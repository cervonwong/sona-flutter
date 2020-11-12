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

@immutable
class Entry extends Equatable {
  final int id;
  final String deckName;
  final int entryTypeId;
  final Set<String> tags;
  final Map<String, String> fieldData;

  Entry({
    @required this.id,
    @required this.deckName,
    @required this.entryTypeId,
    this.tags = const <String>{},
    this.fieldData = const <String, String>{},
  })  : assert(id != null),
        assert(deckName != null),
        assert(entryTypeId != null),
        assert(tags != null),
        assert(fieldData != null);

  Entry copyWith({
    Set<String> tags,
    Map<String, String> fieldData,
  }) {
    return Entry(
      id: id,
      deckName: deckName,
      entryTypeId: entryTypeId,
      tags: tags ?? this.tags,
      fieldData: fieldData ?? this.fieldData,
    );
  }

  @override
  List<Object> get props => [id, deckName];
}
