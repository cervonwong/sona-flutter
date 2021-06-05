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

import 'package:flutter_test/flutter_test.dart';

import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/repositories/material/entry/entry_tag_model_to_entity_mapper.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';

void main() {
  test(
    'EntryTagModelToEntityMapper when passed legal TagModel, '
    'should return expected mapped EntryTag',
    () {
      final EntryTag? tag = EntryTagModelToEntityMapper()(
        model: TagModel(
          id: 1,
          name: 'Hello',
        ),
      );

      expect(
        tag,
        EntryTag(
          id: 1,
          name: 'Hello',
        ),
      );
    },
  );
}
