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
import '../../../data_exceptions.dart';
import '../moor_database.dart';
import 'cards_table.dart';

part 'cards_dao.g.dart';

abstract class CardsDao {
  Future<CardModel> create({@required int entryId, @required int position});

  Future<CardModel> getSingle({@required int entryId, @required int position});

  Future<List<CardModel>> getAll({Set<int> entryIds});

  Future<void> edit({@required CardModel newCard});

  Future<void> remove({@required int entryId, @required int position});

  Future<void> removeAll({@required List<CardModel> cardList});
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
  Future<List<CardModel>> getAll({Set<int> entryIds}) async {
    final selectStatement = select(cards);

    if (entryIds != null) {
      selectStatement.where((card) => card.entryId.isIn(entryIds));
    }

    return selectStatement.get();
  }

  @override
  Future<void> edit({@required CardModel newCard}) async {
    assert(newCard != null);
    assert((await getSingle(
          entryId: newCard.entryId,
          position: newCard.position,
        )) !=
        null);

    await (update(cards)..whereSamePrimaryKey(newCard)).write(
      CardsCompanion(
        entryId: Value(newCard.entryId),
        position: Value(newCard.position),
        starred: Value(newCard.starred),
        hidden: Value(newCard.hidden),
      ),
    );
  }

  @override
  Future<void> remove({@required int entryId, @required int position}) async {
    assert(entryId != null);
    assert(position != null);

    final deletedCount = await (delete(cards)
          ..where(
            (card) =>
                card.entryId.equals(entryId) & card.position.equals(position),
          ))
        .go();
    assert(deletedCount == 1);
  }

  @override
  Future<void> removeAll({@required List<CardModel> cardList}) async {
    assert(cardList != null);
    assert(!cardList.contains(null));

    // Checks that all cards in cardList exist.
    await transaction(
      () async {
        for (final card in cardList) {
          final result =
              await (select(cards)..whereSamePrimaryKey(card)).getSingle();

          if (result == null) {
            throw ModelNotFoundException(
              'Tried to delete a list of CardModels, '
              'but one or more CardModels does not exist in the database. '
              'This is probably due to the app state not being synced with the '
              'database, '
              'resulting in a call with illegal arguments to this DAO.',
            );
          }
        }
      },
    );

    // Deletes them transactionally.
    await batch(
      (batch) {
        for (final card in cardList) {
          batch.delete(cards, card);
        }
      },
    );
  }
}
