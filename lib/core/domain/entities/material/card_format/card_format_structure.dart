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

import 'package:meta/meta.dart';

import 'components/component.dart';

class CardFormatStructure {
  final List<Component> _components;

  List<Component> get components => List<Component>.from(_components);

  const CardFormatStructure.empty() : _components = const [];

  CardFormatStructure({@required List<Component> components})
      : assert(components != null),
        assert(!components.contains(null)),
        _components = List<Component>.from(components);

  /// Creates a [CardFormatStructure] with an inserted component.
  ///
  /// This method inserts [component] at the position specified by [index]. For
  /// example, if [index] is `3`, [component] will be the fourth component in
  /// the component list (index 3 in a list), If [index] is not specified, it is
  /// inserted to the end of the component list.
  CardFormatStructure insert({
    @required Component component,
    int index,
  }) {
    assert(component != null);
    if (index != null) assert(index >= 0 && index <= _components.length);

    final newComponents = List<Component>.from(_components);
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

    final newComponents = List<Component>.from(_components);
    newComponents[index] = component;

    return CardFormatStructure(components: newComponents);
  }

  CardFormatStructure remove({@required int index}) {
    assert(index != null);
    assert(index >= 0 && index < _components.length);

    final newComponents = List<Component>.from(_components);
    newComponents.removeAt(index);

    return CardFormatStructure(components: newComponents);
  }
}
