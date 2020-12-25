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

import 'package:meta/meta.dart';

import '../../../../core/domain/repositories/material/deck/deck_repository.dart';

class ValidateDeckName {
  final DeckRepository _repository;

  ValidateDeckName({
    @required DeckRepository repository,
  }) : _repository = repository;

  Future<DeckNameValidationResult> call({@required String name}) async {
    assert(name != null);

    if (name.isEmpty) {
      return DeckNameValidationResult.nameIsEmpty;
    }
    if (name.contains('\n')) {
      return DeckNameValidationResult.nameIsMultiline;
    }
    if ((await _repository.getByName(name: name)) == null) {
      return DeckNameValidationResult.valid;
    }
    return DeckNameValidationResult.nameAlreadyExists;
  }
}

enum DeckNameValidationResult {
  // Deck name is valid.
  valid,
  // Deck name is an empty String. This is enforced by the UI.
  nameIsEmpty,
  // Deck name has \n. This is enforced by the UI.
  nameIsMultiline,
  // Deck name already exist.
  nameAlreadyExists,
}
