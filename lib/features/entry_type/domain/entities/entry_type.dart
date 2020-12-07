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
import 'entry_field.dart';

@immutable
class EntryType extends Equatable {
  final int id;
  final String name;
  final List<CardFormat> cardFormats;
  final List<EntryField> fields;

  EntryType({
    @required this.id,
    @required this.name,
    @required List<CardFormat> cardFormats,
    @required List<EntryField> fields,
  })  : assert(id != null),
        assert(name != null),
        assert(cardFormats != null),
        assert(!cardFormats.contains(null)),
        assert(fields != null),
        assert(!fields.contains(null)),
        cardFormats = cardFormats.toList(),
        fields = fields.toList();

  @override
  List<Object> get props => [id];
}
