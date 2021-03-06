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

import '../domain/use_cases/create_deck.dart';
import '../domain/use_cases/delete_deck.dart';
import '../domain/use_cases/get_deck_list.dart';
import '../domain/use_cases/validate_deck_name.dart';
import '../presentation/bloc/deck_list_bloc.dart';
import '../presentation/bloc/to_deck_list_view_model_mapper.dart';

void configureDependencies(GetIt getIt) {
  // Presentation > Bloc
  getIt.registerLazySingleton(() => ToDeckListViewModelMapper());

  getIt.registerFactory(() {
    return DeckListBloc(
      createDeck: getIt(),
      getDeckList: getIt(),
      deleteDeck: getIt(),
      validateDeckName: getIt(),
      toDeckListViewModel: getIt(),
    );
  });

  // Domain > Use cases
  getIt.registerLazySingleton(() => CreateDeck(repository: getIt()));
  getIt.registerLazySingleton(() => GetDeckList(repository: getIt()));
  getIt.registerLazySingleton(() => DeleteDeck(repository: getIt()));
  getIt.registerLazySingleton(() => ValidateDeckName(repository: getIt()));
}
