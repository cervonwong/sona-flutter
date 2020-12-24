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

class CreateDeckSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 24.0,
        bottom: 16.0 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              autofocus: true,
              maxLines: null,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'A cool deck name...',
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16.0,
            children: [
              ElevatedButton.icon(
                icon: Icon(FluentIcons.add_24_regular),
                label: Text('CREATE'),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(FluentIcons.arrow_download_24_regular),
                label: Text('IMPORT'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
