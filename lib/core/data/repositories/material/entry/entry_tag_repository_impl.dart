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

import '../../../../domain/entities/material/entry/entry_tag.dart';
import '../../../../domain/repositories/material/entry/entry_tag_repsitory.dart';

class EntryTagRepositoryImpl implements EntryTagRepository {
  @override
  Future<EntryTag> create({@required String name}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<EntryTag> getById({@required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<EntryTag>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<EntryTag> update({@required EntryTag entryTag}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<EntryTag> delete({@required EntryTag entryTag}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
