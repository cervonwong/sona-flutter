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
import 'package:moor/moor.dart';

import '../moor_database.dart';
import 'entries_table.dart';

part 'entries_dao.g.dart';

abstract class EntriesDao {
  Future<EntryModel> create({@required int deckId, @required int entryTypeId});

  Future<EntryModel> getSingle({@required int id});

  Future<List<EntryModel>> getAll();

  Future<EntryModel> edit({@required EntryModel newEntry});

  Future<EntryModel> remove({@required int id});
}

@UseDao(tables: [Entries])
class EntriesDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$EntriesDaoImplMixin
    implements EntriesDao {
  EntriesDaoImpl({@required MoorDatabase db}) : super(db);

  @override
  Future<EntryModel> create({@required int deckId, @required int entryTypeId}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<EntryModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<EntryModel> getSingle({@required int id}) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<EntryModel> edit({@required EntryModel newEntry}) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<EntryModel> remove({@required int id}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
