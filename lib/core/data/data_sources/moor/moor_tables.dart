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

import 'card_formats/card_formats_table.dart';
import 'cards/cards_table.dart';
import 'components/components_table.dart';
import 'decks/decks_table.dart';
import 'entries/entries_table.dart';
import 'entries_tags/entries_tags_table.dart';
import 'entry_types/entry_types_table.dart';
import 'field_data/field_data_table.dart';
import 'field_data/image_field_data/image_field_data_table.dart';
import 'field_data/text_field_data/text_field_data_table.dart';
import 'field_specs/field_specs_table.dart';
import 'field_types/field_types_table.dart';
import 'structures/structures_table.dart';
import 'tags/tags_table.dart';

export 'card_formats/card_formats_table.dart';
export 'cards/cards_table.dart';
export 'components/components_table.dart';
export 'decks/decks_table.dart';
export 'entries/entries_table.dart';
export 'entries_tags/entries_tags_table.dart';
export 'entry_types/entry_types_table.dart';
export 'field_data/field_data_table.dart';
export 'field_data/image_field_data/image_field_data_table.dart';
export 'field_data/text_field_data/text_field_data_table.dart';
export 'field_specs/field_specs_table.dart';
export 'field_types/field_types_table.dart';
export 'structures/structures_table.dart';
export 'tags/tags_table.dart';

const List<Type> kTables = [
  Cards,
  CardFormats,
  Components,
  Decks,
  Entries,
  EntriesTags,
  EntryTypes,
  FieldData,
  FieldSpecs,
  FieldTypes,
  ImageFieldData,
  Structures,
  Tags,
  TextFieldData,
];
