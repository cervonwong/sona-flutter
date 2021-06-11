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

// TODO: 6/11/2021 Implement this for DAOs.

import '../exceptions/exceptions.dart';

/// Exception thrown by DAOs failing to persist or retrieve data due to the
/// model specified by arguments passed not being retrievable.
///
/// For example in [DecksDaoImpl], when trying to edit or remove a deck by
/// passing in a [DeckModel] or by passing in its ID, and there is no record in
/// the database which corresponds to the deck specified.
///
/// This might be due to a programming error resulting in the data in the app
/// not being synced with the data source. (This exception serves as a back-end
/// check to complement any front-end check.)
class ModelNotFoundException extends ApplicationException {
  @override
  final String message;

  ModelNotFoundException(this.message) : super(message);

  @override
  String toString() => 'ModelNotFoundException: $message';
}

/// Exception thrown by DAOs failing to persist or retrieve data.
///
/// For example in [TagsDaoImpl], when trying to rename a tag to a name which
/// another tag already has. When a tag's name is supposed to be unique.
///
/// This might be due to a programming error causing the inputs to the DAOs to
/// be unvalidated. (This exception serves as a back-end check to complement any
/// front-end check.)
class DuplicateFieldException extends ApplicationException {
  @override
  final String message;

  DuplicateFieldException(this.message) : super(message);

  @override
  String toString() => 'DuplicateFieldException: $message';
}
