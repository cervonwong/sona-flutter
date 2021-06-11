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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/material/deck/deck.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/use_cases/create_deck.dart';
import '../../domain/use_cases/delete_deck.dart';
import '../../domain/use_cases/get_deck_list.dart';
import '../../domain/use_cases/validate_deck_name.dart';

part 'deck_list_event.dart';

part 'deck_list_state.dart';

class DeckListBloc extends Bloc<DeckListEvent, DeckListState> {
  final CreateDeck _createDeck;
  final GetDeckList _getDeckList;
  final DeleteDeck _deleteDeck;
  final ValidateDeckName _validateDeckName;

  // Updated when decks are updated or renamed
  late List<Deck> _decks;

  DeckListBloc({
    required CreateDeck createDeck,
    required GetDeckList getDeckList,
    required DeleteDeck deleteDeck,
    required ValidateDeckName validateDeckName,
  })  : _createDeck = createDeck,
        _getDeckList = getDeckList,
        _deleteDeck = deleteDeck,
        _validateDeckName = validateDeckName,
        super(DeckListInitial());

  @override
  Stream<DeckListState> mapEventToState(
    DeckListEvent event,
  ) async* {
    yield DeckListLoading();

    if (event is DeckListInitialized) {
      yield* _mapDeckListInitializedToState();
    } else if (event is DeckCreated) {
      yield* _mapDeckCreatedToState(event);
    } else if (event is DeckDeleted) {
      yield* _mapDeckDeletedToState(event);
    } else {
      throw UnimplementedError();
    }
  }

  Stream<DeckListState> _mapDeckListInitializedToState() async* {
    _decks = await _getDeckList();
    yield DeckListLoaded(decks: _decks);
  }

  Stream<DeckListState> _mapDeckCreatedToState(DeckCreated event) async* {
    final validationResult = await _validateDeckName(name: event.name);
    switch (validationResult) {
      case DeckNameValidationResult.valid:
        await _createDeck(name: event.name);
        _decks = await _getDeckList();
        yield DeckListLoaded(decks: _decks);
        break;
      case DeckNameValidationResult.nameIsEmpty:
        yield DeckNameIsEmpty();
        break;
      case DeckNameValidationResult.nameAlreadyExists:
        yield DeckNameAlreadyExists();
        break;
      case DeckNameValidationResult.nameIsMultiline:
        yield DeckNameIsMultiline();
        break;
    }
  }

  Stream<DeckListState> _mapDeckDeletedToState(DeckDeleted event) async* {
    await _deleteDeck(deck: event.deck);
    _decks.remove(event.deck);
    yield DeckListLoaded(decks: _decks);
  }
}
