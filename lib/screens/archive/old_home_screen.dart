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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../core/presentation/change_notifiers/color_notifier.dart';
import '../../features/deck/presentation/bloc/deck_list_bloc.dart';
import '../../features/deck/presentation/widgets_archive/create_deck_sheet.dart';
import '../../features/deck/presentation/widgets_archive/deck_list/deck_list_tile.dart';
import '../../features/deck/presentation/widgets_archive/deck_list/deck_list_title_bar.dart';
import 'shared/main_drawer.dart';

class OldHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeckListBloc>(
      create: (_) => GetIt.instance()..add(DeckListInitialized()),
      child: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, child) {
          return Scaffold(
            appBar: _HomeAppBar(),
            drawer: MainDrawer(selected: SelectableDrawerDestination.home),
            floatingActionButton: _HomeFAB(),
            drawerScrimColor: colorNotifier.thematic.scrim,
            body: child,
          );
        },
        child: SafeArea(
          child: BlocBuilder<DeckListBloc, DeckListState>(
            buildWhen: (_, state) => state is DeckListLoaded,
            builder: (_, state) {
              return ListView(
                children: [
                  HomeHeader(),
                  const SizedBox(height: 32.0),
                  DeckListTitleBar(),
                  const SizedBox(height: 8.0),
                  if (state is DeckListLoaded)
                    ...(state).deckListViewModel.items.map<DeckListTile>(
                          (deck) => DeckListTile(
                            deckName: deck.name,
                            totalCardCount: 1000,
                            dueCardCount: 120,
                            reviewedCardCount: 2,
                            unscheduledCardCount: 500,
                          ),
                        ),
                  const SizedBox(height: 100),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      leading: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return IconButton(
            splashColor: colorNotifier.onPrimary.splashNeutral,
            highlightColor: colorNotifier.onPrimary.highlightNeutral,
            icon: const Icon(FluentIcons.list_24_regular),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        height: 300,
      ),
    );
  }
}

class _HomeFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
      child: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return FloatingActionButton(
            onPressed: () => _onPressed(context, colorNotifier),
            child: const Icon(FluentIcons.add_24_regular),
          );
        },
      ),
    );
  }

  void _onPressed(BuildContext context, ColorNotifier colorNotifier) {
    showModalBottomSheet(
      barrierColor: colorNotifier.thematic.scrim,
      context: context,
      builder: (_) => _CreateActionsMenuSheet(context: context),
    );
  }
}

class _CreateActionsMenuSheet extends StatelessWidget {
  final BuildContext context;

  _CreateActionsMenuSheet({required this.context});

  @override
  Widget build(BuildContext innerContext) {
    return Consumer<ColorNotifier>(
      builder: (_, colorNotifier, __) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 32.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CreateActionsMenuItem(
                icon: FluentIcons.slide_add_24_regular,
                text: 'Create new entry',
                onTap: _handleCreateNewEntry,
              ),
              _CreateActionsMenuItem(
                icon: FluentIcons.book_add_24_regular,
                text: 'Create new deck',
                onTap: () {
                  _handleCreateNewDeck(
                    context: context,
                    colorNotifier: colorNotifier,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleCreateNewDeck({
    required BuildContext context,
    required ColorNotifier colorNotifier,
  }) {
    Navigator.of(context).pop();

    showModalBottomSheet(
      barrierColor: colorNotifier.thematic.scrim,
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: BlocProvider.of<DeckListBloc>(context),
        child: CreateDeckSheet(
          onSuccess: (deckName) {
            _showDeckCreationSuccessSnackBar(
              context: context,
              deckName: deckName,
            );
          },
        ),
      ),
    );
  }

  void _handleCreateNewEntry() {}

  void _showDeckCreationSuccessSnackBar({
    required BuildContext context,
    required String deckName,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(deckName.length < 50
            ? 'Created deck "$deckName"!'
            : 'Created deck "${deckName.substring(0, 49)}..."!'),
      ),
    );
  }
}

class _CreateActionsMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  const _CreateActionsMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return Icon(
            icon,
            color: colorNotifier.onSurface.lowEmphasis,
          );
        },
      ),
      title: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: colorNotifier.onSurface.highEmphasis,
                ),
          );
        },
      ),
      onTap: onTap,
    );
  }
}
