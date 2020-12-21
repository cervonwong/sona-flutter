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
import 'package:moor/moor.dart';

import '../moor_database.dart';
import 'tags_table.dart';

part 'tags_dao.g.dart';

abstract class TagsDao {
  Future<TagModel> create({@required String name});

  Future<TagModel> getById({@required int id});

  @deprecated
  Future<TagModel> getByName({@required String name});

  Future<List<TagModel>> getAll();

  Future<TagModel> rename({@required int id, @required String newName});

  Future<TagModel> remove({@required int id});
}

@UseDao(tables: [Tags])
class TagsDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$TagsDaoImplMixin
    implements TagsDao {
  TagsDaoImpl(MoorDatabase db) : super(db);

  /// Creates a record in the database for a tag with `name`, then returns its
  /// model.
  ///
  /// Throws `AssertionError` when name is `null` or when there already exists
  /// a tag with the same name in the database. In production,
  /// `InvalidDataException` or `SqliteException` may be thrown. You must check
  /// inputs before passing them to this method.
  @override
  Future<TagModel> create({@required String name}) async {
    assert(name != null);
    // Asserts that a tag with the same name in the db does not exist.
    assert((await (select(tags)..where((tag) => tag.name.equals(name))).get())
        .isEmpty);

    // Inserts a tag with the given name, and gets the auto-incremented ID.
    final id = await into(tags).insert(TagsCompanion.insert(name: name));
    // Returns the tag from the database specified by its ID.
    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Returns the TagModel of the tag in the database with a matching ID.
  ///
  /// Returns a `Future(null)` if there are no tags in the database with a
  /// matching ID.
  @override
  Future<TagModel> getById({@required int id}) async {
    assert(id != null);

    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Returns the TagModel of the tag in the database with a matching name.
  ///
  /// Returns a `Future(null)` if there are no tags in the database with a
  /// matching name.
  @override
  @deprecated
  Future<TagModel> getByName({@required String name}) async {
    throw UnimplementedError();
  }

  /// Returns the list of TagModels of all tags in the database.
  ///
  /// Returns the list of TagModels in the order of creation.
  @override
  Future<List<TagModel>> getAll() async {
    return select(tags).get();
  }

  /// Updates the name to `newName` of the tag specified by its ID, then
  /// return its renamed model.
  ///
  /// Throws `AssertionError` when there are no tags in the database with a
  /// matching ID or when there is another tag in the database with the name
  /// `newName`. In production, `InvalidDataException` or `SqliteException` may
  /// be thrown. You must check inputs before passing them to this method.
  @override
  Future<TagModel> rename({@required int id, @required String newName}) async {
    assert(id != null);
    assert(newName != null);
    // Asserts that a tag with the same id in the db exists.
    assert((await (select(tags)..where((tag) => tag.id.equals(id))).get())
        .isNotEmpty);
    // Asserts that a tag with the same name in the db does not exist.
    assert(
        (await (select(tags)..where((tag) => tag.name.equals(newName))).get())
            .isEmpty);

    // Rename tags from the database which has the ID.
    await (update(tags)..where((tag) => tag.id.equals(id)))
        .write(TagsCompanion(name: Value(newName)));
    // Returns the renamed tag from the database with the ID.
    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Deletes the tag specified by its ID.
  ///
  /// Throws `AssertionError` when there are no tags in the database with a
  /// matching ID. In production, `InvalidDataException` or `SqliteException`
  /// may be thrown. You must check inputs before passing them to this method.
  ///
  /// This method is not named `delete` because of naming conflicts.
  @override
  Future<TagModel> remove({@required int id}) async {
    assert(id != null);

    // Gets the tag specified by its ID.
    final tag = (await select(tags)
          ..where((tag) => tag.id.equals(id)))
        .getSingle();
    // Asserts that there is 1 tag specified by its ID.
    assert(tag != null);

    // Deletes the tag specified by its ID,
    // then gets the number of deleted tags.
    final num = await (delete(tags)..where((tag) => tag.id.equals(id))).go();
    // Asserts that the number of deleted tags is 1.
    assert(num == 1);

    // Returns the now removed tag.
    return tag;
  }
}
