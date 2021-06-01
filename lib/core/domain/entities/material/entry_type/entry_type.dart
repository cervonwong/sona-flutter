// @dart=2.9

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
        assert(_checkCardFormatsDuplicate(cardFormats)),
        assert(fieldSpecs != null),
        assert(fieldSpecs.isNotEmpty),
        assert(!fieldSpecs.contains(null)),
        assert(_checkFieldSpecsDuplicate(fieldSpecs)),
        _cardFormats = cardFormats.toList(),
        _fieldSpecs = fieldSpecs.toList();

  static bool _checkCardFormatsDuplicate(List<CardFormat> cardFormats) {
    for (var cardFormat in cardFormats) {
      if (cardFormats.where((cf) => cf.id == cardFormat.id).length > 1) {
        return false;
      }
    }

    return true;
  }

  static bool _checkFieldSpecsDuplicate(List<EntryFieldSpec> fieldSpecs) {
    for (var fieldSpec in fieldSpecs) {
      if (fieldSpecs.where((fs) => fs.id == fieldSpec.id).length > 1) {
        return false;
      }
    }

    return true;
  }

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

  /// Creates an [EntryType] with an inserted [CardFormat].
  ///
  /// This method inserts [cardFormat] at the position specified by [index]. For
  /// example, if [index] is `3`, [component] will be the fourth item in
  /// [cardFormats] of the created [EntryType] (index 3 in the list). If [index]
  /// is not specified, [cardFormat] is inserted to the end of [cardFormats].
  EntryType insertCardFormat({
    @required CardFormat cardFormat,
    int index,
  }) {
    assert(cardFormat != null);
    if (index != null) assert(index >= 0 && index <= _cardFormats.length);

    // Checks that there does not exist a CardFormat with equal id. (Redundant!)
    assert(!_cardFormats.any((cf) => cf.id == cardFormat.id));

    final newCardFormats = _cardFormats.toList()
      ..insert(index ?? _cardFormats.length, cardFormat);

    return EntryType(
      id: id,
      name: name,
      cardFormats: newCardFormats,
      fieldSpecs: _fieldSpecs,
    );
  }

  EntryType updateCardFormat({
    @required CardFormat newCardFormat,
  }) {
    assert(newCardFormat != null);

    final index = _cardFormats.indexWhere(
      (cf) => cf.id == newCardFormat.id,
    );
    assert(index != -1); // Checks that there is a CardFormat with equal id.

    final newCardFormats = _cardFormats.toList()..[index] = newCardFormat;

    return EntryType(
      id: id,
      name: name,
      cardFormats: newCardFormats,
      fieldSpecs: _fieldSpecs,
    );
  }

  EntryType removeCardFormat({
    @required CardFormat cardFormat,
  }) {
    assert(cardFormat != null);

    final index = _cardFormats.indexWhere(
      (cf) => cf.id == cardFormat.id,
    );
    assert(index != -1); // Checks that there is a CardFormat with equal id.

    final newCardFormats = _cardFormats.toList()..removeAt(index);

    return EntryType(
      id: id,
      name: name,
      cardFormats: newCardFormats,
      fieldSpecs: _fieldSpecs,
    );
  }

  /// Creates an [EntryType] with an inserted [EntryFieldSpec].
  ///
  /// This method inserts [fieldSpec] at the position specified by [index]. For
  /// example, if [index] is `3`, [fieldSpec] will be the fourth item in
  /// [fieldSpecs] of the created [EntryType] (index 3 in the list). If [index]
  /// is not specified, [fieldSpec] is inserted to the end of [fieldSpecs].
  EntryType insertFieldSpec({
    @required EntryFieldSpec fieldSpec,
    int index,
  }) {
    assert(fieldSpec != null);
    if (index != null) assert(index >= 0 && index <= _fieldSpecs.length);

    // Checks that there does not exist an EntryFieldSpec with equal id.
    // (Redundant!)
    assert(!_fieldSpecs.any((fs) => fs.id == fieldSpec.id));

    final newFieldSpecs = _fieldSpecs.toList()
      ..insert(index ?? _fieldSpecs.length, fieldSpec);

    return EntryType(
      id: id,
      name: name,
      cardFormats: _cardFormats,
      fieldSpecs: newFieldSpecs,
    );
  }

  EntryType updateFieldSpec({
    @required EntryFieldSpec newFieldSpec,
  }) {
    assert(newFieldSpec != null);

    final index = _fieldSpecs.indexWhere(
      (fs) => fs.id == newFieldSpec.id,
    );
    // Checks that there is an EntryFieldSpec with equal id.
    assert(index != -1);

    final newFieldSpecs = _fieldSpecs.toList()..[index] = newFieldSpec;

    return EntryType(
      id: id,
      name: name,
      cardFormats: _cardFormats,
      fieldSpecs: newFieldSpecs,
    );
  }

  EntryType removeFieldSpec({
    @required EntryFieldSpec fieldSpec,
  }) {
    assert(fieldSpec != null);

    final index = _fieldSpecs.indexWhere(
      (fs) => fs.id == fieldSpec.id,
    );
    // Checks that there is an EntryFieldSpec with equal id.
    assert(index != -1);

    final newFieldSpecs = _fieldSpecs.toList()..removeAt(index);

    return EntryType(
      id: id,
      name: name,
      cardFormats: _cardFormats,
      fieldSpecs: newFieldSpecs,
    );
  }

  @override
  List<Object> get props => [id];
}
