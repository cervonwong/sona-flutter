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
import 'entries_table.dart';

part 'entries_dao.g.dart';

abstract class EntriesDao {
  Future<EntryModel> create({@required int deckId, @required int entryTypeId});

  Future<EntryModel> getSingle({@required int id});

  Future<List<EntryModel>> getAll();

  Future<EntryModel> edit({@required EntryModel newEntry});

  Future<EntryModel> remove({@required int id});
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
  Future<List<EntryModel>> getAll() async => (select(entries)).get();

  @override
  Future<EntryModel> edit({@required EntryModel newEntry}) async {
    assert(newEntry != null);
    assert((await getSingle(id: newEntry.id)) != null);

    await (update(entries)
          ..where(
            (entry) => entry.id.equals(newEntry.id),
          ))
        .write(
      EntriesCompanion(
        deckId: Value(newEntry.deckId),
        entryTypeId: Value(newEntry.entryTypeId),
      ),
    );
    return getSingle(id: newEntry.id);
  }

  @override
  Future<EntryModel> remove({@required int id}) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
