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

import '../../../../domain/entities/material/entry/entry_tag.dart';
import '../../../../domain/repositories/material/entry/entry_tag_repository.dart';
import '../../../data_sources/moor/moor_database.dart';
import '../../../data_sources/moor/tags/tags_dao.dart';

@immutable
class EntryTagRepositoryImpl implements EntryTagRepository {
  final TagsDao _dao;

  EntryTagRepositoryImpl({@required TagsDao dao}) : _dao = dao;

  @override
  Future<EntryTag> create({@required String name}) async {
    final model = await _dao.create(name: name);

    return _toEntity(model);
  }

  @override
  Future<EntryTag> getById({@required int id}) async {
    final model = await _dao.getById(id: id);

    return _toEntity(model);
  }

  @override
  Future<List<EntryTag>> getAll() async {
    final models = await _dao.getAll();

    return models.map(_toEntity).toList();
  }

  @override
  Future<void> update({@required EntryTag tag}) async {
    await _dao.rename(id: tag.id, newName: tag.name);
  }

  @override
  Future<void> delete({@required EntryTag tag}) async {
    await _dao.remove(id: tag.id);
  }

  EntryTag _toEntity(TagModel model) {
    return EntryTag(id: model.id, name: model.name);
  }
}
