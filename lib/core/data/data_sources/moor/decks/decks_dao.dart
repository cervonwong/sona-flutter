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

import 'package:moor/moor.dart';

import '../../../../constants/material_constants.dart';
import '../../../../utils/system_time.dart';
import '../moor_database.dart';
import 'decks_table.dart';

part 'decks_dao.g.dart';

abstract class DecksDao {
  Future<DeckModel> create({required String name});

  Future<DeckModel?> getById({required int id});

  Future<DeckModel?> getByName({required String name});

  Future<List<DeckModel>> getAll();

  Future<DeckModel> edit({required DeckModel newDeck});

  Future<void> remove({required int id});
}

@UseDao(tables: [Decks])
class DecksDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$DecksDaoImplMixin
    implements DecksDao {
  final SystemTime systemTime;

  DecksDaoImpl({
    required MoorDatabase db,
    required this.systemTime,
  }) : super(db);

  /// Creates a record in the database for a deck with name [name], then returns
  /// its [DeckModel].
  ///
  /// Throws [AssertionError] when name is `null` or when there already exists
  /// a deck with the same name in the database. In production,
  /// [InvalidDataException] or [SqliteException] may be thrown. You must check
  /// inputs before passing them to this method.
  @override
  Future<DeckModel> create({required String name}) async {
    assert(name != null);
    // Asserts that a deck with the same name in the db does not exist.
    assert((await getByName(name: name)) == null);

    // Inserts a deck with the given name, then gets the auto-incremented ID.
    final id = await into(decks).insert(
      DecksCompanion.insert(
        name: name,
        created: systemTime.now(),
        lastEdited: systemTime.now(),
        authorName: const Value(kDefaultDeckAuthorName),
        description: const Value(kDefaultDeckDescription),
      ),
    );
    // Returns the deck from the database specified by its ID.
    return (select(decks)..where((deck) => deck.id.equals(id))).getSingle();
  }

  /// Returns the [DeckModel] of the deck in the database with a matching ID.
  ///
  /// Returns a `Future(null)` if there are no decks in the database with a
  /// matching ID.
  @override
  Future<DeckModel?> getById({required int id}) {
    assert(id != null);

    return (select(decks)..where((deck) => deck.id.equals(id)))
        .getSingleOrNull();
  }

  /// Returns the [DeckModel] of the deck in the database with a matching name.
  ///
  /// Returns a `Future(null)` if there are no decks in the database with a
  /// matching name.
  @override
  Future<DeckModel?> getByName({required String name}) {
    assert(name != null);

    return (select(decks)..where((deck) => deck.name.equals(name)))
        .getSingleOrNull();
  }

  /// Returns the list of [DeckModel]s of all decks in the database.
  ///
  /// Returns the list of [DeckModel]s with the most recently created at the
  /// start of the list (descending order of the creation).
  @override
  Future<List<DeckModel>> getAll() async {
    return (select(decks)
          ..orderBy(
            [(deck) => OrderingTerm.desc(deck.created)],
          ))
        .get();
  }

  /// Updates the updatable fields of the deck specified by [newDeck]'s ID, then
  /// returns its updated [DeckModel].
  ///
  /// If any of these fields: [`name`, `lastEdited` ,`authorName`,
  /// `description`] are different in [newDeck] compared to the deck in the
  /// database, then the deck in the database's fields are updated.
  ///
  /// Throws [AssertionError] when there are no decks in the database with a
  /// matching ID or when there is another deck the database with the same name
  /// as [newDeck]'s `name` In production, [InvalidDataException] or
  /// [SqliteException] may be thrown. You must check inputs before passing
  /// them to this method.
  ///
  /// This method is not named `update` because of naming conflicts.
  @override
  Future<DeckModel> edit({required DeckModel newDeck}) async {
    assert(newDeck != null);
    // Asserts that a deck with the same ID as the passed deck's ID exists.
    assert((await getById(id: newDeck.id)) != null);
    // Asserts that a deck with the same name as the passed deck's name and is
    // not the same deck (deck with the same ID as newDeck's id) does not exist.
    assert((await (select(decks)
              ..where(
                (deck) =>
                    deck.name.equals(newDeck.name) &
                    deck.id.equals(newDeck.id).not(),
              ))
            .get())
        .isEmpty);

    // Updates deck from the database which has the same ID.
    await (update(decks)..whereSamePrimaryKey(newDeck)).write(
      DecksCompanion(
        name: Value(newDeck.name),
        lastEdited: Value(systemTime.now()),
        authorName: Value(newDeck.authorName),
        description: Value(newDeck.description),
      ),
    );
    // Returns the updated deck from the database specified by its ID.
    return (select(decks)..where((deck) => deck.id.equals(newDeck.id)))
        .getSingle();
  }

  /// Deletes the deck specified by its ID [id].
  ///
  /// Throws [AssertionError] when there are no decks in the database with a
  /// matching ID. In production, [InvalidDataException] or [SqliteException]
  /// may be thrown. You must check inputs before passing them to this method.
  ///
  /// This method is not named `delete` because of naming conflicts.
  @override
  Future<void> remove({required int id}) async {
    assert(id != null);

    // Deletes the deck specified by its ID,
    // then gets the number of deleted decks.
    final deletedCount = await (delete(decks)
          ..where(
            (deck) => deck.id.equals(id),
          ))
        .go();
    // Asserts that the number of deleted tags is 1.
    assert(deletedCount == 1);
  }
}
