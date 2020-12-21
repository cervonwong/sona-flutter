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

import 'package:moor/moor.dart';

import '../../../../constants/material_constants.dart';
import '../../../../utils/system_time.dart';
import '../moor_database.dart';
import 'decks_table.dart';

part 'decks_dao.g.dart';

abstract class DecksDao {
  Future<DeckModel> create({@required String name});

  Future<DeckModel> getById({@required int id});

  Future<List<DeckModel>> getAll();

  Future<DeckModel> edit({@required DeckModel deck});

  Future<DeckModel> remove({@required int id});
}

@UseDao(tables: [Decks])
class DecksDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$DecksDaoImplMixin
    implements DecksDao {
  final SystemTime systemTime;

  DecksDaoImpl({
    @required MoorDatabase db,
    @required this.systemTime,
  }) : super(db);

  /// Creates a record in the database for a deck with name `name`, then returns
  /// its model.
  ///
  /// Throws `AssertionError` when name is `null` or when there already exists
  /// a deck with the same name in the database. In production,
  /// `InvalidDataException` or `SqliteException` may be thrown. You must check
  /// inputs before passing them to this method.
  @override
  Future<DeckModel> create({@required String name}) async {
    assert(name != null);
    // Asserts that a deck with the same name in the db does not exist.
    assert((await (select(decks)
              ..where(
                (deck) => deck.name.equals(name),
              ))
            .get())
        .isEmpty);

    // Inserts a deck with the given name, then gets the auto-incremented ID.
    final id = await into(decks).insert(
      DecksCompanion.insert(
        name: name,
        created: systemTime.now(),
        lastEdited: systemTime.now(),
        authorName: Value(kDefaultDeckAuthorName),
        description: Value(kDefaultDeckDescription),
      ),
    );
    // Returns the deck from the database specified by its ID.
    return (select(decks)..where((deck) => deck.id.equals(id))).getSingle();
  }

  /// Returns the DeckModel of the deck in the database with a matching ID.
  ///
  /// Returns a `Future(null)` if there are no decks in the database with a
  /// matching ID.
  @override
  Future<DeckModel> getById({@required int id}) {
    assert(id != null);

    return (select(decks)..where((deck) => deck.id.equals(id))).getSingle();
  }

  /// Returns the list of DeckModels of all decks in the database.
  ///
  /// Returns the list of DeckModels in the order of creation.
  @override
  Future<List<DeckModel>> getAll() async => select(decks).get();

  ///
  ///
  /// This method is not named `update` because of naming conflicts.
  @override
  Future<DeckModel> edit({@required DeckModel deck}) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  ///
  ///
  /// This method is not named `delete` because of naming conflicts.
  @override
  Future<DeckModel> remove({@required int id}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
