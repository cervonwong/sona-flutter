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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class DeckIconSpec extends Equatable {
  final DeckIconColor color;
  final DeckIconSymbol symbol;

  const DeckIconSpec({
    required this.color, // Default is DeckIconColor.sky from use case POV.
    required this.symbol, // Default is DeckIconSymbol.deck from use case POV.
    // Also see `DefaultArgConstants` for other similar default constants.
  });

  DeckIconSpec copyWith({DeckIconColor? color, DeckIconSymbol? symbol}) {
    return DeckIconSpec(
      color: color ?? this.color,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  List<Object?> get props => [color, symbol];
}

enum DeckIconColor {
  red,
  orange,
  yellow,
  lime,
  green,
  teal,
  cyan,
  sky,
  blue,
  purple,
  pink,
}

enum DeckIconSymbol {
  deck,
  book,
  flask,
  leafTwo,
  // TODO: 6/5/2021 Fill up.
}
