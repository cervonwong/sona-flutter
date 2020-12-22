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

part of 'deck_bloc.dart';

abstract class DeckState extends Equatable {
  const DeckState();

  @override
  List<Object> get props => [];
}

/// The default state.
class DeckInitial extends DeckState {}

/// The state while the BLoC is fetching the list of decks from the repository.
class DeckLoading extends DeckState {}

/// The state when the BLoC has successfully loaded the list of decks.
class DeckLoaded extends DeckState {
  final List<Deck> decks;

  const DeckLoaded({@required this.decks});

  @override
  List<Object> get props => [decks];
}

/// The state when the BLoC has not successfully loaded the list of decks.
class DeckLoadFailed extends DeckState {}

class DeckNameIsTooShort extends DeckLoadFailed {}

class DeckNameIsTooLong extends DeckLoadFailed {}

class DeckNameIsEmpty extends DeckLoadFailed {}

class DeckNameAlreadyExists extends DeckLoadFailed {}
