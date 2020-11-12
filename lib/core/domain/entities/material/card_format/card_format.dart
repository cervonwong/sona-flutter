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

import 'card_format_structure.dart';

/// The format defining how a card is rendered when reviewing.
///
/// The format of a card defines the:
/// * structures of components, defining the relative positions and
/// relationships between them.
/// * styles of components, defining how each component looks when rendered.
///
/// This defines two different structures of a card: the front and the back.
@immutable
class CardFormat extends Equatable {
  final String name;
  final CardFormatStructure front;
  final CardFormatStructure back;

  CardFormat({
    @required this.name,
    this.front = const CardFormatStructure.empty(),
    this.back = const CardFormatStructure.empty(),
  })  : assert(name != null),
        assert(front != null),
        assert(back != null),
        assert(name.length <= 150);

  CardFormat copyWith({
    String name,
    CardFormatStructure front,
    CardFormatStructure back,
  }) {
    return CardFormat(
      name: name ?? this.name,
      front: front ?? this.front,
      back: back ?? this.back,
    );
  }

  @override
  List<Object> get props => [name, front, back];
}
