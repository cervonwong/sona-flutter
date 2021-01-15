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

part of 'deck_bloc.dart';

abstract class DeckEvent extends Equatable {
  const DeckEvent();

  @override
  List<Object> get props => [];
}

/// Tells the BloC that it needs to load the list of decks.
///
/// This is immediately added to the BLoC when created to request the latest
/// decks.
class DeckInitialized extends DeckEvent {}

/// Tells the BloC that it needs to create a new deck with this name to the list
/// of decks.
class DeckCreated extends DeckEvent {
  final String name;

  const DeckCreated({@required this.name});

  @override
  List<Object> get props => [name];
}

/// Tells the BloC that it needs to delete an existing deck.
class DeckDeleted extends DeckEvent {
  final Deck deck;

  const DeckDeleted({@required this.deck});

  @override
  List<Object> get props => [deck];
}
