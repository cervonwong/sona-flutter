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

import '../../../../../../utils/nullable.dart';
import '../entry_field_type.dart';
import 'entry_field_datum.dart';

@immutable
class TextEntryFieldDatum extends EntryFieldDatum with EquatableMixin {
  final String rawText; // Nullable!

  TextEntryFieldDatum({
    @required this.rawText,
  }) : super(type: EntryFieldType.text);

  TextEntryFieldDatum copyWith({
    Nullable<String> rawText,
  }) {
    return TextEntryFieldDatum(
      rawText: rawText == null ? this.rawText : rawText.value,
    );
  }

  @override
  List<Object> get props => [rawText];
}
