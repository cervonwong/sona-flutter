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

/// A data-class specifying a field in an EntryType. This class does not
/// contain field data of an Entry.
class EntryField extends Equatable {
  final String name;
  final EntryFieldType type;

  EntryField({
    @required this.name,
    @required this.type,
  })  : assert(name != null),
        assert(type != null);

  EntryField copyWith({
    String name,
    EntryFieldType type,
  }) {
    return EntryField(
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [name, type];
}

enum EntryFieldType { text, image }
