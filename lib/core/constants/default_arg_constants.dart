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

import '../domain/entities/material/deck/deck_icon_spec.dart';

class DefaultArgConstants {
  DefaultArgConstants._(); // Prevent instantiation with private constructor.

  // Deck / DeckModel
  static const String? deckAuthorName = null;
  static const String? deckDescription = null;

  // DeckIconSpec / DeckModel
  static const DeckIconColor deckIconSpecColor = DeckIconColor.sky;
  static const DeckIconSymbol deckIconSpecSymbol = DeckIconSymbol.deck;

  // Card / CardModel
  static const bool cardStarred = false;
  static const bool cardHidden = false;
}
