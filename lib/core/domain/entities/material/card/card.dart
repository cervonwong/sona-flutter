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

@immutable
class Card extends Equatable {
  final CardId id;
  final bool isStarred;
  final bool isHidden;

  Card({
    required this.id,
    // TODO: 6/5/2021 Make all properties required.
    this.isStarred = false,
    this.isHidden = false,
  });

  Card copyWith({
    bool? isStarred,
    bool? isHidden,
  }) {
    return Card(
      id: id,
      isStarred: isStarred ?? this.isStarred,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  @override
  List<Object> get props => [id];
}

@immutable
class CardId extends Equatable {
  final int entryId;
  final int position;

  CardId({
    required this.entryId,
    required this.position,
  });

  @override
  List<Object> get props => [entryId, position];
}
