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
import 'package:mockito/mockito.dart';
import 'package:sona_flutter/core/data/data_sources/moor/moor_database.dart';
import 'package:sona_flutter/core/data/data_sources/moor/tags/tags_dao.dart';
import 'package:sona_flutter/core/data/repositories/material/entry/entry_tag_repository_impl.dart';
import 'package:sona_flutter/core/domain/entities/material/entry/entry_tag.dart';
import 'package:sona_flutter/core/domain/repositories/material/entry/entry_tag_repository.dart';

class MockTagsDaoImpl extends Mock implements TagsDao {}

void main() {
  TagsDao dao;
  EntryTagRepository repository;

  setUp(
    () {
      dao = MockTagsDaoImpl();
      repository = EntryTagRepositoryImpl(dao: dao);
    },
  );

  group(
    'EntryTagRepositoryImpl create',
    () {
      test(
        'when DAO returns TagModel, '
        'should return expected EntryTag',
        () async {
          when(dao.create(name: argThat(equals('Miaow'), named: 'name')))
              .thenAnswer(
            (_) async => TagModel(id: 1, name: 'Miaow'),
          );

          final tag = await repository.create(name: 'Miaow');
          expect(tag, EntryTag(id: 1, name: 'Miaow'));
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl getById',
    () {
      test(
        'when DAO returns TagModel, '
        'should return expected EntryTag',
        () async {
          when(dao.getById(id: argThat(equals(20), named: 'id'))).thenAnswer(
            (_) async => TagModel(id: 20, name: 'Woof'),
          );

          final tag = await repository.getById(id: 20);
          expect(tag, EntryTag(id: 20, name: 'Woof'));
        },
      );
    },
  );

  group(
    'EntryTagRepositoryImpl getAll',
    () {
      test(
        'when DAO returns an empty List of TagModels, '
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
        'when DAO returns a List with three TagModels, '
        'should return the mapped List of EntryTags',
        () async {
          when(dao.getAll()).thenAnswer(
            (_) async => [
              TagModel(id: 1, name: 'Grrr'),
              TagModel(id: 2, name: 'Brrr'),
              TagModel(id: 3, name: 'Chhh'),
            ],
          );

          final tags = await repository.getAll();
          expect(tags, [
            EntryTag(id: 1, name: 'Grrr'),
            EntryTag(id: 2, name: 'Brrr'),
            EntryTag(id: 3, name: 'Chhh'),
          ]);
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
          when(dao.rename(
            id: argThat(equals(69), named: 'id'),
            newName: argThat(equals('Rawrr'), named: 'newName'),
          )).thenAnswer(
            (_) async => TagModel(id: 69, name: 'Rawrr'),
          );

          await repository.update(tag: EntryTag(id: 69, name: 'Rawrr'));
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
          when(dao.remove(id: argThat(equals(100), named: 'id'))).thenAnswer(
            (_) async => TagModel(id: 100, name: 'Squawk'),
          );

          await repository.delete(tag: EntryTag(id: 100, name: 'Squawk'));
          // verify is only used for testing void and stubbed methods.
          verify(dao.remove(id: 100));
        },
      );
    },
  );
}
