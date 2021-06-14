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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class DeckListViewModel extends Equatable {
  final List<DeckListItemViewModel> _items;

  List<DeckListItemViewModel> get items => _items.toList();

  DeckListViewModel({required List<DeckListItemViewModel> items})
      : _items = items.toList();

  @override
  List<Object?> get props => [_items];
}

@immutable
class DeckListItemViewModel extends Equatable {
  final int id;
  final String name;
  final bool hasEntries;
  final String subtitle;
  final String dueText;
  final IconData iconData;
  final DeckListItemIconColorViewModel iconColor;
  final bool? hasCompletedRevision;
  final double? progressPercent;

  DeckListItemViewModel({
    required this.id,
    required this.name,
    required this.hasEntries,
    required this.subtitle,
    required this.dueText,
    required this.iconData,
    required this.iconColor,
    required this.hasCompletedRevision,
    required this.progressPercent,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        hasEntries,
        subtitle,
        dueText,
        iconData,
        iconColor,
        hasCompletedRevision,
        progressPercent,
      ];
}

enum DeckListItemIconColorViewModel {
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
