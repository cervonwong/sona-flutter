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

class DeckViewAppBar extends StatelessWidget implements PreferredSizeWidget {
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

  void _clearTextField() => _controller.clear();

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
            onPressed: _clearTextField,
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

