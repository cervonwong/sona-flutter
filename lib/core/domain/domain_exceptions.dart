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

import '../exceptions/exceptions.dart';

/// Exception thrown by repositories failing to navigate between entities.
///
/// For example, when trying to get a [Deck] from a [Card] in [DeckRepository]
/// yields no results.
///
/// This might be due to corruption of the data source or a programming error
/// resulting in data not being entered correctly.
class EntityNavigationException extends ApplicationException {
  @override
  final String message;

  EntityNavigationException(this.message) : super(message);

  @override
  String toString() => 'EntityNavigationException: $message';
}
