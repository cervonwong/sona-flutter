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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../core/presentation/change_notifiers/color_notifier.dart';
import '../features/deck/presentation/bloc/deck_bloc.dart';
import '../features/deck/presentation/widgets/create_deck_sheet.dart';
import '../features/deck/presentation/widgets/deck_list/deck_list_tile.dart';
import '../features/deck/presentation/widgets/deck_list/deck_list_title_bar.dart';
import 'shared/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeckBloc>(
      create: (_) => GetIt.instance()..add(DeckInitialized()),
      child: Consumer<ColorNotifier>(
        builder: (_, cn, child) {
          return Scaffold(
            appBar: _HomeAppBar(),
            drawer: MainDrawer(selected: SelectableDrawerDestination.home),
            floatingActionButton: _HomeFAB(),
            drawerScrimColor: cn.specific.scrimColor,
            body: child,
          );
        },
        child: SafeArea(
          child: BlocBuilder<DeckBloc, DeckState>(
            buildWhen: (_, state) => state is DeckLoaded,
            builder: (_, state) {
              return ListView(
                children: [
                  HomeHeader(),
                  SizedBox(height: 32.0),
                  DeckListTitleBar(),
                  SizedBox(height: 8.0),
                  if (state is DeckLoaded)
                    ...(state).decks.map<DeckListTile>(
                          (deck) => DeckListTile(
                            deckName: deck.name,
                            totalCardCount: 1000,
                            dueCardCount: 120,
                            reviewedCardCount: 2,
                            unscheduledCardCount: 500,
                          ),
                        ),
                  SizedBox(height: 100),
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
      title: Text('Home'),
      leading: Consumer<ColorNotifier>(
        builder: (_, cn, __) {
          return IconButton(
            splashColor: cn.onPrimary.splashColor,
            highlightColor: cn.onPrimary.highlightColor,
            icon: Icon(FluentIcons.list_24_regular),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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
        builder: (_, cn, __) {
          return FloatingActionButton(
            onPressed: () => _onPressed(context, cn),
            child: Icon(FluentIcons.add_24_regular),
          );
        },
      ),
    );
  }

  void _onPressed(BuildContext context, ColorNotifier cn) {
    showModalBottomSheet(
      barrierColor: cn.specific.scrimColor,
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: BlocProvider.of<DeckBloc>(context),
        child: CreateDeckSheet(
          onSuccess: (deckName) {
            _showCreationSuccessSnackBar(
              context: context,
              deckName: deckName,
            );
          },
        ),
      ),
    );
  }

  void _showCreationSuccessSnackBar({
    @required BuildContext context,
    @required String deckName,
  }) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(deckName.length < 50
            ? 'Created deck "$deckName"!'
            : 'Created deck "${deckName.substring(0, 49)}..."!'),
      ),
    );
  }
}
