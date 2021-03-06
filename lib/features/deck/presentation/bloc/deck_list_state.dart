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

abstract class DeckListState extends Equatable {
  const DeckListState();

  @override
  List<Object> get props => [];
}

/// The default state.
class DeckListInitial extends DeckListState {}

/// The state while the BLoC is fetching the list of decks from the repository.
class DeckListLoading extends DeckListState {}

/// The state when the BLoC has successfully loaded the list of decks.
class DeckListLoaded extends DeckListState {
  final DeckListViewModel deckListViewModel;

  const DeckListLoaded({required this.deckListViewModel});

  @override
  List<Object> get props => [deckListViewModel];

  @override
  bool get stringify => true;
}

/// The state when the BLoC has not successfully loaded the list of decks.
abstract class DeckListLoadFailed extends DeckListState {}

/// The state when the BLoC has caught an [ApplicationException].
class DeckListLoadFailedWithException extends DeckListLoadFailed {
  final ApplicationException exception;

  DeckListLoadFailedWithException({required this.exception});

  @override
  List<Object> get props => [exception];

  @override
  bool get stringify => true;
}

/// The state when the an Event passed to the BLoC has invalid name field.
abstract class DeckNameValidationFailed extends DeckListLoadFailed {}

class DeckNameIsEmpty extends DeckNameValidationFailed {}

class DeckNameAlreadyExists extends DeckNameValidationFailed {}

class DeckNameIsMultiline extends DeckNameValidationFailed {}
