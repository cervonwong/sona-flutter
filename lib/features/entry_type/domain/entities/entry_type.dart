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

import 'card_format.dart';
import 'entry_field/entry_field_spec.dart';

@immutable
class EntryType extends Equatable {
  final int id;
  final String name;
  final List<CardFormat> _cardFormats;
  final List<EntryFieldSpec> _fieldSpecs;

  List<CardFormat> get cardFormats => _cardFormats.toList();

  List<EntryFieldSpec> get fieldSpecs => _fieldSpecs.toList();

  EntryType({
    @required this.id,
    @required this.name,
    @required List<CardFormat> cardFormats,
    @required List<EntryFieldSpec> fieldSpecs,
  })  : assert(id != null),
        assert(name != null),
        assert(cardFormats != null),
        assert(cardFormats.isNotEmpty),
        assert(!cardFormats.contains(null)),
        assert(fieldSpecs != null),
        assert(fieldSpecs.isNotEmpty),
        assert(!fieldSpecs.contains(null)),
        _cardFormats = cardFormats.toList(),
        _fieldSpecs = fieldSpecs.toList();

  EntryType copyWith({
    String name,
  }) {
    return EntryType(
      id: id,
      name: name ?? this.name,
      cardFormats: _cardFormats,
      fieldSpecs: _fieldSpecs,
    );
  }

  @override
  List<Object> get props => [id];
}
