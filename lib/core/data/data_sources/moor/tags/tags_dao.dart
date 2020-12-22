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

  Future<List<TagModel>> getAll();

  Future<TagModel> rename({@required int id, @required String newName});

  Future<TagModel> remove({@required int id});
}

@UseDao(tables: [Tags])
class TagsDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$TagsDaoImplMixin
    implements TagsDao {
  TagsDaoImpl({@required MoorDatabase db}) : super(db);

  /// Creates a record in the database for a tag with name [name], then returns
  /// its [TagModel].
  ///
  /// Throws [AssertionError] when name is `null` or when there already exists
  /// a tag with the same name in the database. In production,
  /// [InvalidDataException] or [SqliteException] may be thrown. You must check
  /// inputs before passing them to this method.
  @override
  Future<TagModel> create({@required String name}) async {
    assert(name != null);
    // Asserts that a tag with the same name in the database does not exist.
    assert((await (select(tags)
              ..where(
                (tag) => tag.name.equals(name),
              ))
            .get())
        .isEmpty);

    // Inserts a tag with the given name, then gets the auto-incremented ID.
    final id = await into(tags).insert(TagsCompanion.insert(name: name));
    // Returns the tag from the database specified by its ID.
    return getById(id: id);
  }

  /// Returns the [TagModel] of the tag in the database with a matching ID.
  ///
  /// Returns a `Future(null)` if there are no tags in the database with a
  /// matching ID.
  @override
  Future<TagModel> getById({@required int id}) async {
    assert(id != null);

    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Returns the list of [TagModel]s of all tags in the database.
  ///
  /// Returns the list of [TagModel]s in the order of creation.
  @override
  Future<List<TagModel>> getAll() async => select(tags).get();

  /// Updates the name to [newName] of the tag specified by its ID, then
  /// return its renamed [TagModel].
  ///
  /// Throws [AssertionError] when there are no tags in the database with a
  /// matching ID or when there is another tag in the database with the name
  /// [newName]. In production, [InvalidDataException] or [SqliteException] may
  /// be thrown. You must check inputs before passing them to this method.
  @override
  Future<TagModel> rename({@required int id, @required String newName}) async {
    assert(id != null);
    assert(newName != null);
    // Asserts that a tag with the same id in the database exists.
    assert((await getById(id: id)) != null);
    // Asserts that a tag with the same name in the database does not exist.
    assert((await (select(tags)
              ..where(
                (tag) => tag.name.equals(newName) & tag.id.equals(id).not(),
              ))
            .get())
        .isEmpty);

    // Renames tag from the database which has the ID.
    await (update(tags)..where((tag) => tag.id.equals(id)))
        .write(TagsCompanion(name: Value(newName)));
    // Returns the renamed tag from the database with the ID.
    return getById(id: id);
  }

  /// Deletes the tag specified by its ID [id].
  ///
  /// Throws [AssertionError] when there are no tags in the database with a
  /// matching ID. In production, [InvalidDataException] or [SqliteException]
  /// may be thrown. You must check inputs before passing them to this method.
  ///
  /// This method is not named `delete` because of naming conflicts.
  @override
  Future<TagModel> remove({@required int id}) async {
    assert(id != null);

    // Gets the tag specified by its ID.
    final tag = await getById(id: id);
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
