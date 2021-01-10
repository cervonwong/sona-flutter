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
import 'package:moor/moor.dart';

import '../../../data_exceptions.dart';
import '../moor_database.dart';
import 'entries_table.dart';

part 'entries_dao.g.dart';

abstract class EntriesDao {
  Future<EntryModel> create({@required int deckId, @required int entryTypeId});

  Future<EntryModel> getSingle({@required int id});

  Future<List<EntryModel>> getAll({int deckId});

  Future<void> edit({@required EntryModel newEntry});

  Future<void> remove({@required int id});

  Future<void> removeAll({@required List<EntryModel> entryList});
}

@UseDao(tables: [Entries])
class EntriesDaoImpl extends DatabaseAccessor<MoorDatabase>
    with _$EntriesDaoImplMixin
    implements EntriesDao {
  EntriesDaoImpl({@required MoorDatabase db}) : super(db);

  @override
  Future<EntryModel> create({
    @required int deckId,
    @required int entryTypeId,
  }) async {
    assert(deckId != null);
    assert(entryTypeId != null);

    final id = await into(entries).insert(
      EntriesCompanion.insert(
        deckId: deckId,
        entryTypeId: entryTypeId,
      ),
    );

    return getSingle(id: id);
  }

  @override
  Future<EntryModel> getSingle({@required int id}) {
    assert(id != null);

    return (select(entries)..where((entry) => entry.id.equals(id))).getSingle();
  }

  @override
  Future<List<EntryModel>> getAll({int deckId}) async {
    final selectStatement = select(entries);

    if (deckId != null) {
      selectStatement.where((entry) => entry.deckId.equals(deckId));
    }

    return selectStatement.get();
  }

  @override
  Future<void> edit({@required EntryModel newEntry}) async {
    assert(newEntry != null);
    assert((await getSingle(id: newEntry.id)) != null);

    await (update(entries)..whereSamePrimaryKey(newEntry)).write(
      EntriesCompanion(
        deckId: Value(newEntry.deckId),
        entryTypeId: Value(newEntry.entryTypeId),
      ),
    );
  }

  @override
  Future<void> remove({@required int id}) async {
    assert(id != null);

    final deletedCount = await (delete(entries)
          ..where(
            (entry) => entry.id.equals(id),
          ))
        .go();
    assert(deletedCount == 1);
  }

  @override
  Future<void> removeAll({@required List<EntryModel> entryList}) async {
    assert(entryList != null);
    assert(!entryList.contains(null));

    // Checks that all entries in entryList exist.
    await transaction(
      () async {
        for (final entry in entryList) {
          final result =
              await (select(entries)..whereSamePrimaryKey(entry)).getSingle();

          if (result == null) {
            throw ModelNotFoundException(
              'Tried to delete a list of EntryModels, '
              'but one or more EntryModels does not exist in the database. '
              'This is probably due to the app state not being synced with the '
              'database, '
              'resulting in a call with illegal arguments to this DAO.',
            );
          }
        }
      },
    );

    // Deletes them transactionally.
    await batch(
      (batch) {
        for (final entry in entryList) {
          batch.delete(entries, entry);
        }
      },
    );
  }
}
