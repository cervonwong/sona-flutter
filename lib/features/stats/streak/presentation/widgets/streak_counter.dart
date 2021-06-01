// @dart=2.9

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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/change_notifiers/color_notifier.dart';
import '../../../../../core/presentation/constants/widget_constants.dart';

class StreakCounter extends StatelessWidget {
  final int streakCount;
  final bool isActive;

  const StreakCounter({
    @required this.streakCount,
    @required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifier>(
      builder: (_, cn, __) {
        return Row(
          children: [
            Icon(
              isActive
                  ? FluentIcons.target_arrow_16_regular
                  : FluentIcons.target_16_regular,
              color: isActive
                  ? cn.onSurface.accentYellow
                  : cn.onSurface.lowEmphasis,
              size: 32.0,
            ),
            const SizedBox(width: WidgetConstants.spacingPadding04),
            Text(
              '$streakCount',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: isActive
                        ? cn.onSurface.accentYellow
                        : cn.onSurface.lowEmphasis,
                  ),
            ),
            const SizedBox(width: WidgetConstants.spacingPadding16),
          ],
        );
      },
    );
  }
}
