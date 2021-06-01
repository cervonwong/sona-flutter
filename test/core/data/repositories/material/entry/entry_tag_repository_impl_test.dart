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

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/data_sources/moor/tags/tags_dao.dart';
import 'package:sona_flutter/core/data/repositories/material/entry/entry_tag_model_to_entity_mapper.dart';
import 'package:sona_flutter/core/data/repositories/material/entry/entry_tag_repository_impl.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';
import 'package:sona_flutter/core/domain/repositories/material/entry/entry_tag_repository.dart';

// ignore: must_be_immutable
class MockEntryTag extends Mock implements EntryTag {}

class MockTagModel extends Mock implements TagModel {}

class MockTagsDaoImpl extends Mock implements TagsDao {}

class MockEntryTagModelToEntityMapper extends Mock
    implements EntryTagModelToEntityMapper {}

void main() {
  TagsDao dao;
  EntryTagRepository repository;
  EntryTagModelToEntityMapper toEntity;

  EntryTag tag1;
  TagModel tagModel1;

  setUp(
    () {
      dao = MockTagsDaoImpl();
      toEntity = MockEntryTagModelToEntityMapper();
      repository = EntryTagRepositoryImpl(dao: dao, toEntity: toEntity);

      tag1 = MockEntryTag();
      tagModel1 = MockTagModel();

      when(toEntity(model: argThat(equals(tagModel1), named: 'model')))
          .thenReturn(tag1);
    },
  );

  group(
    'EntryTagRepositoryImpl create',
    () {
      test(
        'when passed legal arguments, '
        'should return expected EntryTag',
        () async {
          when(dao.create(name: argThat(equals('Miaow'), named: 'name')))
              .thenAnswer((_) async => tagModel1);

          final tag = await repository.create(name: 'Miaow');
          expect(tag, tag1);
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl getById',
    () {
      test(
        'when TagsDao.getById returns a TagModel, '
        'should return expected EntryTag',
        () async {
          when(dao.getById(id: argThat(equals(20), named: 'id')))
              .thenAnswer((_) async => tagModel1);

          final tag = await repository.getById(id: 20);
          expect(tag, tag1);
        },
      );

      test(
        'when TagsDao.getById return null, '
        'should return null',
        () async {
          when(dao.getById(id: argThat(equals(69), named: 'id')))
              .thenAnswer((_) async => null);
          when(toEntity(model: argThat(isNull, named: 'model')))
              .thenReturn(null);

          final tag = await repository.getById(id: 69);
          expect(tag, isNull);
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl getAll',
    () {
      test(
        'when TagsDao.getAll returns an empty List of TagModels, '
        'should return an empty List of EntryTags',
        () async {
          when(dao.getAll()).thenAnswer(
            (_) async => <TagModel>[],
          );

          final tags = await repository.getAll();
          expect(tags, <EntryTag>[]);
        },
      );

      test(
        'when TagsDao.getAll returns a List with three TagModels, '
        'should return the mapped List with three EntryTags',
        () async {
          final tag2 = MockEntryTag(), tag3 = MockEntryTag();
          final tagModel2 = MockTagModel(), tagModel3 = MockTagModel();

          when(toEntity(model: argThat(equals(tagModel2), named: 'model')))
              .thenReturn(tag2);
          when(toEntity(model: argThat(equals(tagModel3), named: 'model')))
              .thenReturn(tag3);

          when(dao.getAll()).thenAnswer(
            (_) async => [tagModel1, tagModel2, tagModel3],
          );

          final tags = await repository.getAll();
          expect(tags, [tag1, tag2, tag3]);
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl update',
    () {
      test(
        'when passed legal arguments, '
        'should call TagsDao.rename with expected arguments',
        () async {
          when(tag1.id).thenReturn(69);
          when(tag1.name).thenReturn('Rawrr');
          when(dao.rename(
            id: argThat(equals(69), named: 'id'),
            newName: argThat(equals('Rawrr'), named: 'newName'),
          )).thenAnswer((_) async => tagModel1);

          await repository.update(tag: tag1);
          // verify is only used for testing void and stubbed methods.
          verify(dao.rename(id: 69, newName: 'Rawrr'));
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl delete',
    () {
      test(
        'when passed legal arguments, '
        'should call TagsDao.remove with expected arguments',
        () async {
          when(tag1.id).thenReturn(100);
          when(dao.remove(id: argThat(equals(100), named: 'id')))
              .thenAnswer((_) async => tagModel1);

          await repository.delete(tag: tag1);
          // verify is only used for testing void and stubbed methods.
          verify(dao.remove(id: 100));
        },
      );
    },
  );
}
