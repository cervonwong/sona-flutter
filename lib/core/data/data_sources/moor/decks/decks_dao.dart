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

import 'package:moor/moor.dart';

import '../moor_database.dart';
import 'decks_table.dart';

part 'decks_dao.g.dart';

abstract class DecksDao {
  Future<DeckModel> create({@required String name});

  Future<DeckModel> getById({@required int id});

  Future<List<DeckModel>> getAll();

  Future<DeckModel> edit({@required DeckModel deck});

  Future<DeckModel> remove({@required int id});
}

@UseDao(tables: [Decks])
class DecksDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$DecksDaoImplMixin
    implements DecksDao {
  DecksDaoImpl(MoorDatabase db) : super(db);

  @override
  Future<DeckModel> create({@required String name}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<DeckModel> getById({@required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<DeckModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  ///
  ///
  /// This method is not named `update` because of naming conflicts.
  @override
  Future<DeckModel> edit({@required DeckModel deck}) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  ///
  ///
  /// This method is not named `delete` because of naming conflicts.
  @override
  Future<DeckModel> remove({@required int id}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
