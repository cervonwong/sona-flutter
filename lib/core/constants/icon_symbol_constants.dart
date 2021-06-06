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

import 'package:flutter/widgets.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '../domain/entities/material/deck/deck_icon_spec.dart';

@immutable
class IconSymbolMetadata {
  final int id;
  final String name;
  final int version;
  final DeckIconSymbol symbol;
  final IconData iconData;
  final List<String> searchTerms;

  const IconSymbolMetadata({
    required this.id,
    required this.name,
    required this.version,
    required this.symbol,
    required this.iconData,
    required this.searchTerms,
  });
}

// Not defined with rest of constants in LookupAndMapperConstants because of
// higher structure complexity.
class IconSymbolConstants {
  IconSymbolConstants._(); // Prevent instantiation with private constructor.

  // Increment this value whenever changes are made to `values`.
  // Also increment the version of any `IconSymbolMetadata`s which has changed.
  static const currentVersion = 1;

  // IDs are defined as variables for testing (eliminates magic id numbers)
  static const deckId = 1;
  static const bookId = 2;
  static const flaskId = 3;

  // TODO: 6/6/2021 Does this way of structuring data cause slower conversion in
  //  DeckModelToEntityMapper? Does it matter considering the small number of
  //  Decks usually? Is there a faster / better method?
  static const values = [
    IconSymbolMetadata(
      id: deckId,
      name: 'DECK',
      version: 1,
      symbol: DeckIconSymbol.deck,
      iconData: FluentIcons.style_guide_24_regular,
      searchTerms: [
        'deck',
        'style',
        'style guide',
      ],
    ),
    IconSymbolMetadata(
      id: bookId,
      name: 'BOOK',
      version: 1,
      symbol: DeckIconSymbol.book,
      iconData: FluentIcons.book_24_regular,
      searchTerms: [
        'book',
        'diary',
        'documentation',
        'journal',
        'library',
        'read',
      ],
    ),
    IconSymbolMetadata(
      id: flaskId,
      name: 'FLASK',
      version: 1,
      symbol: DeckIconSymbol.flask,
      iconData: FluentIcons.beaker_24_regular,
      searchTerms: [
        'biology',
        'beaker',
        'chemistry',
        'experimental',
        'flask',
        'labs',
        'science',
      ],
    ),
  ];
}
