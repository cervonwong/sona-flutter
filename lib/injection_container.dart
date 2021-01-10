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

import 'package:get_it/get_it.dart';

import 'core/data/data_sources/moor/cards/cards_dao.dart';
import 'core/data/data_sources/moor/decks/decks_dao.dart';
import 'core/data/data_sources/moor/entries/entries_dao.dart';
import 'core/data/data_sources/moor/moor_database.dart';
import 'core/data/repositories/material/deck/deck_entity_to_model_mapper.dart';
import 'core/data/repositories/material/deck/deck_model_to_entity_mapper.dart';
import 'core/data/repositories/material/deck/deck_repository_impl.dart';
import 'core/domain/repositories/material/deck/deck_repository.dart';
import 'core/utils/system_time.dart';
import 'features/deck/deck_injection_container.dart' as deck;

void configureDependencies() {
  final getIt = GetIt.instance;

  // Features
  deck.configureDependencies(getIt);

  // Core > Utils
  getIt.registerLazySingleton(() => SystemTime());

  // Core > Data > Repositories
  getIt.registerLazySingleton<DeckRepository>(
    () => DeckRepositoryImpl(
      decksDao: getIt(),
      entriesDao: getIt(),
      cardsDao: getIt(),
      toEntity: getIt(),
      toModel: getIt(),
    ),
  );

  // Core > Data > Data sources
  getIt.registerLazySingleton<DecksDao>(
    () => DecksDaoImpl(db: getIt(), systemTime: getIt()),
  );
  getIt.registerLazySingleton<EntriesDao>(() => EntriesDaoImpl(db: getIt()));
  getIt.registerLazySingleton<CardsDao>(() => CardsDaoImpl(db: getIt()));

  getIt.registerLazySingleton(() => DeckModelToEntityMapper());
  getIt.registerLazySingleton(() => DeckEntityToModelMapper());

  getIt.registerLazySingleton(() => MoorDatabase());
}
