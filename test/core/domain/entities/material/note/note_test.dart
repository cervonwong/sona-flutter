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
import 'package:sona_flutter/core/domain/entities/material/note/note.dart';

void main() {
  test(
    'Note when constructed without optional parameters, '
    'should have expected default fields',
    () {
      final note = Note(
        id: 1,
        deckName: 'Some Deck',
        noteTypeId: 2,
      );

      expect(note.id, 1);
      expect(note.deckName, 'Some Deck');
      expect(note.noteTypeId, 2);
      expect(note.tags, <String>{});
      expect(note.fieldData, <String, String>{});
    },
  );

  test(
    'Note when constructed with null parameters,'
    'should fail asserts',
    () {
      expect(
        () => Note(
          id: null,
          deckName: 'Null Deck',
          noteTypeId: 1,
        ),
        throwsAssertionError,
      );

      expect(
        () => Note(
          id: 100,
          deckName: null,
          noteTypeId: 1,
        ),
        throwsAssertionError,
      );

      expect(
        () => Note(
          id: 100,
          deckName: 'Null Deck',
          noteTypeId: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => Note(
          id: 100,
          deckName: 'Null Deck',
          noteTypeId: 1,
          tags: null,
        ),
        throwsAssertionError,
      );

      expect(
        () => Note(
          id: 100,
          deckName: 'Null Deck',
          noteTypeId: 1,
          fieldData: null,
        ),
        throwsAssertionError,
      );
    },
  );

  test(
    'Note copyWith '
    'should return Note with new fields',
    () {
      final note = Note(
        id: 7,
        deckName: 'Another Deck',
        noteTypeId: 3,
        tags: {'Tag 1', 'Tag 2'},
        fieldData: {'Field 1': 'Data 1', 'Field 2': 'Data 2'},
      );

      expect(note.id, 7);
      expect(note.deckName, 'Another Deck');
      expect(note.noteTypeId, 3);
      expect(note.tags, {'Tag 1', 'Tag 2'});
      expect(note.fieldData, {'Field 1': 'Data 1', 'Field 2': 'Data 2'});

      final newNote = note.copyWith(
        tags: {'New tag 1', 'New tag 2', 'New tag 3'},
        fieldData: {'New field 1': 'New data 1'},
      );

      expect(newNote.id, 7);
      expect(newNote.deckName, 'Another Deck');
      expect(newNote.noteTypeId, 3);
      expect(newNote.tags, {'New tag 1', 'New tag 2', 'New tag 3'});
      expect(newNote.fieldData, {'New field 1': 'New data 1'});
    },
  );

  test(
    'Note when equating logically equal Notes, '
    'should return true',
    () {
      final note1 = Note(id: 1, deckName: 'A deck', noteTypeId: 2);
      final note2 = note1.copyWith(tags: {'Sona', 'Is', 'Good'});
      final note3 = note1.copyWith(fieldData: {'Sona': 'Is', 'Very': 'Good'});
      final note4 = note2.copyWith(fieldData: {'Remember': 'Facts'});

      expect(note1, note2);
      expect(note1, note3);
      expect(note1, note4);
      expect(note2, note3);
      expect(note2, note4);
      expect(note3, note4);
    },
  );

  test(
    'Note when equating logically unequal Notes, '
    'should return false',
    () {
      final note1 = Note(id: 9999, deckName: 'Deck of Joy', noteTypeId: 1);
      final note2 = Note(id: 9998, deckName: 'Deck of Joy', noteTypeId: 1);
      final note3 = Note(id: 9999, deckName: 'Deck of Shame', noteTypeId: 1);
      final note4 = Note(id: 9999, deckName: 'Deck omf Joy', noteTypeId: 2);

      expect(note1, isNot(note2));
      expect(note1, isNot(note3));
      expect(note1, isNot(note4));
      expect(note2, isNot(note3));
      expect(note2, isNot(note4));
      expect(note3, isNot(note4));
    },
  );
}
