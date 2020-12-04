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

import 'components/component.dart';

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

@immutable
class CardFormatStructure extends Equatable {
  final List<Component> _components;

  List<Component> get components => _components.toList();

  const CardFormatStructure.empty() : _components = const [];

  CardFormatStructure({@required List<Component> components})
      : assert(components != null),
        assert(!components.contains(null)),
        _components = components.toList();

  /// Creates a [CardFormatStructure] with an inserted component.
  ///
  /// This method inserts [component] at the position specified by [index]. For
  /// example, if [index] is `3`, [component] will b`e the fourth component in
  /// the component list (index 3 in a list), If [index] is not specified, it is
  /// inserted to the end of the component list.
  CardFormatStructure insert({
    @required Component component,
    int index,
  }) {
    assert(component != null);
    if (index != null) assert(index >= 0 && index <= _components.length);

    final newComponents = _components.toList();
    newComponents.insert(index ?? _components.length, component);

    return CardFormatStructure(components: newComponents);
  }

  CardFormatStructure update({
    @required Component component,
    @required int index,
  }) {
    assert(component != null);
    assert(index != null);
    assert(index >= 0 && index < _components.length);

    final newComponents = _components.toList();
    newComponents[index] = component;

    return CardFormatStructure(components: newComponents);
  }

  CardFormatStructure remove({@required int index}) {
    assert(index != null);
    assert(index >= 0 && index < _components.length);

    final newComponents = _components.toList();
    newComponents.removeAt(index);

    return CardFormatStructure(components: newComponents);
  }

  @override
  List<Object> get props => [_components];
}
