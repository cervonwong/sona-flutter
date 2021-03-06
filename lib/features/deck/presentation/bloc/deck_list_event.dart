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

part of 'deck_list_bloc.dart';

// TODO: 6/13/2021 Rename all to imperative verbs?

abstract class DeckListEvent extends Equatable {
  const DeckListEvent();

  @override
  List<Object> get props => [];
}

/// Tells the BloC that it needs to load the list of decks.
///
/// This is immediately added to the BLoC when created to request the latest
/// decks.
class DeckListInitialized extends DeckListEvent {}

/// Tells the BloC that it needs to create a new deck with this name to the list
/// of decks.
class DeckCreated extends DeckListEvent {
  final String name;

  const DeckCreated({required this.name});

  @override
  List<Object> get props => [name];
}

/// Tells the BloC that it needs to delete an existing deck.
class DeckDeleted extends DeckListEvent {
  final Deck deck;

  const DeckDeleted({required this.deck});

  @override
  List<Object> get props => [deck];
}
