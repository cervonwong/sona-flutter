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

import '../../../../constants/material_constants.dart';
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
  Future<CardModel> create({
    @required int entryId,
    @required int position,
  }) async {
    assert(entryId != null);
    assert(position != null);
    assert((await getSingle(entryId: entryId, position: position)) == null);

    await into(cards).insert(
      CardsCompanion.insert(
        entryId: entryId,
        position: position,
        starred: kDefaultCardStarred,
        hidden: kDefaultCardHidden,
      ),
    );
    return getSingle(entryId: entryId, position: position);
  }

  @override
  Future<CardModel> getSingle({
    @required int entryId,
    @required int position,
  }) async {
    assert(entryId != null);
    assert(position != null);

    return (select(cards)
          ..where(
            (card) =>
                card.entryId.equals(entryId) & card.position.equals(position),
          ))
        .getSingle();
  }

  @override
  Future<List<CardModel>> getAll() async => (select(cards)).get();

  @override
  Future<CardModel> edit({@required CardModel newCard}) async {
    assert(newCard != null);
    assert((await getSingle(
          entryId: newCard.entryId,
          position: newCard.position,
        )) !=
        null);

    await (update(cards)
          ..where((card) =>
              card.entryId.equals(newCard.entryId) &
              card.position.equals(newCard.position)))
        .write(
      CardsCompanion(
        entryId: Value(newCard.entryId),
        position: Value(newCard.position),
        starred: Value(newCard.starred),
        hidden: Value(newCard.hidden),
      ),
    );
    return getSingle(entryId: newCard.entryId, position: newCard.position);
  }

  @override
  Future<CardModel> remove({@required int entryId, @required int position}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
