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

import '../../../../utils/nullable.dart';
import 'deck_icon_spec.dart';

@immutable
class Deck extends Equatable {
  final int id;
  final String name;
  final DateTime createdDateTime;
  final DateTime lastEditedDateTime;
  final String? authorName; // Nullable
  final String? description; // Nullable
  final DeckIconSpec iconSpec;

  Deck({
    required this.id,
    required this.name,
    required this.createdDateTime,
    required this.lastEditedDateTime,
    required this.authorName, // Default value is null from use case POV.
    required this.description, // Default value is null from use case POV.
    // Also see `DefaultArgConstants` for other similar default constants.
    required this.iconSpec,
  }) : assert(createdDateTime.isBefore(lastEditedDateTime) ||
            createdDateTime.isAtSameMomentAs(lastEditedDateTime));

  Deck copyWith({
    String? name,
    DateTime? lastEditedDateTime,
    Nullable<String>? authorName,
    Nullable<String>? description,
    DeckIconSpec? iconSpec,
  }) {
    return Deck(
      id: id,
      name: name ?? this.name,
      createdDateTime: createdDateTime,
      lastEditedDateTime: lastEditedDateTime ?? this.lastEditedDateTime,
      authorName: authorName == null ? this.authorName : authorName.value,
      description: description == null ? this.description : description.value,
      iconSpec: iconSpec ?? this.iconSpec,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        createdDateTime,
        lastEditedDateTime,
        authorName,
        description,
        iconSpec,
      ];
}
