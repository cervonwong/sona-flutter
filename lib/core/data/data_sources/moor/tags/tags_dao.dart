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

@UseDao(tables: [Tags])
class TagsDao extends DatabaseAccessor<MoorDatabase> with _$TagsDaoMixin {
  TagsDao(MoorDatabase db) : super(db);

  /// Creates a record in the database for a tag with `name`, then returns its
  /// model.
  ///
  /// Throws `AssertionError`s when name is `null` or when there already exists
  /// a tag with the same name in the database. In production,
  /// `InvalidDataException` or `SqliteException` may be thrown. You must check
  /// inputs before passing them to this method.
  Future<TagModel> create({@required String name}) async {
    assert(name != null);
    // Asserts that a tag with the same name in the db does not exist.
    assert((await (select(tags)..where((tag) => tag.name.equals(name))).get())
        .isEmpty);

    // Inserts a tag with the given name, and gets the auto-incremented ID.
    final id = await into(tags).insert(TagsCompanion.insert(name: name));
    // Returns the tag from the database with the ID.
    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Returns the TagModel of the tag in the database with a matching ID.
  ///
  /// Returns a `Future(null)` if there are no tags in the database with a
  /// matching ID.
  Future<TagModel> getById({@required int id}) async {
    assert(id != null);

    return (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  }

  /// Returns the TagModel of the tag in the database with a matching name.
  ///
  /// Returns a `Future(null)` if there are no tags in the database with a
  /// matching name.
  @deprecated
  Future<TagModel> getByName({@required String name}) async {
    throw UnimplementedError();
  }

  Future<List<TagModel>> getAll() async {
    return select(tags).get();
  }

  Future<TagModel> rename({@required int id, @required String newName}) async {
    throw UnimplementedError();
  }

  ///
  ///
  /// This method is not named `delete` because of naming conflicts.
  Future<TagModel> remove({@required int id}) async {
    throw UnimplementedError();
  }
}
