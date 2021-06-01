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

import '../exceptions/exceptions.dart';

/// Exception thrown by repositories failing to retrieve the entity to be
/// navigated to.
///
/// For example, when trying to get a [Deck] from a [Card] in [DeckRepository],
/// but the [Deck] cannot be retrieved because it is not found.
///
/// This might be due to errors where the repository does not perform the
/// necessary operations on the data source to link data correctly.
class EntityNavigationException extends ApplicationException {
  @override
  final String message;

  EntityNavigationException(this.message) : super(message);

  @override
  String toString() => 'EntityNavigationException: $message';
}

/// Exception thrown by repositories when unable to perform an operation when
/// received an entity argument which does not exist.
///
/// For example, when trying to get a [Deck] from a [Card] in [DeckRepository],
/// but the [Card] cannot be retrieved because it is not found.
///
/// This might be due to a programming error resulting in the data in the app
/// not being synced with the repository.
class EntityNotFoundException extends ApplicationException {
  @override
  final String message;

  EntityNotFoundException(this.message) : super(message);

  @override
  String toString() => 'EntityNotFoundException: $message';
}
