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

import '../../../../utils/nullable.dart';
import '../entry/entry.dart';

class Deck extends Equatable {
  final int id;
  final String name;
  final List<Entry> entries;
  final DateTime createdDateTime;
  final DateTime lastEditedDateTime;
  final String authorName; // Nullable
  final String description; // Nullable

  Deck({
    @required this.id,
    @required this.name,
    @required this.entries,
    @required this.createdDateTime,
    @required this.lastEditedDateTime,
    this.authorName, // Default value is null.
    this.description, // Default value is null.
  })  : assert(id != null),
        assert(name != null),
        assert(entries != null),
        assert(createdDateTime != null),
        assert(lastEditedDateTime != null),
        assert(createdDateTime.isBefore(lastEditedDateTime) ||
            createdDateTime.isAtSameMomentAs(lastEditedDateTime)),
        assert(!entries.contains(null));

  Deck copyWith({
    String name,
    List<Entry> entries,
    DateTime lastEditedDateTime,
    Nullable<String> authorName,
    Nullable<String> description,
  }) {
    return Deck(
      id: id,
      name: name ?? this.name,
      entries: entries ?? this.entries,
      createdDateTime: createdDateTime,
      lastEditedDateTime: lastEditedDateTime ?? this.lastEditedDateTime,
      authorName: authorName == null ? this.authorName : authorName.value,
      description: description == null ? this.description : description.value,
    );
  }

  @override
  List<Object> get props => [id];
}
