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

import '../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../../../../core/presentation/constants/widget_constants.dart';
import '../bloc/deck_list_bloc.dart';
import '../view_models/deck_list_view_model.dart';

class DeckListPane extends StatelessWidget {
  const DeckListPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeckListBloc>(
      // TODO: 6/13/2021 Why do i need to add here, why can't i do this in BLoC
      //  constructor?
      create: (_) => GetIt.instance()..add(DeckListInitialized()),
      child: Center(
        child: Column(
          children: [
            const DeckListTopBar(),
            BlocBuilder<DeckListBloc, DeckListState>(
              buildWhen: (_, state) => state is DeckListLoaded,
              builder: (context, state) {
                return state is DeckListLoaded
                    ? Column(
                        children: [
                          ...state.deckListViewModel.items.map(
                            (item) => DeckListItem(viewModel: item),
                          ),
                        ],
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeckListTopBar extends StatelessWidget {
  const DeckListTopBar();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          WidgetConstants.spacingPadding16,
          WidgetConstants.spacingPadding08,
          0.0,
          0.0,
        ),
        child: Row(
          children: [
            Consumer<ColorNotifier>(
              builder: (_, cn, __) {
                return Text(
                  'My Decks',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: cn.onSurface.highEmphasis,
                      ),
                );
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(FluentIcons.add_24_regular),
              color: Theme.of(context).colorScheme.primary,
              splashRadius: 24.0,
              onPressed: () {
                print('test');
              },
            ),
            IconButton(
              icon: const Icon(FluentIcons.more_vertical_24_regular),
              color: Theme.of(context).colorScheme.primary,
              splashRadius: 24.0,
              onPressed: () {
                print('test');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeckListItem extends StatelessWidget {
  final DeckListItemViewModel viewModel;

  const DeckListItem({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Consumer<ColorNotifier>(
        builder: (_, cn, child) {
          return InkWell(
            onTap: () {},
            onLongPress: () {},
            highlightColor: cn.onSurface.highlightPrimary,
            splashColor: cn.onSurface.splashPrimary,
            child: child,
          );
        },
        child: Card(
          color: Colors.transparent,
          margin: const EdgeInsets.all(WidgetConstants.spacingPadding16),
          elevation: 0.0,
          child: Row(
            children: [
              DeckIcon(
                iconColorViewModel: viewModel.iconColor,
                iconData: viewModel.iconData,
              ),
              const SizedBox(width: WidgetConstants.spacingPadding16),
              Consumer<ColorNotifier>(
                builder: (_, cn, __) {
                  return Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              viewModel.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: cn.onSurface.highEmphasis,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              viewModel.dueText,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: cn.onSurface.accentOrange,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: WidgetConstants.spacingPadding02,
                        ),
                        Text(
                          viewModel.subtitle,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: cn.onSurface.mediumEmphasis,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeckIcon extends StatelessWidget {
  final DeckListItemIconColorViewModel iconColorViewModel;
  final IconData iconData;

  DeckIcon({
    required this.iconColorViewModel,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        late final Color color;
        switch (iconColorViewModel) {
          case DeckListItemIconColorViewModel.red:
            color = cn.onSurface.accentRed;
            break;
          case DeckListItemIconColorViewModel.orange:
            color = cn.onSurface.accentOrange;
            break;
          case DeckListItemIconColorViewModel.yellow:
            color = cn.onSurface.accentYellow;
            break;
          case DeckListItemIconColorViewModel.lime:
            color = cn.onSurface.accentLime;
            break;
          case DeckListItemIconColorViewModel.green:
            color = cn.onSurface.accentGreen;
            break;
          case DeckListItemIconColorViewModel.teal:
            color = cn.onSurface.accentTeal;
            break;
          case DeckListItemIconColorViewModel.cyan:
            color = cn.onSurface.accentCyan;
            break;
          case DeckListItemIconColorViewModel.sky:
            color = cn.onSurface.accentSky;
            break;
          case DeckListItemIconColorViewModel.blue:
            color = cn.onSurface.accentBlue;
            break;
          case DeckListItemIconColorViewModel.purple:
            color = cn.onSurface.accentPurple;
            break;
          case DeckListItemIconColorViewModel.pink:
            color = cn.onSurface.accentPink;
            break;
        }

        return Container(
          height: 40.0,
          width: 40.0,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: color,
          ),
          child: Icon(
            FluentIcons.collections_24_regular,
            color: cn.onAccent.highEmphasis,
          ),
        );
      },
    );
  }
}
