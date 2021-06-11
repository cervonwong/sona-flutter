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

import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/icon_symbol_constants.dart';
import '../../../../core/domain/entities/material/deck/deck.dart';
import '../../../../core/domain/entities/material/deck/deck_icon_spec.dart';
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
  final IconSymbolConstants _iconSymbolConstants;

  // Updated when decks are updated or renamed
  late List<Deck> _decks;

  DeckListBloc({
    required CreateDeck createDeck,
    required GetDeckList getDeckList,
    required DeleteDeck deleteDeck,
    required ValidateDeckName validateDeckName,
    IconSymbolConstants iconSymbolConstants = const IconSymbolConstants(),
  })  : _createDeck = createDeck,
        _getDeckList = getDeckList,
        _deleteDeck = deleteDeck,
        _validateDeckName = validateDeckName,
        _iconSymbolConstants = iconSymbolConstants,
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
    yield DeckListLoaded(deckListViewModel: _mapToDeckListViewModel(_decks));
  }

  Stream<DeckListState> _mapDeckCreatedToState(DeckCreated event) async* {
    final validationResult = await _validateDeckName(name: event.name);
    switch (validationResult) {
      case DeckNameValidationResult.valid:
        await _createDeck(name: event.name);
        _decks = await _getDeckList();
        yield DeckListLoaded(
          deckListViewModel: _mapToDeckListViewModel(_decks),
        );
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
    yield DeckListLoaded(deckListViewModel: _mapToDeckListViewModel(_decks));
  }

  DeckListViewModel _mapToDeckListViewModel(List<Deck> decks) {
    return DeckListViewModel(
      items: decks
          .map(
            // TODO: 6/11/2021 Change these hard coded values in future.
            (deck) => DeckListViewModelItem(
              id: deck.id,
              name: deck.name,
              hasEntries: true,
              subtitle: '20 entries · 60/60 cards seen',
              dueText: '2 due',
              iconData: _iconSymbolConstants.values
                  .firstWhere(
                      (metadata) => metadata.symbol == deck.iconSpec.symbol)
                  .iconData,
              iconColor:
                  _mapToDeckListViewModelItemIconColor(deck.iconSpec.color),
              hasCompletedRevision: false,
              progressPercent: 0.80,
            ),
          )
          .toList(),
    );
  }

  // TODO: 6/11/2021 I could not figure out how to use a ColorNotifier singleton
  //  instance to listen to, and get a Color out. Do I need to send another
  //  DeckListLoaded state if theme changes? Anyways, I decided to create
  //  another enum which is exactly the same as DeckIconColor, but it is part of
  //  the ViewModel and not part of Entity.
  DeckListViewModelItemIconColor _mapToDeckListViewModelItemIconColor(
      DeckIconColor deckIconColor) {
    switch (deckIconColor) {
      case DeckIconColor.red:
        return DeckListViewModelItemIconColor.red;
      case DeckIconColor.orange:
        return DeckListViewModelItemIconColor.orange;
      case DeckIconColor.yellow:
        return DeckListViewModelItemIconColor.yellow;
      case DeckIconColor.lime:
        return DeckListViewModelItemIconColor.lime;
      case DeckIconColor.green:
        return DeckListViewModelItemIconColor.green;
      case DeckIconColor.teal:
        return DeckListViewModelItemIconColor.teal;
      case DeckIconColor.cyan:
        return DeckListViewModelItemIconColor.cyan;
      case DeckIconColor.sky:
        return DeckListViewModelItemIconColor.sky;
      case DeckIconColor.blue:
        return DeckListViewModelItemIconColor.blue;
      case DeckIconColor.purple:
        return DeckListViewModelItemIconColor.purple;
      case DeckIconColor.pink:
        return DeckListViewModelItemIconColor.pink;
    }
  }
}

enum DeckListViewModelItemIconColor {
  red,
  orange,
  yellow,
  lime,
  green,
  teal,
  cyan,
  sky,
  blue,
  purple,
  pink,
}

@immutable
class DeckListViewModel extends Equatable {
  final List<DeckListViewModelItem> _items;

  List<DeckListViewModelItem> get items => _items.toList();

  DeckListViewModel({required List<DeckListViewModelItem> items})
      : _items = items.toList();

  @override
  List<Object?> get props => [_items];
}

@immutable
class DeckListViewModelItem extends Equatable {
  final int id;
  final String name;
  final bool hasEntries;
  final String subtitle;
  final String dueText;
  final IconData iconData;
  final DeckListViewModelItemIconColor iconColor;
  final bool? hasCompletedRevision;
  final double? progressPercent;

  DeckListViewModelItem({
    required this.id,
    required this.name,
    required this.hasEntries,
    required this.subtitle,
    required this.dueText,
    required this.iconData,
    required this.iconColor,
    required this.hasCompletedRevision,
    required this.progressPercent,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        hasEntries,
        subtitle,
        dueText,
        iconData,
        iconColor,
        hasCompletedRevision,
        progressPercent,
      ];
}
