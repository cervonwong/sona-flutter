// @dart=2.9

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

import 'package:meta/meta.dart';

import '../../../../domain/domain_exceptions.dart';
import '../../../../domain/entities/material/card/card.dart';
import '../../../../domain/entities/material/deck/deck.dart';
import '../../../../domain/entities/material/entry/entry.dart';
import '../../../../domain/repositories/material/deck/deck_repository.dart';
import '../../../data_sources/moor/cards/cards_dao.dart';
import '../../../data_sources/moor/decks/decks_dao.dart';
import '../../../data_sources/moor/entries/entries_dao.dart';
import 'deck_entity_to_model_mapper.dart';
import 'deck_model_to_entity_mapper.dart';

class DeckRepositoryImpl extends DeckRepository {
  final DecksDao _decksDao;
  final EntriesDao _entriesDao;
  final CardsDao _cardsDao;
  final DeckModelToEntityMapper _toEntity;
  final DeckEntityToModelMapper _toModel;

  DeckRepositoryImpl({
    @required DecksDao decksDao,
    @required EntriesDao entriesDao,
    @required CardsDao cardsDao,
    @required DeckModelToEntityMapper toEntity,
    @required DeckEntityToModelMapper toModel,
  })  : _decksDao = decksDao,
        _entriesDao = entriesDao,
        _cardsDao = cardsDao,
        _toEntity = toEntity,
        _toModel = toModel;

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

  // TODO(cervonwong): 08/01/2021 Use database transactions for multiple DAO
  //  calls.
  @override
  Future<Deck> getByEntry({@required Entry entry}) async {
    assert(entry != null);

    final entryModel = await _entriesDao.getSingle(id: entry.id);
    if (entryModel == null) {
      throw EntityNotFoundException(
        'Tried to get the Deck of an Entry, '
        'but the Entry does not exist in the data source. '
        'This is probably due to the Entry\'s in the app\'s state '
        'not being synced with the data source when deleting Entry\'s.',
      );
    }

    final deckModel = await _decksDao.getById(id: entryModel.deckId);
    if (deckModel == null) {
      throw EntityNavigationException(
        'Tried to get the Deck of an Entry '
        'but the Deck does not exist in the data source. '
        'This is probably due to errors when linking Entry\'s and Decks '
        'upon creation or deletion of them.',
      );
    }

    return _toEntity(model: deckModel);
  }

  // TODO(cervonwong): 08/01/2021 Use database transactions for multiple DAO
  //  calls.
  @override
  Future<Deck> getByCard({@required Card card}) async {
    assert(card != null);

    final cardModel = await _cardsDao.getSingle(
      entryId: card.id.entryId,
      position: card.id.position,
    );
    if (cardModel == null) {
      throw EntityNotFoundException(
        'Tried to get the Deck of a Card, '
        'but the Card does not exist in the data source. '
        'This is probably due to the Card\'s in the app\'s state '
        'not being synced with the data source when deleting Card\'s.',
      );
    }

    final entryModel = await _entriesDao.getSingle(id: cardModel.entryId);
    if (entryModel == null) {
      throw EntityNavigationException(
        'Tried to get the Deck of a Card '
        'but the Entry of the Card does not exist in the data source. '
        'This is probably due to errors when linking Cards and Entry\'s '
        'upon creation or deletion of them.',
      );
    }

    final deckModel = await _decksDao.getById(id: entryModel.deckId);
    if (deckModel == null) {
      throw EntityNavigationException(
        'Tried to get the Deck of a Card '
        'but the Deck does not exist in the data source. '
        'This is probably due to errors when linking Cards and Decks '
        'upon creation or deletion of them.',
      );
    }

    return _toEntity(model: deckModel);
  }

  @override
  Future<void> update({@required Deck deck}) async {
    await _decksDao.edit(newDeck: _toModel(deck: deck));
  }

  // TODO(cervonwong): 08/01/2021 Use database transactions for multiple DAO
  //  calls.
  @override
  Future<void> delete({@required Deck deck}) async {
    // Delete deck in DecksDao.
    await _decksDao.remove(id: deck.id);

    // Delete all entries in EntriesDao belonging to deleted deck.
    final entryModels = await _entriesDao.getAll(deckId: deck.id);
    await _entriesDao.removeAll(entryList: entryModels);

    // Delete all cards in CardsDao belonging to deleted entries.
    final entryIds = entryModels.map((model) => model.id).toSet();
    final cardModels = await _cardsDao.getAll(entryIds: entryIds);
    await _cardsDao.removeAll(cardList: cardModels);
  }
}
