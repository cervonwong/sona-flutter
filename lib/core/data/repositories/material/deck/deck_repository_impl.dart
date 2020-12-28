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
import 'deck_entity_to_model_mapper.dart';
import 'deck_model_to_entity_mapper.dart';

class DeckRepositoryImpl extends DeckRepository {
  final DecksDao _decksDao;
  final DeckModelToEntityMapper _toEntity;
  final DeckEntityToModelMapper _toModel;

  DeckRepositoryImpl({
    @required DecksDao decksDao,
    @required DeckModelToEntityMapper toEntity,
    @required DeckEntityToModelMapper toModel,
  })  : _decksDao = decksDao,
        _toEntity = toEntity,
        _toModel = toModel;

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

    return _toEntity(model: model);
  }

  @override
  Future<Deck> getById({@required int id}) async {
    final model = await _decksDao.getById(id: id);

    return _toEntity(model: model);
  }

  @override
  Future<Deck> getByName({@required String name}) async {
    final model = await _decksDao.getByName(name: name);

    return _toEntity(model: model);
  }

  @override
  Future<List<Deck>> getAll() async {
    final models = await _decksDao.getAll();

    return models.map((model) => _toEntity(model: model)).toList();
  }

  @override
  Future<void> update({@required Deck deck}) async {
    await _decksDao.edit(newDeck: _toModel(deck: deck));
  }

  @override
  Future<void> delete({@required Deck deck}) async {
    await _decksDao.remove(id: deck.id);

    // TODO(cervonwong): 22/12/2020 Should also delete Cards, Entities, etc.
  }
}
