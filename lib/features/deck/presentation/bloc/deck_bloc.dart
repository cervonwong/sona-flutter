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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/domain/entities/material/deck/deck.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/use_cases/create_deck.dart';
import '../../domain/use_cases/delete_deck.dart';
import '../../domain/use_cases/get_all_decks.dart';
import '../../domain/use_cases/validate_deck_name.dart';

part 'deck_event.dart';

part 'deck_state.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  final CreateDeck _createDeck;
  final GetAllDecks _getAllDecks;
  final DeleteDeck _deleteDeck;
  final ValidateDeckName _validateDeckName;

  // Updated when decks are updated or renamed
  List<Deck> _decks;

  DeckBloc({
    @required CreateDeck createDeck,
    @required GetAllDecks getAllDecks,
    @required DeleteDeck deleteDeck,
    @required ValidateDeckName validateDeckName,
  })  : _createDeck = createDeck,
        _getAllDecks = getAllDecks,
        _deleteDeck = deleteDeck,
        _validateDeckName = validateDeckName,
        super(DeckInitial());

  @override
  Stream<DeckState> mapEventToState(
    DeckEvent event,
  ) async* {
    yield DeckLoading();

    if (event is DeckInitialized) {
      yield* _mapDeckInitializedToState();
    } else if (event is DeckCreated) {
      yield* _mapDeckCreatedToState(event);
    } else if (event is DeckDeleted) {
      yield* _mapDeckDeletedToState(event);
    }

    // TODO: implement other events in mapEventToState
  }

  Stream<DeckState> _mapDeckInitializedToState() async* {
    _decks = await _getAllDecks();
    yield DeckLoaded(decks: _decks);
  }

  Stream<DeckState> _mapDeckCreatedToState(DeckCreated event) async* {
    final validationResult = await _validateDeckName(name: event.name);
    switch (validationResult) {
      case DeckNameValidationResult.valid:
        await _createDeck(name: event.name);
        _decks = await _getAllDecks();
        yield DeckLoaded(decks: _decks);
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

  Stream<DeckState> _mapDeckDeletedToState(DeckDeleted event) async* {
    await _deleteDeck(deck: event.deck);
    _decks.remove(event.deck);
    yield DeckLoaded(decks: _decks);
  }
}
