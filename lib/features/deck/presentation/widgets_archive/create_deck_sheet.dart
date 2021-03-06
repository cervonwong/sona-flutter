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
import 'package:flutter/services.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../bloc/deck_list_bloc.dart';

typedef OnSuccess = void Function(String deckName);

class CreateDeckSheet extends StatefulWidget {
  final OnSuccess onSuccess;

  CreateDeckSheet({required this.onSuccess});

  @override
  _CreateDeckSheetState createState() => _CreateDeckSheetState();
}

class _CreateDeckSheetState extends State<CreateDeckSheet> {
  final _controller = TextEditingController();

  String _deckName = '';
  bool _hasClickedCreated = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _deckName = _controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeckListBloc, DeckListState>(
      listener: (context, state) {
        if (state is DeckListLoaded) {
          _handleDeckCreationSuccess(context: context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 32.0,
          bottom: 16.0 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _DeckNameTextField(controller: _controller),
            BlocBuilder<DeckListBloc, DeckListState>(
              builder: (_, state) {
                if (state is DeckNameAlreadyExists && _hasClickedCreated) {
                  return _DeckNameAlreadyExistsMessage();
                }
                return Container();
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(FluentIcons.add_24_regular),
              label: const Text('CREATE'),
              onPressed: _deckName.isEmpty
                  ? null
                  : () {
                      _createDeck(context: context);
                    },
            ),
          ],
        ),
      ),
    );
  }

  void _createDeck({required BuildContext context}) {
    setState(() {
      _hasClickedCreated = true;
    });
    BlocProvider.of<DeckListBloc>(context).add(DeckCreated(name: _deckName));
  }

  void _handleDeckCreationSuccess({required BuildContext context}) {
    Navigator.of(context).pop();
    widget.onSuccess(_deckName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _DeckNameTextField extends StatelessWidget {
  final TextEditingController _controller;

  _DeckNameTextField({
    required TextEditingController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<ColorNotifier>(
        builder: (_, colorNotifier, __) {
          return TextField(
            controller: _controller,
            autofocus: true,
            maxLines: null,
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter,
            ],
            textInputAction: TextInputAction.done,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: colorNotifier.onSurface.highEmphasis,
                ),
            decoration: const InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: 'A cool deck name...',
            ),
          );
        },
      ),
    );
  }
}

class _DeckNameAlreadyExistsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Row(
          children: [
            Icon(
              FluentIcons.emoji_surprise_24_regular,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                'There\'s already a deck with this name!',
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
