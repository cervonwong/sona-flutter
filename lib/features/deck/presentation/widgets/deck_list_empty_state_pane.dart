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

import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../../../../core/presentation/constants/widget_constants.dart';
import '../../../../core/presentation/theme/themes.dart';

class DeckListEmptyStatePane extends StatelessWidget {
  const DeckListEmptyStatePane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _Icon(),
          const SizedBox(height: WidgetConstants.spacingPadding16),
          const _Title(),
          const SizedBox(height: WidgetConstants.spacingPadding08),
          const _Body(),
          const SizedBox(height: WidgetConstants.spacingPadding16),
          const _CTA(),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Icon(
          FluentIcons.collections_24_filled,
          size: 120.0,
          color: cn.onBackground.lowEmphasis,
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Text(
          'You have no decks',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: cn.onBackground.highEmphasis,
              ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Text(
          'Create a new deck and it will show up here.',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: cn.onBackground.mediumEmphasis,
              ),
        );
      },
    );
  }
}

class _CTA extends StatelessWidget {
  const _CTA();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        elevatedButtonTheme: lightThemeRadiusMaxElevatedButtonThemeData,
      ),
      child: ElevatedButton.icon(
        icon: const Icon(FluentIcons.add_24_regular),
        label: const Text('NEW DECK'),
        onPressed: () {}, // TODO: 6/13/2021 Link to BLoC.
      ),
    );
  }
}
