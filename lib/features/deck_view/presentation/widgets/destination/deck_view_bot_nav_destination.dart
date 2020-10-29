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
import 'package:sona_flutter/core/constants/app_colors.dart';
import 'package:sona_flutter/core/presentation/bottom_navigation/bot_nav_destination.dart';

class DeckViewBotNavDestination extends BotNavDestination {
  DeckViewBotNavDestination()
      : super(
          appBar: _TextFieldAppBar(),
          label: 'Decks',
          icon: Icon(FluentIcons.dictionary_24_regular),
          activeIcon: Icon(FluentIcons.dictionary_24_filled),
        );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 50; i++)
          Ink(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
              title: Text(
                'Deck Title',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                '15 Due · 1000 Total · 90% Seen',
                style: Theme.of(context).textTheme.caption,
              ),
              leading: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color:
                        i % 2 == 0 ? kSecondaryCyanColor : kSecondaryPinkColor,
                  ),
                ),
              ),
              onTap: () => print('Tapped'),
            ),
          ),
      ],
    );
  }
}

class _TextFieldAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: _AppBarTextField(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarTextField extends StatefulWidget {
  @override
  _AppBarTextFieldState createState() => _AppBarTextFieldState();
}

class _AppBarTextFieldState extends State<_AppBarTextField>
    with WidgetsBindingObserver {
  // To unfocus TextField when keyboard is retracted.
  // See also: initState(), didChangeMetrics, dispose()
  final _focusNode = FocusNode();

  // To clear the TextField when clear button is pressed.
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initWidgetsBinding();
  }

  void clearTextField() => _controller.clear();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search Decks...',
        border: InputBorder.none,
        icon: const Icon(FluentIcons.book_formula_lookup_24_regular),
        suffixIcon: Container(
          child: IconButton(
            icon: Icon(FluentIcons.dismiss_24_regular),
            onPressed: clearTextField,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 40.0,
          maxWidth: 40.0,
        ),
      ),
    );
  }

  // WidgetsBinding / FocusNode methods

  void _initWidgetsBinding() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance.window.viewInsets.bottom;
    if (value == 0) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.dispose();
    super.dispose();
  }
}
