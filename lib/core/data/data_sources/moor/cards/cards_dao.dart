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
import 'cards_table.dart';

part 'cards_dao.g.dart';

abstract class CardsDao {
  Future<CardModel> create({@required int entryId, @required int position});

  Future<CardModel> getSingle({@required int entryId, @required int position});

  Future<List<CardModel>> getAll();

  Future<CardModel> edit({@required CardModel newCard});

  Future<CardModel> remove({@required int entryId, @required int position});
}

@UseDao(tables: [Cards])
class CardsDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$CardsDaoImplMixin
    implements CardsDao {
  CardsDaoImpl({@required MoorDatabase db}) : super(db);

  @override
  Future<CardModel> create({@required int entryId, @required int position}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<CardModel> edit({@required CardModel newCard}) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<List<CardModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CardModel> getSingle({@required int entryId, @required int position}) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  @override
  Future<CardModel> remove({@required int entryId, @required int position}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
