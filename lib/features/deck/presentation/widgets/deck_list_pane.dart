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
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../../../../core/presentation/constants/widget_constants.dart';
import '../bloc/deck_list_bloc.dart';
import '../view_models/deck_list_view_model.dart';

class DeckListPane extends StatelessWidget {
  const DeckListPane();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeckListBloc>(
      // TODO: 6/13/2021 Why do i need to add here, why can't i do this in BLoC
      //  constructor?
      create: (_) => GetIt.instance()..add(DeckListInitialized()),
      child: Center(
        child: Column(
          children: [
            const _TopBar(),
            const _ItemList(),
            Consumer<ColorNotifier>(
              builder: (_, colorNotifier, __) {
                return Divider(
                  color: colorNotifier.onSurface.borderLight,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckListBloc, DeckListState>(
      buildWhen: (_, state) => state is DeckListLoaded,
      builder: (context, state) {
        return state is DeckListLoaded
            ? Column(
                children: [
                  ...state.deckListViewModel.items.map(
                    (viewModel) => _Item(viewModel: viewModel),
                  ),
                  Container(
                    height: WidgetConstants.spacingPadding08,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ],
              )
            : Container();
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

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
            const _TopBarTitle(),
            const Spacer(),
            const _TopBarAddIcon(),
            const _TopBarOverflowIcon(),
          ],
        ),
      ),
    );
  }
}

class _TopBarTitle extends StatelessWidget {
  const _TopBarTitle();

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, colorNotifier, __) {
        return Text(
          'My Decks',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: colorNotifier.onSurface.highEmphasis,
              ),
        );
      },
    );
  }
}

class _TopBarAddIcon extends StatelessWidget {
  const _TopBarAddIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FluentIcons.add_24_regular),
      color: Theme.of(context).colorScheme.primary,
      splashRadius: 24.0,
      onPressed: () {
        print('test');
      },
    );
  }
}

class _TopBarOverflowIcon extends StatelessWidget {
  const _TopBarOverflowIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FluentIcons.more_vertical_24_regular),
      color: Theme.of(context).colorScheme.primary,
      splashRadius: 24.0,
      onPressed: () {
        print('test');
      },
    );
  }
}

class _Item extends StatelessWidget {
  final DeckListItemViewModel viewModel;

  const _Item({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: WidgetConstants.spacingPadding08,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: Consumer<ColorNotifier>(
          builder: (_, colorNotifier, child) {
            return InkWell(
              onTap: () {},
              highlightColor: colorNotifier.onSurface.highlightPrimary,
              splashColor: colorNotifier.onSurface.splashPrimary,
              borderRadius: BorderRadius.circular(
                WidgetConstants.cornerRadius08,
              ),
              child: child,
            );
          },
          child: Card(
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(
              vertical: WidgetConstants.spacingPadding16,
              horizontal: WidgetConstants.spacingPadding08,
            ),
            elevation: 0.0,
            child: Row(
              children: [
                DeckIcon(
                  iconColorViewModel: viewModel.iconColor,
                  iconData: viewModel.iconData,
                ),
                const SizedBox(width: WidgetConstants.spacingPadding16),
                Consumer<ColorNotifier>(
                  builder: (_, colorNotifier, __) {
                    return Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              _ItemDeckName(
                                colorNotifier: colorNotifier,
                                name: viewModel.name,
                              ),
                              const Spacer(),
                              _ItemDueText(
                                colorNotifier: colorNotifier,
                                dueText: viewModel.dueText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: viewModel.hasEntries
                                ? WidgetConstants.spacingPadding08
                                : WidgetConstants.spacingPadding02,
                          ),
                          viewModel.hasEntries
                              ? _ItemProgressBar(
                                  progressPercent: viewModel.progressPercent!,
                                  hasCompletedRevision:
                                      viewModel.hasCompletedRevision!,
                                )
                              : _ItemSubtitle(
                                  colorNotifier: colorNotifier,
                                  subtitle: viewModel.subtitle,
                                ),
                          SizedBox(
                            height: viewModel.hasEntries
                                ? WidgetConstants.spacingPadding04
                                : null,
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
      ),
    );
  }
}

class _ItemProgressBar extends StatelessWidget {
  final double progressPercent;
  final bool hasCompletedRevision;

  const _ItemProgressBar({
    required this.progressPercent,
    required this.hasCompletedRevision,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, colorNotifier, __) {
        final color = hasCompletedRevision
            ? colorNotifier.onSurface.accentYellow
            : colorNotifier.onSurface.accentOrange;

        return LinearPercentIndicator(
          percent: progressPercent,
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          lineHeight: 6.0,
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        );
      },
    );
  }
}

class _ItemSubtitle extends StatelessWidget {
  final ColorNotifier colorNotifier;
  final String subtitle;

  const _ItemSubtitle({required this.colorNotifier, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.caption!.copyWith(
            color: colorNotifier.onSurface.mediumEmphasis,
          ),
    );
  }
}

class _ItemDeckName extends StatelessWidget {
  final ColorNotifier colorNotifier;
  final String name;

  const _ItemDeckName({required this.colorNotifier, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: colorNotifier.onSurface.highEmphasis,
          ),
    );
  }
}

class _ItemDueText extends StatelessWidget {
  final ColorNotifier colorNotifier;
  final String dueText;

  const _ItemDueText({required this.colorNotifier, required this.dueText});

  @override
  Widget build(BuildContext context) {
    return Text(
      dueText,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: colorNotifier.onSurface.accentOrange,
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
      builder: (_, colorNotifier, __) {
        late final Color color;
        switch (iconColorViewModel) {
          case DeckListItemIconColorViewModel.red:
            color = colorNotifier.onSurface.accentRed;
            break;
          case DeckListItemIconColorViewModel.orange:
            color = colorNotifier.onSurface.accentOrange;
            break;
          case DeckListItemIconColorViewModel.yellow:
            color = colorNotifier.onSurface.accentYellow;
            break;
          case DeckListItemIconColorViewModel.lime:
            color = colorNotifier.onSurface.accentLime;
            break;
          case DeckListItemIconColorViewModel.green:
            color = colorNotifier.onSurface.accentGreen;
            break;
          case DeckListItemIconColorViewModel.teal:
            color = colorNotifier.onSurface.accentTeal;
            break;
          case DeckListItemIconColorViewModel.cyan:
            color = colorNotifier.onSurface.accentCyan;
            break;
          case DeckListItemIconColorViewModel.sky:
            color = colorNotifier.onSurface.accentSky;
            break;
          case DeckListItemIconColorViewModel.blue:
            color = colorNotifier.onSurface.accentBlue;
            break;
          case DeckListItemIconColorViewModel.purple:
            color = colorNotifier.onSurface.accentPurple;
            break;
          case DeckListItemIconColorViewModel.pink:
            color = colorNotifier.onSurface.accentPink;
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
            iconData,
            color: colorNotifier.onAccent.highEmphasis,
          ),
        );
      },
    );
  }
}
