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

import '../../../../domain/entities/material/card/card.dart';
import '../../../../domain/entities/material/deck/deck.dart';
import '../../../../domain/entities/material/entry/entry.dart';
import '../../../../domain/repositories/material/deck/deck_repository.dart';
import '../../../data_sources/moor/decks/decks_dao.dart';
import '../../../data_sources/moor/moor_database.dart';

class DeckRepositoryImpl extends DeckRepository {
  final DecksDao _decksDao;

  DeckRepositoryImpl({@required DecksDao decksDao}) : _decksDao = decksDao;

  // NAVIGABLE ACCESSORS

  @override
  Future<Deck> getByCard({@required Card card}) {
    // TODO: implement getByCard
    throw UnimplementedError();
  }

  @override
  Future<Deck> getByEntry({@required Entry entry}) {
    // TODO: implement getByEntry
    throw UnimplementedError();
  }

  // CRUD

  @override
  Future<Deck> create({@required String name}) async {
    final model = await _decksDao.create(name: name);

    return _toEntity(model);
  }

  @override
  Future<Deck> getById({@required int id}) async {
    final model = await _decksDao.getById(id: id);

    return model == null ? null : _toEntity(model);
  }

  @override
  Future<Deck> getByName({@required String name}) async {
    final model = await _decksDao.getByName(name: name);

    return model == null ? null : _toEntity(model);
  }

  @override
  Future<List<Deck>> getAll() async {
    final models = await _decksDao.getAll();

    return models.map(_toEntity).toList();
  }

  @override
  Future<void> update({@required Deck deck}) async {
    await _decksDao.edit(newDeck: _toModel(deck));
  }

  @override
  Future<void> delete({@required Deck deck}) async {
    await _decksDao.remove(id: deck.id);

    // TODO(cervonwong): 22/12/2020 Should also delete Cards, Entities, etc.
  }

  Deck _toEntity(DeckModel model) {
    return Deck(
      id: model.id,
      name: model.name,
      createdDateTime: model.created,
      lastEditedDateTime: model.lastEdited,
      authorName: model.authorName,
      description: model.description,
    );
  }

  DeckModel _toModel(Deck deck) {
    return DeckModel(
      id: deck.id,
      name: deck.name,
      created: deck.createdDateTime,
      lastEdited: deck.lastEditedDateTime,
      authorName: deck.authorName,
      description: deck.description,
    );
  }
}
