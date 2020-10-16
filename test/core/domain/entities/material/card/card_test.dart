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

import 'package:flutter_test/flutter_test.dart';
import 'package:sona_flutter/core/domain/entities/material/card/card.dart';

void main() {
  test('Card with default fields', () {
    const id = 1;
    const noteId = 2;
    final card = Card(
      id: id,
      noteId: noteId,
    );

    expect(card.id, id);
    expect(card.noteId, noteId);
    expect(card.isStarred, false);
    expect(card.isHidden, false);
  });

  test('Card copyWith', () {
    const id = 6;
    const noteId = 7;
    const isStarred = true;
    const isHidden = false;
    final card = Card(
      id: id,
      noteId: noteId,
      isStarred: isStarred,
      isHidden: isHidden,
    );

    expect(card.id, id);
    expect(card.noteId, noteId);
    expect(card.isStarred, isStarred);
    expect(card.isHidden, isHidden);

    const newIsStarred = false;
    const newIsHidden = true;
    final newCard = card.copyWith(
      isStarred: newIsStarred,
      isHidden: newIsHidden,
    );

    expect(newCard.isStarred, newIsStarred);
    expect(newCard.isHidden, newIsHidden);
  });
}
