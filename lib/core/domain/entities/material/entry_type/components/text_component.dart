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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'component.dart';

@immutable
class TextComponent extends Component with EquatableMixin {
  final String data;
  final TextComponentStyle style;

  TextComponent({
    @required String name,
    @required this.data,
    this.style = const TextComponentStyle(),
  })  : assert(name != null),
        assert(data != null),
        assert(style != null),
        super(name: name, type: ComponentType.text);

  TextComponent copyWith({
    String name,
    String data,
    TextComponentStyle style,
  }) {
    return TextComponent(
      name: name ?? this.name,
      data: data ?? this.data,
      style: style ?? this.style,
    );
  }

  @override
  List<Object> get props => [
        name,
        data,
        style,
      ];
}

class TextComponentStyle extends Equatable {
  final double size;
  final TextComponentAlignment alignment;
  final TextComponentFillColor fillColor;
  final TextComponentHighlightColor highlightColor;
  final bool isBold;
  final bool isItalic;
  final bool isUnderlined;

  const TextComponentStyle({
    this.size = 1.0,
    this.alignment = TextComponentAlignment.center,
    this.fillColor = TextComponentFillColor.neutral,
    this.highlightColor = TextComponentHighlightColor.none,
    this.isBold = false,
    this.isItalic = false,
    this.isUnderlined = false,
  })  : assert(size != null),
        assert(alignment != null),
        assert(fillColor != null),
        assert(highlightColor != null),
        assert(isBold != null),
        assert(isItalic != null),
        assert(isUnderlined != null),
        assert(size >= 0.1),
        assert(size <= 10.0);

  TextComponentStyle copyWith({
    double size,
    TextComponentAlignment alignment,
    TextComponentFillColor fillColor,
    TextComponentHighlightColor highlightColor,
    bool isBold,
    bool isItalic,
    bool isUnderlined,
  }) {
    return TextComponentStyle(
      size: size ?? this.size,
      alignment: alignment ?? this.alignment,
      fillColor: fillColor ?? this.fillColor,
      highlightColor: highlightColor ?? this.highlightColor,
      isBold: isBold ?? this.isBold,
      isItalic: isItalic ?? this.isItalic,
      isUnderlined: isUnderlined ?? this.isUnderlined,
    );
  }

  @override
  List<Object> get props => [
        size,
        alignment,
        fillColor,
        highlightColor,
        isBold,
        isItalic,
        isUnderlined,
      ];
}

enum TextComponentAlignment {
  center,
  start,
  end,
  justify,
}

enum TextComponentFillColor {
  neutral, // Black or white, depending on the theme.
  red,
  orange,
  yellow,
  blue,
  purple,
  magenta,
  brown,
}

enum TextComponentHighlightColor {
  none, // No highlight.
  pink,
  orange,
  yellow,
  green,
  blue,
  purple,
}
