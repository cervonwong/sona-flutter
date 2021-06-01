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

import 'package:meta/meta.dart';

import '../../../entities/material/card/card.dart';
import '../../../entities/material/deck/deck.dart';
import '../../../entities/material/entry/entry.dart';

abstract class DeckRepository {
  Future<Deck> create({@required String name});

  Future<Deck> getById({@required int id});

  Future<Deck> getByName({@required String name});

  Future<List<Deck>> getAll();

  Future<Deck> getByEntry({@required Entry entry});

  Future<Deck> getByCard({@required Card card});

  // TODO(cervonwong): 29/12/2020 Possibly change the return type to return Deck
  //  with the updated lastEditedDateTime? But this might not be necessary after
  //  using watches instead of getAlls... Let's wait and see.
  Future<void> update({@required Deck deck});

  Future<void> delete({@required Deck deck});
}
