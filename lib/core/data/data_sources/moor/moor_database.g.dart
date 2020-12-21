// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AlignmentModel extends DataClass implements Insertable<AlignmentModel> {
  final int id;
  final String name;
  AlignmentModel({@required this.id, @required this.name});
  factory AlignmentModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return AlignmentModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  AlignmentsCompanion toCompanion(bool nullToAbsent) {
    return AlignmentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory AlignmentModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AlignmentModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  AlignmentModel copyWith({int id, String name}) => AlignmentModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('AlignmentModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AlignmentModel &&
          other.id == this.id &&
          other.name == this.name);
}

class AlignmentsCompanion extends UpdateCompanion<AlignmentModel> {
  final Value<int> id;
  final Value<String> name;
  const AlignmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  AlignmentsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<AlignmentModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  AlignmentsCompanion copyWith({Value<int> id, Value<String> name}) {
    return AlignmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlignmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AlignmentsTable extends Alignments
    with TableInfo<$AlignmentsTable, AlignmentModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $AlignmentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $AlignmentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'alignments';
  @override
  final String actualTableName = 'alignments';
  @override
  VerificationContext validateIntegrity(Insertable<AlignmentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlignmentModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AlignmentModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AlignmentsTable createAlias(String alias) {
    return $AlignmentsTable(_db, alias);
  }
}

class CardModel extends DataClass implements Insertable<CardModel> {
  final int id;
  final int entryId;
  final bool starred;
  final bool hidden;
  CardModel(
      {@required this.id,
      @required this.entryId,
      @required this.starred,
      @required this.hidden});
  factory CardModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CardModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      entryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}entry_id']),
      starred:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}starred']),
      hidden:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}hidden']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    if (!nullToAbsent || starred != null) {
      map['starred'] = Variable<bool>(starred);
    }
    if (!nullToAbsent || hidden != null) {
      map['hidden'] = Variable<bool>(hidden);
    }
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      starred: starred == null && nullToAbsent
          ? const Value.absent()
          : Value(starred),
      hidden:
          hidden == null && nullToAbsent ? const Value.absent() : Value(hidden),
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CardModel(
      id: serializer.fromJson<int>(json['id']),
      entryId: serializer.fromJson<int>(json['entryId']),
      starred: serializer.fromJson<bool>(json['starred']),
      hidden: serializer.fromJson<bool>(json['hidden']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entryId': serializer.toJson<int>(entryId),
      'starred': serializer.toJson<bool>(starred),
      'hidden': serializer.toJson<bool>(hidden),
    };
  }

  CardModel copyWith({int id, int entryId, bool starred, bool hidden}) =>
      CardModel(
        id: id ?? this.id,
        entryId: entryId ?? this.entryId,
        starred: starred ?? this.starred,
        hidden: hidden ?? this.hidden,
      );
  @override
  String toString() {
    return (StringBuffer('CardModel(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('starred: $starred, ')
          ..write('hidden: $hidden')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(entryId.hashCode, $mrjc(starred.hashCode, hidden.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CardModel &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.starred == this.starred &&
          other.hidden == this.hidden);
}

class CardsCompanion extends UpdateCompanion<CardModel> {
  final Value<int> id;
  final Value<int> entryId;
  final Value<bool> starred;
  final Value<bool> hidden;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.starred = const Value.absent(),
    this.hidden = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    @required int entryId,
    @required bool starred,
    @required bool hidden,
  })  : entryId = Value(entryId),
        starred = Value(starred),
        hidden = Value(hidden);
  static Insertable<CardModel> custom({
    Expression<int> id,
    Expression<int> entryId,
    Expression<bool> starred,
    Expression<bool> hidden,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (starred != null) 'starred': starred,
      if (hidden != null) 'hidden': hidden,
    });
  }

  CardsCompanion copyWith(
      {Value<int> id,
      Value<int> entryId,
      Value<bool> starred,
      Value<bool> hidden}) {
    return CardsCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      starred: starred ?? this.starred,
      hidden: hidden ?? this.hidden,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (starred.present) {
      map['starred'] = Variable<bool>(starred.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('starred: $starred, ')
          ..write('hidden: $hidden')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, CardModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $CardsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _entryIdMeta = const VerificationMeta('entryId');
  GeneratedIntColumn _entryId;
  @override
  GeneratedIntColumn get entryId => _entryId ??= _constructEntryId();
  GeneratedIntColumn _constructEntryId() {
    return GeneratedIntColumn('entry_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entries(id)');
  }

  final VerificationMeta _starredMeta = const VerificationMeta('starred');
  GeneratedBoolColumn _starred;
  @override
  GeneratedBoolColumn get starred => _starred ??= _constructStarred();
  GeneratedBoolColumn _constructStarred() {
    return GeneratedBoolColumn(
      'starred',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  GeneratedBoolColumn _hidden;
  @override
  GeneratedBoolColumn get hidden => _hidden ??= _constructHidden();
  GeneratedBoolColumn _constructHidden() {
    return GeneratedBoolColumn(
      'hidden',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, entryId, starred, hidden];
  @override
  $CardsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cards';
  @override
  final String actualTableName = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<CardModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id'], _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('starred')) {
      context.handle(_starredMeta,
          starred.isAcceptableOrUnknown(data['starred'], _starredMeta));
    } else if (isInserting) {
      context.missing(_starredMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden'], _hiddenMeta));
    } else if (isInserting) {
      context.missing(_hiddenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CardModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(_db, alias);
  }
}

class CardFormatModel extends DataClass implements Insertable<CardFormatModel> {
  final int entryTypeId;
  final int position;
  final String name;
  final int frontStructureId;
  final int backStructureId;
  CardFormatModel(
      {@required this.entryTypeId,
      @required this.position,
      @required this.name,
      @required this.frontStructureId,
      @required this.backStructureId});
  factory CardFormatModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CardFormatModel(
      entryTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_type_id']),
      position:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}position']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      frontStructureId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}front_structure_id']),
      backStructureId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}back_structure_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || entryTypeId != null) {
      map['entry_type_id'] = Variable<int>(entryTypeId);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int>(position);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || frontStructureId != null) {
      map['front_structure_id'] = Variable<int>(frontStructureId);
    }
    if (!nullToAbsent || backStructureId != null) {
      map['back_structure_id'] = Variable<int>(backStructureId);
    }
    return map;
  }

  CardFormatsCompanion toCompanion(bool nullToAbsent) {
    return CardFormatsCompanion(
      entryTypeId: entryTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryTypeId),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      frontStructureId: frontStructureId == null && nullToAbsent
          ? const Value.absent()
          : Value(frontStructureId),
      backStructureId: backStructureId == null && nullToAbsent
          ? const Value.absent()
          : Value(backStructureId),
    );
  }

  factory CardFormatModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CardFormatModel(
      entryTypeId: serializer.fromJson<int>(json['entryTypeId']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      frontStructureId: serializer.fromJson<int>(json['frontStructureId']),
      backStructureId: serializer.fromJson<int>(json['backStructureId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryTypeId': serializer.toJson<int>(entryTypeId),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'frontStructureId': serializer.toJson<int>(frontStructureId),
      'backStructureId': serializer.toJson<int>(backStructureId),
    };
  }

  CardFormatModel copyWith(
          {int entryTypeId,
          int position,
          String name,
          int frontStructureId,
          int backStructureId}) =>
      CardFormatModel(
        entryTypeId: entryTypeId ?? this.entryTypeId,
        position: position ?? this.position,
        name: name ?? this.name,
        frontStructureId: frontStructureId ?? this.frontStructureId,
        backStructureId: backStructureId ?? this.backStructureId,
      );
  @override
  String toString() {
    return (StringBuffer('CardFormatModel(')
          ..write('entryTypeId: $entryTypeId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('frontStructureId: $frontStructureId, ')
          ..write('backStructureId: $backStructureId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      entryTypeId.hashCode,
      $mrjc(
          position.hashCode,
          $mrjc(name.hashCode,
              $mrjc(frontStructureId.hashCode, backStructureId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CardFormatModel &&
          other.entryTypeId == this.entryTypeId &&
          other.position == this.position &&
          other.name == this.name &&
          other.frontStructureId == this.frontStructureId &&
          other.backStructureId == this.backStructureId);
}

class CardFormatsCompanion extends UpdateCompanion<CardFormatModel> {
  final Value<int> entryTypeId;
  final Value<int> position;
  final Value<String> name;
  final Value<int> frontStructureId;
  final Value<int> backStructureId;
  const CardFormatsCompanion({
    this.entryTypeId = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.frontStructureId = const Value.absent(),
    this.backStructureId = const Value.absent(),
  });
  CardFormatsCompanion.insert({
    @required int entryTypeId,
    @required int position,
    @required String name,
    @required int frontStructureId,
    @required int backStructureId,
  })  : entryTypeId = Value(entryTypeId),
        position = Value(position),
        name = Value(name),
        frontStructureId = Value(frontStructureId),
        backStructureId = Value(backStructureId);
  static Insertable<CardFormatModel> custom({
    Expression<int> entryTypeId,
    Expression<int> position,
    Expression<String> name,
    Expression<int> frontStructureId,
    Expression<int> backStructureId,
  }) {
    return RawValuesInsertable({
      if (entryTypeId != null) 'entry_type_id': entryTypeId,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (frontStructureId != null) 'front_structure_id': frontStructureId,
      if (backStructureId != null) 'back_structure_id': backStructureId,
    });
  }

  CardFormatsCompanion copyWith(
      {Value<int> entryTypeId,
      Value<int> position,
      Value<String> name,
      Value<int> frontStructureId,
      Value<int> backStructureId}) {
    return CardFormatsCompanion(
      entryTypeId: entryTypeId ?? this.entryTypeId,
      position: position ?? this.position,
      name: name ?? this.name,
      frontStructureId: frontStructureId ?? this.frontStructureId,
      backStructureId: backStructureId ?? this.backStructureId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryTypeId.present) {
      map['entry_type_id'] = Variable<int>(entryTypeId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (frontStructureId.present) {
      map['front_structure_id'] = Variable<int>(frontStructureId.value);
    }
    if (backStructureId.present) {
      map['back_structure_id'] = Variable<int>(backStructureId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardFormatsCompanion(')
          ..write('entryTypeId: $entryTypeId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('frontStructureId: $frontStructureId, ')
          ..write('backStructureId: $backStructureId')
          ..write(')'))
        .toString();
  }
}

class $CardFormatsTable extends CardFormats
    with TableInfo<$CardFormatsTable, CardFormatModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $CardFormatsTable(this._db, [this._alias]);
  final VerificationMeta _entryTypeIdMeta =
      const VerificationMeta('entryTypeId');
  GeneratedIntColumn _entryTypeId;
  @override
  GeneratedIntColumn get entryTypeId =>
      _entryTypeId ??= _constructEntryTypeId();
  GeneratedIntColumn _constructEntryTypeId() {
    return GeneratedIntColumn('entry_type_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entry_types(id)');
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedIntColumn _position;
  @override
  GeneratedIntColumn get position => _position ??= _constructPosition();
  GeneratedIntColumn _constructPosition() {
    return GeneratedIntColumn('position', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _frontStructureIdMeta =
      const VerificationMeta('frontStructureId');
  GeneratedIntColumn _frontStructureId;
  @override
  GeneratedIntColumn get frontStructureId =>
      _frontStructureId ??= _constructFrontStructureId();
  GeneratedIntColumn _constructFrontStructureId() {
    return GeneratedIntColumn('front_structure_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES structures(id)');
  }

  final VerificationMeta _backStructureIdMeta =
      const VerificationMeta('backStructureId');
  GeneratedIntColumn _backStructureId;
  @override
  GeneratedIntColumn get backStructureId =>
      _backStructureId ??= _constructBackStructureId();
  GeneratedIntColumn _constructBackStructureId() {
    return GeneratedIntColumn('back_structure_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES structures(id)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [entryTypeId, position, name, frontStructureId, backStructureId];
  @override
  $CardFormatsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'card_formats';
  @override
  final String actualTableName = 'card_formats';
  @override
  VerificationContext validateIntegrity(Insertable<CardFormatModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_type_id')) {
      context.handle(
          _entryTypeIdMeta,
          entryTypeId.isAcceptableOrUnknown(
              data['entry_type_id'], _entryTypeIdMeta));
    } else if (isInserting) {
      context.missing(_entryTypeIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('front_structure_id')) {
      context.handle(
          _frontStructureIdMeta,
          frontStructureId.isAcceptableOrUnknown(
              data['front_structure_id'], _frontStructureIdMeta));
    } else if (isInserting) {
      context.missing(_frontStructureIdMeta);
    }
    if (data.containsKey('back_structure_id')) {
      context.handle(
          _backStructureIdMeta,
          backStructureId.isAcceptableOrUnknown(
              data['back_structure_id'], _backStructureIdMeta));
    } else if (isInserting) {
      context.missing(_backStructureIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryTypeId, position};
  @override
  CardFormatModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CardFormatModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CardFormatsTable createAlias(String alias) {
    return $CardFormatsTable(_db, alias);
  }
}

class ComponentModel extends DataClass implements Insertable<ComponentModel> {
  final int structureId;
  final int position;
  final int componentTypeId;
  final String name;
  ComponentModel(
      {@required this.structureId,
      @required this.position,
      @required this.componentTypeId,
      @required this.name});
  factory ComponentModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ComponentModel(
      structureId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}structure_id']),
      position:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}position']),
      componentTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}component_type_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || structureId != null) {
      map['structure_id'] = Variable<int>(structureId);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int>(position);
    }
    if (!nullToAbsent || componentTypeId != null) {
      map['component_type_id'] = Variable<int>(componentTypeId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ComponentsCompanion toCompanion(bool nullToAbsent) {
    return ComponentsCompanion(
      structureId: structureId == null && nullToAbsent
          ? const Value.absent()
          : Value(structureId),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      componentTypeId: componentTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(componentTypeId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory ComponentModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ComponentModel(
      structureId: serializer.fromJson<int>(json['structureId']),
      position: serializer.fromJson<int>(json['position']),
      componentTypeId: serializer.fromJson<int>(json['componentTypeId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'structureId': serializer.toJson<int>(structureId),
      'position': serializer.toJson<int>(position),
      'componentTypeId': serializer.toJson<int>(componentTypeId),
      'name': serializer.toJson<String>(name),
    };
  }

  ComponentModel copyWith(
          {int structureId, int position, int componentTypeId, String name}) =>
      ComponentModel(
        structureId: structureId ?? this.structureId,
        position: position ?? this.position,
        componentTypeId: componentTypeId ?? this.componentTypeId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ComponentModel(')
          ..write('structureId: $structureId, ')
          ..write('position: $position, ')
          ..write('componentTypeId: $componentTypeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      structureId.hashCode,
      $mrjc(
          position.hashCode, $mrjc(componentTypeId.hashCode, name.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ComponentModel &&
          other.structureId == this.structureId &&
          other.position == this.position &&
          other.componentTypeId == this.componentTypeId &&
          other.name == this.name);
}

class ComponentsCompanion extends UpdateCompanion<ComponentModel> {
  final Value<int> structureId;
  final Value<int> position;
  final Value<int> componentTypeId;
  final Value<String> name;
  const ComponentsCompanion({
    this.structureId = const Value.absent(),
    this.position = const Value.absent(),
    this.componentTypeId = const Value.absent(),
    this.name = const Value.absent(),
  });
  ComponentsCompanion.insert({
    @required int structureId,
    @required int position,
    @required int componentTypeId,
    @required String name,
  })  : structureId = Value(structureId),
        position = Value(position),
        componentTypeId = Value(componentTypeId),
        name = Value(name);
  static Insertable<ComponentModel> custom({
    Expression<int> structureId,
    Expression<int> position,
    Expression<int> componentTypeId,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (structureId != null) 'structure_id': structureId,
      if (position != null) 'position': position,
      if (componentTypeId != null) 'component_type_id': componentTypeId,
      if (name != null) 'name': name,
    });
  }

  ComponentsCompanion copyWith(
      {Value<int> structureId,
      Value<int> position,
      Value<int> componentTypeId,
      Value<String> name}) {
    return ComponentsCompanion(
      structureId: structureId ?? this.structureId,
      position: position ?? this.position,
      componentTypeId: componentTypeId ?? this.componentTypeId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (structureId.present) {
      map['structure_id'] = Variable<int>(structureId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (componentTypeId.present) {
      map['component_type_id'] = Variable<int>(componentTypeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentsCompanion(')
          ..write('structureId: $structureId, ')
          ..write('position: $position, ')
          ..write('componentTypeId: $componentTypeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ComponentsTable extends Components
    with TableInfo<$ComponentsTable, ComponentModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ComponentsTable(this._db, [this._alias]);
  final VerificationMeta _structureIdMeta =
      const VerificationMeta('structureId');
  GeneratedIntColumn _structureId;
  @override
  GeneratedIntColumn get structureId =>
      _structureId ??= _constructStructureId();
  GeneratedIntColumn _constructStructureId() {
    return GeneratedIntColumn('structure_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES structures(id)');
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedIntColumn _position;
  @override
  GeneratedIntColumn get position => _position ??= _constructPosition();
  GeneratedIntColumn _constructPosition() {
    return GeneratedIntColumn('position', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  final VerificationMeta _componentTypeIdMeta =
      const VerificationMeta('componentTypeId');
  GeneratedIntColumn _componentTypeId;
  @override
  GeneratedIntColumn get componentTypeId =>
      _componentTypeId ??= _constructComponentTypeId();
  GeneratedIntColumn _constructComponentTypeId() {
    return GeneratedIntColumn('component_type_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES component_types(id)');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [structureId, position, componentTypeId, name];
  @override
  $ComponentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'components';
  @override
  final String actualTableName = 'components';
  @override
  VerificationContext validateIntegrity(Insertable<ComponentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('structure_id')) {
      context.handle(
          _structureIdMeta,
          structureId.isAcceptableOrUnknown(
              data['structure_id'], _structureIdMeta));
    } else if (isInserting) {
      context.missing(_structureIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('component_type_id')) {
      context.handle(
          _componentTypeIdMeta,
          componentTypeId.isAcceptableOrUnknown(
              data['component_type_id'], _componentTypeIdMeta));
    } else if (isInserting) {
      context.missing(_componentTypeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {structureId, position};
  @override
  ComponentModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ComponentModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ComponentsTable createAlias(String alias) {
    return $ComponentsTable(_db, alias);
  }
}

class ComponentTypeModel extends DataClass
    implements Insertable<ComponentTypeModel> {
  final int id;
  final String name;
  ComponentTypeModel({@required this.id, @required this.name});
  factory ComponentTypeModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ComponentTypeModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ComponentTypesCompanion toCompanion(bool nullToAbsent) {
    return ComponentTypesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory ComponentTypeModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ComponentTypeModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ComponentTypeModel copyWith({int id, String name}) => ComponentTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ComponentTypeModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ComponentTypeModel &&
          other.id == this.id &&
          other.name == this.name);
}

class ComponentTypesCompanion extends UpdateCompanion<ComponentTypeModel> {
  final Value<int> id;
  final Value<String> name;
  const ComponentTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ComponentTypesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<ComponentTypeModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ComponentTypesCompanion copyWith({Value<int> id, Value<String> name}) {
    return ComponentTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComponentTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ComponentTypesTable extends ComponentTypes
    with TableInfo<$ComponentTypesTable, ComponentTypeModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ComponentTypesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $ComponentTypesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'component_types';
  @override
  final String actualTableName = 'component_types';
  @override
  VerificationContext validateIntegrity(Insertable<ComponentTypeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComponentTypeModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ComponentTypeModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ComponentTypesTable createAlias(String alias) {
    return $ComponentTypesTable(_db, alias);
  }
}

class DeckModel extends DataClass implements Insertable<DeckModel> {
  final int id;
  final String name;
  final DateTime created;
  final DateTime lastEdited;
  final String authorName;
  final String description;
  DeckModel(
      {@required this.id,
      @required this.name,
      @required this.created,
      @required this.lastEdited,
      this.authorName,
      this.description});
  factory DeckModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DeckModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
      lastEdited: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_edited']),
      authorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}author_name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || created != null) {
      map['created'] = Variable<DateTime>(created);
    }
    if (!nullToAbsent || lastEdited != null) {
      map['last_edited'] = Variable<DateTime>(lastEdited);
    }
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String>(authorName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  DecksCompanion toCompanion(bool nullToAbsent) {
    return DecksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      lastEdited: lastEdited == null && nullToAbsent
          ? const Value.absent()
          : Value(lastEdited),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory DeckModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DeckModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created: serializer.fromJson<DateTime>(json['created']),
      lastEdited: serializer.fromJson<DateTime>(json['lastEdited']),
      authorName: serializer.fromJson<String>(json['authorName']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'created': serializer.toJson<DateTime>(created),
      'lastEdited': serializer.toJson<DateTime>(lastEdited),
      'authorName': serializer.toJson<String>(authorName),
      'description': serializer.toJson<String>(description),
    };
  }

  DeckModel copyWith(
          {int id,
          String name,
          DateTime created,
          DateTime lastEdited,
          String authorName,
          String description}) =>
      DeckModel(
        id: id ?? this.id,
        name: name ?? this.name,
        created: created ?? this.created,
        lastEdited: lastEdited ?? this.lastEdited,
        authorName: authorName ?? this.authorName,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('DeckModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('lastEdited: $lastEdited, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              created.hashCode,
              $mrjc(lastEdited.hashCode,
                  $mrjc(authorName.hashCode, description.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DeckModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.created == this.created &&
          other.lastEdited == this.lastEdited &&
          other.authorName == this.authorName &&
          other.description == this.description);
}

class DecksCompanion extends UpdateCompanion<DeckModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> created;
  final Value<DateTime> lastEdited;
  final Value<String> authorName;
  final Value<String> description;
  const DecksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created = const Value.absent(),
    this.lastEdited = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
  });
  DecksCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.created = const Value.absent(),
    this.lastEdited = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<DeckModel> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> created,
    Expression<DateTime> lastEdited,
    Expression<String> authorName,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
      if (lastEdited != null) 'last_edited': lastEdited,
      if (authorName != null) 'author_name': authorName,
      if (description != null) 'description': description,
    });
  }

  DecksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> created,
      Value<DateTime> lastEdited,
      Value<String> authorName,
      Value<String> description}) {
    return DecksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      lastEdited: lastEdited ?? this.lastEdited,
      authorName: authorName ?? this.authorName,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (lastEdited.present) {
      map['last_edited'] = Variable<DateTime>(lastEdited.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('lastEdited: $lastEdited, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $DecksTable extends Decks with TableInfo<$DecksTable, DeckModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $DecksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedDateTimeColumn _created;
  @override
  GeneratedDateTimeColumn get created => _created ??= _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _lastEditedMeta = const VerificationMeta('lastEdited');
  GeneratedDateTimeColumn _lastEdited;
  @override
  GeneratedDateTimeColumn get lastEdited =>
      _lastEdited ??= _constructLastEdited();
  GeneratedDateTimeColumn _constructLastEdited() {
    return GeneratedDateTimeColumn('last_edited', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _authorNameMeta = const VerificationMeta('authorName');
  GeneratedTextColumn _authorName;
  @override
  GeneratedTextColumn get authorName => _authorName ??= _constructAuthorName();
  GeneratedTextColumn _constructAuthorName() {
    return GeneratedTextColumn(
      'author_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, created, lastEdited, authorName, description];
  @override
  $DecksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'decks';
  @override
  final String actualTableName = 'decks';
  @override
  VerificationContext validateIntegrity(Insertable<DeckModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created'], _createdMeta));
    }
    if (data.containsKey('last_edited')) {
      context.handle(
          _lastEditedMeta,
          lastEdited.isAcceptableOrUnknown(
              data['last_edited'], _lastEditedMeta));
    }
    if (data.containsKey('author_name')) {
      context.handle(
          _authorNameMeta,
          authorName.isAcceptableOrUnknown(
              data['author_name'], _authorNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeckModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DeckModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DecksTable createAlias(String alias) {
    return $DecksTable(_db, alias);
  }
}

class EntryModel extends DataClass implements Insertable<EntryModel> {
  final int id;
  final int deckId;
  final int entryTypeId;
  EntryModel(
      {@required this.id, @required this.deckId, @required this.entryTypeId});
  factory EntryModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return EntryModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      deckId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}deck_id']),
      entryTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_type_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || deckId != null) {
      map['deck_id'] = Variable<int>(deckId);
    }
    if (!nullToAbsent || entryTypeId != null) {
      map['entry_type_id'] = Variable<int>(entryTypeId);
    }
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      deckId:
          deckId == null && nullToAbsent ? const Value.absent() : Value(deckId),
      entryTypeId: entryTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryTypeId),
    );
  }

  factory EntryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EntryModel(
      id: serializer.fromJson<int>(json['id']),
      deckId: serializer.fromJson<int>(json['deckId']),
      entryTypeId: serializer.fromJson<int>(json['entryTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deckId': serializer.toJson<int>(deckId),
      'entryTypeId': serializer.toJson<int>(entryTypeId),
    };
  }

  EntryModel copyWith({int id, int deckId, int entryTypeId}) => EntryModel(
        id: id ?? this.id,
        deckId: deckId ?? this.deckId,
        entryTypeId: entryTypeId ?? this.entryTypeId,
      );
  @override
  String toString() {
    return (StringBuffer('EntryModel(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('entryTypeId: $entryTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(deckId.hashCode, entryTypeId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EntryModel &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.entryTypeId == this.entryTypeId);
}

class EntriesCompanion extends UpdateCompanion<EntryModel> {
  final Value<int> id;
  final Value<int> deckId;
  final Value<int> entryTypeId;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.entryTypeId = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    @required int deckId,
    @required int entryTypeId,
  })  : deckId = Value(deckId),
        entryTypeId = Value(entryTypeId);
  static Insertable<EntryModel> custom({
    Expression<int> id,
    Expression<int> deckId,
    Expression<int> entryTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (entryTypeId != null) 'entry_type_id': entryTypeId,
    });
  }

  EntriesCompanion copyWith(
      {Value<int> id, Value<int> deckId, Value<int> entryTypeId}) {
    return EntriesCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      entryTypeId: entryTypeId ?? this.entryTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<int>(deckId.value);
    }
    if (entryTypeId.present) {
      map['entry_type_id'] = Variable<int>(entryTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('entryTypeId: $entryTypeId')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, EntryModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $EntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  GeneratedIntColumn _deckId;
  @override
  GeneratedIntColumn get deckId => _deckId ??= _constructDeckId();
  GeneratedIntColumn _constructDeckId() {
    return GeneratedIntColumn('deck_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES decks(id)');
  }

  final VerificationMeta _entryTypeIdMeta =
      const VerificationMeta('entryTypeId');
  GeneratedIntColumn _entryTypeId;
  @override
  GeneratedIntColumn get entryTypeId =>
      _entryTypeId ??= _constructEntryTypeId();
  GeneratedIntColumn _constructEntryTypeId() {
    return GeneratedIntColumn('entry_type_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entry_types(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, deckId, entryTypeId];
  @override
  $EntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'entries';
  @override
  final String actualTableName = 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<EntryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id'], _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('entry_type_id')) {
      context.handle(
          _entryTypeIdMeta,
          entryTypeId.isAcceptableOrUnknown(
              data['entry_type_id'], _entryTypeIdMeta));
    } else if (isInserting) {
      context.missing(_entryTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntryModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EntryModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(_db, alias);
  }
}

class EntryTagModel extends DataClass implements Insertable<EntryTagModel> {
  final int entryId;
  final int tagId;
  EntryTagModel({@required this.entryId, @required this.tagId});
  factory EntryTagModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return EntryTagModel(
      entryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}entry_id']),
      tagId: intType.mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int>(tagId);
    }
    return map;
  }

  EntriesTagsCompanion toCompanion(bool nullToAbsent) {
    return EntriesTagsCompanion(
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
    );
  }

  factory EntryTagModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EntryTagModel(
      entryId: serializer.fromJson<int>(json['entryId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  EntryTagModel copyWith({int entryId, int tagId}) => EntryTagModel(
        entryId: entryId ?? this.entryId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('EntryTagModel(')
          ..write('entryId: $entryId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(entryId.hashCode, tagId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EntryTagModel &&
          other.entryId == this.entryId &&
          other.tagId == this.tagId);
}

class EntriesTagsCompanion extends UpdateCompanion<EntryTagModel> {
  final Value<int> entryId;
  final Value<int> tagId;
  const EntriesTagsCompanion({
    this.entryId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  EntriesTagsCompanion.insert({
    @required int entryId,
    @required int tagId,
  })  : entryId = Value(entryId),
        tagId = Value(tagId);
  static Insertable<EntryTagModel> custom({
    Expression<int> entryId,
    Expression<int> tagId,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  EntriesTagsCompanion copyWith({Value<int> entryId, Value<int> tagId}) {
    return EntriesTagsCompanion(
      entryId: entryId ?? this.entryId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesTagsCompanion(')
          ..write('entryId: $entryId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $EntriesTagsTable extends EntriesTags
    with TableInfo<$EntriesTagsTable, EntryTagModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $EntriesTagsTable(this._db, [this._alias]);
  final VerificationMeta _entryIdMeta = const VerificationMeta('entryId');
  GeneratedIntColumn _entryId;
  @override
  GeneratedIntColumn get entryId => _entryId ??= _constructEntryId();
  GeneratedIntColumn _constructEntryId() {
    return GeneratedIntColumn('entry_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entries(id)');
  }

  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  GeneratedIntColumn _tagId;
  @override
  GeneratedIntColumn get tagId => _tagId ??= _constructTagId();
  GeneratedIntColumn _constructTagId() {
    return GeneratedIntColumn('tag_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES tags(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [entryId, tagId];
  @override
  $EntriesTagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'entries_tags';
  @override
  final String actualTableName = 'entries_tags';
  @override
  VerificationContext validateIntegrity(Insertable<EntryTagModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id'], _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id'], _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId, tagId};
  @override
  EntryTagModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EntryTagModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EntriesTagsTable createAlias(String alias) {
    return $EntriesTagsTable(_db, alias);
  }
}

class EntryTypeModel extends DataClass implements Insertable<EntryTypeModel> {
  final int id;
  final String name;
  EntryTypeModel({@required this.id, @required this.name});
  factory EntryTypeModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return EntryTypeModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  EntryTypesCompanion toCompanion(bool nullToAbsent) {
    return EntryTypesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory EntryTypeModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EntryTypeModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  EntryTypeModel copyWith({int id, String name}) => EntryTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('EntryTypeModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EntryTypeModel &&
          other.id == this.id &&
          other.name == this.name);
}

class EntryTypesCompanion extends UpdateCompanion<EntryTypeModel> {
  final Value<int> id;
  final Value<String> name;
  const EntryTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  EntryTypesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<EntryTypeModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  EntryTypesCompanion copyWith({Value<int> id, Value<String> name}) {
    return EntryTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntryTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EntryTypesTable extends EntryTypes
    with TableInfo<$EntryTypesTable, EntryTypeModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $EntryTypesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $EntryTypesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'entry_types';
  @override
  final String actualTableName = 'entry_types';
  @override
  VerificationContext validateIntegrity(Insertable<EntryTypeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntryTypeModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EntryTypeModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EntryTypesTable createAlias(String alias) {
    return $EntryTypesTable(_db, alias);
  }
}

class FieldDatumModel extends DataClass implements Insertable<FieldDatumModel> {
  final int entryId;
  final int fieldSpecId;
  FieldDatumModel({@required this.entryId, @required this.fieldSpecId});
  factory FieldDatumModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return FieldDatumModel(
      entryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}entry_id']),
      fieldSpecId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}field_spec_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    if (!nullToAbsent || fieldSpecId != null) {
      map['field_spec_id'] = Variable<int>(fieldSpecId);
    }
    return map;
  }

  FieldDataCompanion toCompanion(bool nullToAbsent) {
    return FieldDataCompanion(
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      fieldSpecId: fieldSpecId == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldSpecId),
    );
  }

  factory FieldDatumModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FieldDatumModel(
      entryId: serializer.fromJson<int>(json['entryId']),
      fieldSpecId: serializer.fromJson<int>(json['fieldSpecId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'fieldSpecId': serializer.toJson<int>(fieldSpecId),
    };
  }

  FieldDatumModel copyWith({int entryId, int fieldSpecId}) => FieldDatumModel(
        entryId: entryId ?? this.entryId,
        fieldSpecId: fieldSpecId ?? this.fieldSpecId,
      );
  @override
  String toString() {
    return (StringBuffer('FieldDatumModel(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(entryId.hashCode, fieldSpecId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FieldDatumModel &&
          other.entryId == this.entryId &&
          other.fieldSpecId == this.fieldSpecId);
}

class FieldDataCompanion extends UpdateCompanion<FieldDatumModel> {
  final Value<int> entryId;
  final Value<int> fieldSpecId;
  const FieldDataCompanion({
    this.entryId = const Value.absent(),
    this.fieldSpecId = const Value.absent(),
  });
  FieldDataCompanion.insert({
    @required int entryId,
    @required int fieldSpecId,
  })  : entryId = Value(entryId),
        fieldSpecId = Value(fieldSpecId);
  static Insertable<FieldDatumModel> custom({
    Expression<int> entryId,
    Expression<int> fieldSpecId,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (fieldSpecId != null) 'field_spec_id': fieldSpecId,
    });
  }

  FieldDataCompanion copyWith({Value<int> entryId, Value<int> fieldSpecId}) {
    return FieldDataCompanion(
      entryId: entryId ?? this.entryId,
      fieldSpecId: fieldSpecId ?? this.fieldSpecId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (fieldSpecId.present) {
      map['field_spec_id'] = Variable<int>(fieldSpecId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FieldDataCompanion(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId')
          ..write(')'))
        .toString();
  }
}

class $FieldDataTable extends FieldData
    with TableInfo<$FieldDataTable, FieldDatumModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FieldDataTable(this._db, [this._alias]);
  final VerificationMeta _entryIdMeta = const VerificationMeta('entryId');
  GeneratedIntColumn _entryId;
  @override
  GeneratedIntColumn get entryId => _entryId ??= _constructEntryId();
  GeneratedIntColumn _constructEntryId() {
    return GeneratedIntColumn('entry_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entries(id)');
  }

  final VerificationMeta _fieldSpecIdMeta =
      const VerificationMeta('fieldSpecId');
  GeneratedIntColumn _fieldSpecId;
  @override
  GeneratedIntColumn get fieldSpecId =>
      _fieldSpecId ??= _constructFieldSpecId();
  GeneratedIntColumn _constructFieldSpecId() {
    return GeneratedIntColumn('field_spec_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES field_specs(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [entryId, fieldSpecId];
  @override
  $FieldDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'field_data';
  @override
  final String actualTableName = 'field_data';
  @override
  VerificationContext validateIntegrity(Insertable<FieldDatumModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id'], _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('field_spec_id')) {
      context.handle(
          _fieldSpecIdMeta,
          fieldSpecId.isAcceptableOrUnknown(
              data['field_spec_id'], _fieldSpecIdMeta));
    } else if (isInserting) {
      context.missing(_fieldSpecIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId, fieldSpecId};
  @override
  FieldDatumModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FieldDatumModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FieldDataTable createAlias(String alias) {
    return $FieldDataTable(_db, alias);
  }
}

class FieldSpecModel extends DataClass implements Insertable<FieldSpecModel> {
  final int id;
  final int fieldTypeId;
  final int entryTypeId;
  final String name;
  FieldSpecModel(
      {@required this.id,
      @required this.fieldTypeId,
      @required this.entryTypeId,
      @required this.name});
  factory FieldSpecModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FieldSpecModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      fieldTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}field_type_id']),
      entryTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_type_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fieldTypeId != null) {
      map['field_type_id'] = Variable<int>(fieldTypeId);
    }
    if (!nullToAbsent || entryTypeId != null) {
      map['entry_type_id'] = Variable<int>(entryTypeId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  FieldSpecsCompanion toCompanion(bool nullToAbsent) {
    return FieldSpecsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fieldTypeId: fieldTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldTypeId),
      entryTypeId: entryTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryTypeId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory FieldSpecModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FieldSpecModel(
      id: serializer.fromJson<int>(json['id']),
      fieldTypeId: serializer.fromJson<int>(json['fieldTypeId']),
      entryTypeId: serializer.fromJson<int>(json['entryTypeId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fieldTypeId': serializer.toJson<int>(fieldTypeId),
      'entryTypeId': serializer.toJson<int>(entryTypeId),
      'name': serializer.toJson<String>(name),
    };
  }

  FieldSpecModel copyWith(
          {int id, int fieldTypeId, int entryTypeId, String name}) =>
      FieldSpecModel(
        id: id ?? this.id,
        fieldTypeId: fieldTypeId ?? this.fieldTypeId,
        entryTypeId: entryTypeId ?? this.entryTypeId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FieldSpecModel(')
          ..write('id: $id, ')
          ..write('fieldTypeId: $fieldTypeId, ')
          ..write('entryTypeId: $entryTypeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(fieldTypeId.hashCode, $mrjc(entryTypeId.hashCode, name.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FieldSpecModel &&
          other.id == this.id &&
          other.fieldTypeId == this.fieldTypeId &&
          other.entryTypeId == this.entryTypeId &&
          other.name == this.name);
}

class FieldSpecsCompanion extends UpdateCompanion<FieldSpecModel> {
  final Value<int> id;
  final Value<int> fieldTypeId;
  final Value<int> entryTypeId;
  final Value<String> name;
  const FieldSpecsCompanion({
    this.id = const Value.absent(),
    this.fieldTypeId = const Value.absent(),
    this.entryTypeId = const Value.absent(),
    this.name = const Value.absent(),
  });
  FieldSpecsCompanion.insert({
    this.id = const Value.absent(),
    @required int fieldTypeId,
    @required int entryTypeId,
    @required String name,
  })  : fieldTypeId = Value(fieldTypeId),
        entryTypeId = Value(entryTypeId),
        name = Value(name);
  static Insertable<FieldSpecModel> custom({
    Expression<int> id,
    Expression<int> fieldTypeId,
    Expression<int> entryTypeId,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fieldTypeId != null) 'field_type_id': fieldTypeId,
      if (entryTypeId != null) 'entry_type_id': entryTypeId,
      if (name != null) 'name': name,
    });
  }

  FieldSpecsCompanion copyWith(
      {Value<int> id,
      Value<int> fieldTypeId,
      Value<int> entryTypeId,
      Value<String> name}) {
    return FieldSpecsCompanion(
      id: id ?? this.id,
      fieldTypeId: fieldTypeId ?? this.fieldTypeId,
      entryTypeId: entryTypeId ?? this.entryTypeId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fieldTypeId.present) {
      map['field_type_id'] = Variable<int>(fieldTypeId.value);
    }
    if (entryTypeId.present) {
      map['entry_type_id'] = Variable<int>(entryTypeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FieldSpecsCompanion(')
          ..write('id: $id, ')
          ..write('fieldTypeId: $fieldTypeId, ')
          ..write('entryTypeId: $entryTypeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FieldSpecsTable extends FieldSpecs
    with TableInfo<$FieldSpecsTable, FieldSpecModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FieldSpecsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _fieldTypeIdMeta =
      const VerificationMeta('fieldTypeId');
  GeneratedIntColumn _fieldTypeId;
  @override
  GeneratedIntColumn get fieldTypeId =>
      _fieldTypeId ??= _constructFieldTypeId();
  GeneratedIntColumn _constructFieldTypeId() {
    return GeneratedIntColumn('field_type_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES field_types(id)');
  }

  final VerificationMeta _entryTypeIdMeta =
      const VerificationMeta('entryTypeId');
  GeneratedIntColumn _entryTypeId;
  @override
  GeneratedIntColumn get entryTypeId =>
      _entryTypeId ??= _constructEntryTypeId();
  GeneratedIntColumn _constructEntryTypeId() {
    return GeneratedIntColumn('entry_type_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES entry_types(id)');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, fieldTypeId, entryTypeId, name];
  @override
  $FieldSpecsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'field_specs';
  @override
  final String actualTableName = 'field_specs';
  @override
  VerificationContext validateIntegrity(Insertable<FieldSpecModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('field_type_id')) {
      context.handle(
          _fieldTypeIdMeta,
          fieldTypeId.isAcceptableOrUnknown(
              data['field_type_id'], _fieldTypeIdMeta));
    } else if (isInserting) {
      context.missing(_fieldTypeIdMeta);
    }
    if (data.containsKey('entry_type_id')) {
      context.handle(
          _entryTypeIdMeta,
          entryTypeId.isAcceptableOrUnknown(
              data['entry_type_id'], _entryTypeIdMeta));
    } else if (isInserting) {
      context.missing(_entryTypeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FieldSpecModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FieldSpecModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FieldSpecsTable createAlias(String alias) {
    return $FieldSpecsTable(_db, alias);
  }
}

class FieldTypeModel extends DataClass implements Insertable<FieldTypeModel> {
  final int id;
  final String name;
  FieldTypeModel({@required this.id, @required this.name});
  factory FieldTypeModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FieldTypeModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  FieldTypesCompanion toCompanion(bool nullToAbsent) {
    return FieldTypesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory FieldTypeModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FieldTypeModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FieldTypeModel copyWith({int id, String name}) => FieldTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FieldTypeModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FieldTypeModel &&
          other.id == this.id &&
          other.name == this.name);
}

class FieldTypesCompanion extends UpdateCompanion<FieldTypeModel> {
  final Value<int> id;
  final Value<String> name;
  const FieldTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FieldTypesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<FieldTypeModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FieldTypesCompanion copyWith({Value<int> id, Value<String> name}) {
    return FieldTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FieldTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FieldTypesTable extends FieldTypes
    with TableInfo<$FieldTypesTable, FieldTypeModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FieldTypesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $FieldTypesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'field_types';
  @override
  final String actualTableName = 'field_types';
  @override
  VerificationContext validateIntegrity(Insertable<FieldTypeModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FieldTypeModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FieldTypeModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FieldTypesTable createAlias(String alias) {
    return $FieldTypesTable(_db, alias);
  }
}

class FillColorModel extends DataClass implements Insertable<FillColorModel> {
  final int id;
  final String name;
  FillColorModel({@required this.id, @required this.name});
  factory FillColorModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FillColorModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  FillColorsCompanion toCompanion(bool nullToAbsent) {
    return FillColorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory FillColorModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FillColorModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FillColorModel copyWith({int id, String name}) => FillColorModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FillColorModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FillColorModel &&
          other.id == this.id &&
          other.name == this.name);
}

class FillColorsCompanion extends UpdateCompanion<FillColorModel> {
  final Value<int> id;
  final Value<String> name;
  const FillColorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FillColorsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<FillColorModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FillColorsCompanion copyWith({Value<int> id, Value<String> name}) {
    return FillColorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FillColorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FillColorsTable extends FillColors
    with TableInfo<$FillColorsTable, FillColorModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FillColorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $FillColorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'fill_colors';
  @override
  final String actualTableName = 'fill_colors';
  @override
  VerificationContext validateIntegrity(Insertable<FillColorModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FillColorModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FillColorModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FillColorsTable createAlias(String alias) {
    return $FillColorsTable(_db, alias);
  }
}

class HighlightColorModel extends DataClass
    implements Insertable<HighlightColorModel> {
  final int id;
  final String name;
  HighlightColorModel({@required this.id, @required this.name});
  factory HighlightColorModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return HighlightColorModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  HighlightColorsCompanion toCompanion(bool nullToAbsent) {
    return HighlightColorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory HighlightColorModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HighlightColorModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  HighlightColorModel copyWith({int id, String name}) => HighlightColorModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('HighlightColorModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is HighlightColorModel &&
          other.id == this.id &&
          other.name == this.name);
}

class HighlightColorsCompanion extends UpdateCompanion<HighlightColorModel> {
  final Value<int> id;
  final Value<String> name;
  const HighlightColorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  HighlightColorsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<HighlightColorModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  HighlightColorsCompanion copyWith({Value<int> id, Value<String> name}) {
    return HighlightColorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HighlightColorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $HighlightColorsTable extends HighlightColors
    with TableInfo<$HighlightColorsTable, HighlightColorModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $HighlightColorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $HighlightColorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'highlight_colors';
  @override
  final String actualTableName = 'highlight_colors';
  @override
  VerificationContext validateIntegrity(
      Insertable<HighlightColorModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HighlightColorModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return HighlightColorModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HighlightColorsTable createAlias(String alias) {
    return $HighlightColorsTable(_db, alias);
  }
}

class ImageFieldDatumModel extends DataClass
    implements Insertable<ImageFieldDatumModel> {
  final int entryId;
  final int fieldSpecId;
  final int imageId;
  ImageFieldDatumModel(
      {@required this.entryId,
      @required this.fieldSpecId,
      @required this.imageId});
  factory ImageFieldDatumModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ImageFieldDatumModel(
      entryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}entry_id']),
      fieldSpecId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}field_spec_id']),
      imageId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}image_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    if (!nullToAbsent || fieldSpecId != null) {
      map['field_spec_id'] = Variable<int>(fieldSpecId);
    }
    if (!nullToAbsent || imageId != null) {
      map['image_id'] = Variable<int>(imageId);
    }
    return map;
  }

  ImageFieldDataCompanion toCompanion(bool nullToAbsent) {
    return ImageFieldDataCompanion(
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      fieldSpecId: fieldSpecId == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldSpecId),
      imageId: imageId == null && nullToAbsent
          ? const Value.absent()
          : Value(imageId),
    );
  }

  factory ImageFieldDatumModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ImageFieldDatumModel(
      entryId: serializer.fromJson<int>(json['entryId']),
      fieldSpecId: serializer.fromJson<int>(json['fieldSpecId']),
      imageId: serializer.fromJson<int>(json['imageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'fieldSpecId': serializer.toJson<int>(fieldSpecId),
      'imageId': serializer.toJson<int>(imageId),
    };
  }

  ImageFieldDatumModel copyWith({int entryId, int fieldSpecId, int imageId}) =>
      ImageFieldDatumModel(
        entryId: entryId ?? this.entryId,
        fieldSpecId: fieldSpecId ?? this.fieldSpecId,
        imageId: imageId ?? this.imageId,
      );
  @override
  String toString() {
    return (StringBuffer('ImageFieldDatumModel(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(entryId.hashCode, $mrjc(fieldSpecId.hashCode, imageId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ImageFieldDatumModel &&
          other.entryId == this.entryId &&
          other.fieldSpecId == this.fieldSpecId &&
          other.imageId == this.imageId);
}

class ImageFieldDataCompanion extends UpdateCompanion<ImageFieldDatumModel> {
  final Value<int> entryId;
  final Value<int> fieldSpecId;
  final Value<int> imageId;
  const ImageFieldDataCompanion({
    this.entryId = const Value.absent(),
    this.fieldSpecId = const Value.absent(),
    this.imageId = const Value.absent(),
  });
  ImageFieldDataCompanion.insert({
    @required int entryId,
    @required int fieldSpecId,
    @required int imageId,
  })  : entryId = Value(entryId),
        fieldSpecId = Value(fieldSpecId),
        imageId = Value(imageId);
  static Insertable<ImageFieldDatumModel> custom({
    Expression<int> entryId,
    Expression<int> fieldSpecId,
    Expression<int> imageId,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (fieldSpecId != null) 'field_spec_id': fieldSpecId,
      if (imageId != null) 'image_id': imageId,
    });
  }

  ImageFieldDataCompanion copyWith(
      {Value<int> entryId, Value<int> fieldSpecId, Value<int> imageId}) {
    return ImageFieldDataCompanion(
      entryId: entryId ?? this.entryId,
      fieldSpecId: fieldSpecId ?? this.fieldSpecId,
      imageId: imageId ?? this.imageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (fieldSpecId.present) {
      map['field_spec_id'] = Variable<int>(fieldSpecId.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<int>(imageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImageFieldDataCompanion(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId, ')
          ..write('imageId: $imageId')
          ..write(')'))
        .toString();
  }
}

class $ImageFieldDataTable extends ImageFieldData
    with TableInfo<$ImageFieldDataTable, ImageFieldDatumModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ImageFieldDataTable(this._db, [this._alias]);
  final VerificationMeta _entryIdMeta = const VerificationMeta('entryId');
  GeneratedIntColumn _entryId;
  @override
  GeneratedIntColumn get entryId => _entryId ??= _constructEntryId();
  GeneratedIntColumn _constructEntryId() {
    return GeneratedIntColumn(
      'entry_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fieldSpecIdMeta =
      const VerificationMeta('fieldSpecId');
  GeneratedIntColumn _fieldSpecId;
  @override
  GeneratedIntColumn get fieldSpecId =>
      _fieldSpecId ??= _constructFieldSpecId();
  GeneratedIntColumn _constructFieldSpecId() {
    return GeneratedIntColumn(
      'field_spec_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  GeneratedIntColumn _imageId;
  @override
  GeneratedIntColumn get imageId => _imageId ??= _constructImageId();
  GeneratedIntColumn _constructImageId() {
    return GeneratedIntColumn(
      'image_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [entryId, fieldSpecId, imageId];
  @override
  $ImageFieldDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'image_field_data';
  @override
  final String actualTableName = 'image_field_data';
  @override
  VerificationContext validateIntegrity(
      Insertable<ImageFieldDatumModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id'], _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('field_spec_id')) {
      context.handle(
          _fieldSpecIdMeta,
          fieldSpecId.isAcceptableOrUnknown(
              data['field_spec_id'], _fieldSpecIdMeta));
    } else if (isInserting) {
      context.missing(_fieldSpecIdMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id'], _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId, fieldSpecId};
  @override
  ImageFieldDatumModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ImageFieldDatumModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ImageFieldDataTable createAlias(String alias) {
    return $ImageFieldDataTable(_db, alias);
  }
}

class StructureModel extends DataClass implements Insertable<StructureModel> {
  final int id;
  StructureModel({@required this.id});
  factory StructureModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return StructureModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    return map;
  }

  StructuresCompanion toCompanion(bool nullToAbsent) {
    return StructuresCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory StructureModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StructureModel(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  StructureModel copyWith({int id}) => StructureModel(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('StructureModel(')..write('id: $id')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StructureModel && other.id == this.id);
}

class StructuresCompanion extends UpdateCompanion<StructureModel> {
  final Value<int> id;
  const StructuresCompanion({
    this.id = const Value.absent(),
  });
  StructuresCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<StructureModel> custom({
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  StructuresCompanion copyWith({Value<int> id}) {
    return StructuresCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StructuresCompanion(')..write('id: $id')..write(')'))
        .toString();
  }
}

class $StructuresTable extends Structures
    with TableInfo<$StructuresTable, StructureModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $StructuresTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  $StructuresTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'structures';
  @override
  final String actualTableName = 'structures';
  @override
  VerificationContext validateIntegrity(Insertable<StructureModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StructureModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StructureModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StructuresTable createAlias(String alias) {
    return $StructuresTable(_db, alias);
  }
}

class TagModel extends DataClass implements Insertable<TagModel> {
  final int id;
  final String name;
  TagModel({@required this.id, @required this.name});
  factory TagModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TagModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory TagModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TagModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagModel copyWith({int id, String name}) => TagModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TagModel && other.id == this.id && other.name == this.name);
}

class TagsCompanion extends UpdateCompanion<TagModel> {
  final Value<int> id;
  final Value<String> name;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<TagModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagsCompanion copyWith({Value<int> id, Value<String> name}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, TagModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $TagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tags';
  @override
  final String actualTableName = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<TagModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TagModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
  }
}

class TextComponentModel extends DataClass
    implements Insertable<TextComponentModel> {
  final int structureId;
  final int position;
  final String data;
  final double size;
  final int alignmentId;
  final int fillColorId;
  final int highlightColorId;
  final bool bold;
  final bool italic;
  final bool underlined;
  TextComponentModel(
      {@required this.structureId,
      @required this.position,
      @required this.data,
      @required this.size,
      @required this.alignmentId,
      @required this.fillColorId,
      @required this.highlightColorId,
      @required this.bold,
      @required this.italic,
      @required this.underlined});
  factory TextComponentModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return TextComponentModel(
      structureId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}structure_id']),
      position:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}position']),
      data: stringType.mapFromDatabaseResponse(data['${effectivePrefix}data']),
      size: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
      alignmentId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}alignment_id']),
      fillColorId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_color_id']),
      highlightColorId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}highlight_color_id']),
      bold: boolType.mapFromDatabaseResponse(data['${effectivePrefix}bold']),
      italic:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}italic']),
      underlined: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}underlined']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || structureId != null) {
      map['structure_id'] = Variable<int>(structureId);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int>(position);
    }
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<double>(size);
    }
    if (!nullToAbsent || alignmentId != null) {
      map['alignment_id'] = Variable<int>(alignmentId);
    }
    if (!nullToAbsent || fillColorId != null) {
      map['fill_color_id'] = Variable<int>(fillColorId);
    }
    if (!nullToAbsent || highlightColorId != null) {
      map['highlight_color_id'] = Variable<int>(highlightColorId);
    }
    if (!nullToAbsent || bold != null) {
      map['bold'] = Variable<bool>(bold);
    }
    if (!nullToAbsent || italic != null) {
      map['italic'] = Variable<bool>(italic);
    }
    if (!nullToAbsent || underlined != null) {
      map['underlined'] = Variable<bool>(underlined);
    }
    return map;
  }

  TextComponentsCompanion toCompanion(bool nullToAbsent) {
    return TextComponentsCompanion(
      structureId: structureId == null && nullToAbsent
          ? const Value.absent()
          : Value(structureId),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      alignmentId: alignmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(alignmentId),
      fillColorId: fillColorId == null && nullToAbsent
          ? const Value.absent()
          : Value(fillColorId),
      highlightColorId: highlightColorId == null && nullToAbsent
          ? const Value.absent()
          : Value(highlightColorId),
      bold: bold == null && nullToAbsent ? const Value.absent() : Value(bold),
      italic:
          italic == null && nullToAbsent ? const Value.absent() : Value(italic),
      underlined: underlined == null && nullToAbsent
          ? const Value.absent()
          : Value(underlined),
    );
  }

  factory TextComponentModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TextComponentModel(
      structureId: serializer.fromJson<int>(json['structureId']),
      position: serializer.fromJson<int>(json['position']),
      data: serializer.fromJson<String>(json['data']),
      size: serializer.fromJson<double>(json['size']),
      alignmentId: serializer.fromJson<int>(json['alignmentId']),
      fillColorId: serializer.fromJson<int>(json['fillColorId']),
      highlightColorId: serializer.fromJson<int>(json['highlightColorId']),
      bold: serializer.fromJson<bool>(json['bold']),
      italic: serializer.fromJson<bool>(json['italic']),
      underlined: serializer.fromJson<bool>(json['underlined']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'structureId': serializer.toJson<int>(structureId),
      'position': serializer.toJson<int>(position),
      'data': serializer.toJson<String>(data),
      'size': serializer.toJson<double>(size),
      'alignmentId': serializer.toJson<int>(alignmentId),
      'fillColorId': serializer.toJson<int>(fillColorId),
      'highlightColorId': serializer.toJson<int>(highlightColorId),
      'bold': serializer.toJson<bool>(bold),
      'italic': serializer.toJson<bool>(italic),
      'underlined': serializer.toJson<bool>(underlined),
    };
  }

  TextComponentModel copyWith(
          {int structureId,
          int position,
          String data,
          double size,
          int alignmentId,
          int fillColorId,
          int highlightColorId,
          bool bold,
          bool italic,
          bool underlined}) =>
      TextComponentModel(
        structureId: structureId ?? this.structureId,
        position: position ?? this.position,
        data: data ?? this.data,
        size: size ?? this.size,
        alignmentId: alignmentId ?? this.alignmentId,
        fillColorId: fillColorId ?? this.fillColorId,
        highlightColorId: highlightColorId ?? this.highlightColorId,
        bold: bold ?? this.bold,
        italic: italic ?? this.italic,
        underlined: underlined ?? this.underlined,
      );
  @override
  String toString() {
    return (StringBuffer('TextComponentModel(')
          ..write('structureId: $structureId, ')
          ..write('position: $position, ')
          ..write('data: $data, ')
          ..write('size: $size, ')
          ..write('alignmentId: $alignmentId, ')
          ..write('fillColorId: $fillColorId, ')
          ..write('highlightColorId: $highlightColorId, ')
          ..write('bold: $bold, ')
          ..write('italic: $italic, ')
          ..write('underlined: $underlined')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      structureId.hashCode,
      $mrjc(
          position.hashCode,
          $mrjc(
              data.hashCode,
              $mrjc(
                  size.hashCode,
                  $mrjc(
                      alignmentId.hashCode,
                      $mrjc(
                          fillColorId.hashCode,
                          $mrjc(
                              highlightColorId.hashCode,
                              $mrjc(
                                  bold.hashCode,
                                  $mrjc(italic.hashCode,
                                      underlined.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TextComponentModel &&
          other.structureId == this.structureId &&
          other.position == this.position &&
          other.data == this.data &&
          other.size == this.size &&
          other.alignmentId == this.alignmentId &&
          other.fillColorId == this.fillColorId &&
          other.highlightColorId == this.highlightColorId &&
          other.bold == this.bold &&
          other.italic == this.italic &&
          other.underlined == this.underlined);
}

class TextComponentsCompanion extends UpdateCompanion<TextComponentModel> {
  final Value<int> structureId;
  final Value<int> position;
  final Value<String> data;
  final Value<double> size;
  final Value<int> alignmentId;
  final Value<int> fillColorId;
  final Value<int> highlightColorId;
  final Value<bool> bold;
  final Value<bool> italic;
  final Value<bool> underlined;
  const TextComponentsCompanion({
    this.structureId = const Value.absent(),
    this.position = const Value.absent(),
    this.data = const Value.absent(),
    this.size = const Value.absent(),
    this.alignmentId = const Value.absent(),
    this.fillColorId = const Value.absent(),
    this.highlightColorId = const Value.absent(),
    this.bold = const Value.absent(),
    this.italic = const Value.absent(),
    this.underlined = const Value.absent(),
  });
  TextComponentsCompanion.insert({
    @required int structureId,
    @required int position,
    @required String data,
    @required double size,
    @required int alignmentId,
    @required int fillColorId,
    @required int highlightColorId,
    @required bool bold,
    @required bool italic,
    @required bool underlined,
  })  : structureId = Value(structureId),
        position = Value(position),
        data = Value(data),
        size = Value(size),
        alignmentId = Value(alignmentId),
        fillColorId = Value(fillColorId),
        highlightColorId = Value(highlightColorId),
        bold = Value(bold),
        italic = Value(italic),
        underlined = Value(underlined);
  static Insertable<TextComponentModel> custom({
    Expression<int> structureId,
    Expression<int> position,
    Expression<String> data,
    Expression<double> size,
    Expression<int> alignmentId,
    Expression<int> fillColorId,
    Expression<int> highlightColorId,
    Expression<bool> bold,
    Expression<bool> italic,
    Expression<bool> underlined,
  }) {
    return RawValuesInsertable({
      if (structureId != null) 'structure_id': structureId,
      if (position != null) 'position': position,
      if (data != null) 'data': data,
      if (size != null) 'size': size,
      if (alignmentId != null) 'alignment_id': alignmentId,
      if (fillColorId != null) 'fill_color_id': fillColorId,
      if (highlightColorId != null) 'highlight_color_id': highlightColorId,
      if (bold != null) 'bold': bold,
      if (italic != null) 'italic': italic,
      if (underlined != null) 'underlined': underlined,
    });
  }

  TextComponentsCompanion copyWith(
      {Value<int> structureId,
      Value<int> position,
      Value<String> data,
      Value<double> size,
      Value<int> alignmentId,
      Value<int> fillColorId,
      Value<int> highlightColorId,
      Value<bool> bold,
      Value<bool> italic,
      Value<bool> underlined}) {
    return TextComponentsCompanion(
      structureId: structureId ?? this.structureId,
      position: position ?? this.position,
      data: data ?? this.data,
      size: size ?? this.size,
      alignmentId: alignmentId ?? this.alignmentId,
      fillColorId: fillColorId ?? this.fillColorId,
      highlightColorId: highlightColorId ?? this.highlightColorId,
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
      underlined: underlined ?? this.underlined,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (structureId.present) {
      map['structure_id'] = Variable<int>(structureId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (size.present) {
      map['size'] = Variable<double>(size.value);
    }
    if (alignmentId.present) {
      map['alignment_id'] = Variable<int>(alignmentId.value);
    }
    if (fillColorId.present) {
      map['fill_color_id'] = Variable<int>(fillColorId.value);
    }
    if (highlightColorId.present) {
      map['highlight_color_id'] = Variable<int>(highlightColorId.value);
    }
    if (bold.present) {
      map['bold'] = Variable<bool>(bold.value);
    }
    if (italic.present) {
      map['italic'] = Variable<bool>(italic.value);
    }
    if (underlined.present) {
      map['underlined'] = Variable<bool>(underlined.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TextComponentsCompanion(')
          ..write('structureId: $structureId, ')
          ..write('position: $position, ')
          ..write('data: $data, ')
          ..write('size: $size, ')
          ..write('alignmentId: $alignmentId, ')
          ..write('fillColorId: $fillColorId, ')
          ..write('highlightColorId: $highlightColorId, ')
          ..write('bold: $bold, ')
          ..write('italic: $italic, ')
          ..write('underlined: $underlined')
          ..write(')'))
        .toString();
  }
}

class $TextComponentsTable extends TextComponents
    with TableInfo<$TextComponentsTable, TextComponentModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $TextComponentsTable(this._db, [this._alias]);
  final VerificationMeta _structureIdMeta =
      const VerificationMeta('structureId');
  GeneratedIntColumn _structureId;
  @override
  GeneratedIntColumn get structureId =>
      _structureId ??= _constructStructureId();
  GeneratedIntColumn _constructStructureId() {
    return GeneratedIntColumn(
      'structure_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedIntColumn _position;
  @override
  GeneratedIntColumn get position => _position ??= _constructPosition();
  GeneratedIntColumn _constructPosition() {
    return GeneratedIntColumn(
      'position',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  GeneratedTextColumn _data;
  @override
  GeneratedTextColumn get data => _data ??= _constructData();
  GeneratedTextColumn _constructData() {
    return GeneratedTextColumn(
      'data',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedRealColumn _size;
  @override
  GeneratedRealColumn get size => _size ??= _constructSize();
  GeneratedRealColumn _constructSize() {
    return GeneratedRealColumn(
      'size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _alignmentIdMeta =
      const VerificationMeta('alignmentId');
  GeneratedIntColumn _alignmentId;
  @override
  GeneratedIntColumn get alignmentId =>
      _alignmentId ??= _constructAlignmentId();
  GeneratedIntColumn _constructAlignmentId() {
    return GeneratedIntColumn('alignment_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES alignments(id)');
  }

  final VerificationMeta _fillColorIdMeta =
      const VerificationMeta('fillColorId');
  GeneratedIntColumn _fillColorId;
  @override
  GeneratedIntColumn get fillColorId =>
      _fillColorId ??= _constructFillColorId();
  GeneratedIntColumn _constructFillColorId() {
    return GeneratedIntColumn('fill_color_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES fill_colors(id)');
  }

  final VerificationMeta _highlightColorIdMeta =
      const VerificationMeta('highlightColorId');
  GeneratedIntColumn _highlightColorId;
  @override
  GeneratedIntColumn get highlightColorId =>
      _highlightColorId ??= _constructHighlightColorId();
  GeneratedIntColumn _constructHighlightColorId() {
    return GeneratedIntColumn('highlight_color_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES highlight_colors(id)');
  }

  final VerificationMeta _boldMeta = const VerificationMeta('bold');
  GeneratedBoolColumn _bold;
  @override
  GeneratedBoolColumn get bold => _bold ??= _constructBold();
  GeneratedBoolColumn _constructBold() {
    return GeneratedBoolColumn(
      'bold',
      $tableName,
      false,
    );
  }

  final VerificationMeta _italicMeta = const VerificationMeta('italic');
  GeneratedBoolColumn _italic;
  @override
  GeneratedBoolColumn get italic => _italic ??= _constructItalic();
  GeneratedBoolColumn _constructItalic() {
    return GeneratedBoolColumn(
      'italic',
      $tableName,
      false,
    );
  }

  final VerificationMeta _underlinedMeta = const VerificationMeta('underlined');
  GeneratedBoolColumn _underlined;
  @override
  GeneratedBoolColumn get underlined => _underlined ??= _constructUnderlined();
  GeneratedBoolColumn _constructUnderlined() {
    return GeneratedBoolColumn(
      'underlined',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        structureId,
        position,
        data,
        size,
        alignmentId,
        fillColorId,
        highlightColorId,
        bold,
        italic,
        underlined
      ];
  @override
  $TextComponentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'text_components';
  @override
  final String actualTableName = 'text_components';
  @override
  VerificationContext validateIntegrity(Insertable<TextComponentModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('structure_id')) {
      context.handle(
          _structureIdMeta,
          structureId.isAcceptableOrUnknown(
              data['structure_id'], _structureIdMeta));
    } else if (isInserting) {
      context.missing(_structureIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data'], _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size'], _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('alignment_id')) {
      context.handle(
          _alignmentIdMeta,
          alignmentId.isAcceptableOrUnknown(
              data['alignment_id'], _alignmentIdMeta));
    } else if (isInserting) {
      context.missing(_alignmentIdMeta);
    }
    if (data.containsKey('fill_color_id')) {
      context.handle(
          _fillColorIdMeta,
          fillColorId.isAcceptableOrUnknown(
              data['fill_color_id'], _fillColorIdMeta));
    } else if (isInserting) {
      context.missing(_fillColorIdMeta);
    }
    if (data.containsKey('highlight_color_id')) {
      context.handle(
          _highlightColorIdMeta,
          highlightColorId.isAcceptableOrUnknown(
              data['highlight_color_id'], _highlightColorIdMeta));
    } else if (isInserting) {
      context.missing(_highlightColorIdMeta);
    }
    if (data.containsKey('bold')) {
      context.handle(
          _boldMeta, bold.isAcceptableOrUnknown(data['bold'], _boldMeta));
    } else if (isInserting) {
      context.missing(_boldMeta);
    }
    if (data.containsKey('italic')) {
      context.handle(_italicMeta,
          italic.isAcceptableOrUnknown(data['italic'], _italicMeta));
    } else if (isInserting) {
      context.missing(_italicMeta);
    }
    if (data.containsKey('underlined')) {
      context.handle(
          _underlinedMeta,
          underlined.isAcceptableOrUnknown(
              data['underlined'], _underlinedMeta));
    } else if (isInserting) {
      context.missing(_underlinedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {structureId, position};
  @override
  TextComponentModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TextComponentModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TextComponentsTable createAlias(String alias) {
    return $TextComponentsTable(_db, alias);
  }
}

class TextFieldDatumModel extends DataClass
    implements Insertable<TextFieldDatumModel> {
  final int entryId;
  final int fieldSpecId;
  final String rawText;
  TextFieldDatumModel(
      {@required this.entryId,
      @required this.fieldSpecId,
      @required this.rawText});
  factory TextFieldDatumModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TextFieldDatumModel(
      entryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}entry_id']),
      fieldSpecId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}field_spec_id']),
      rawText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}raw_text']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<int>(entryId);
    }
    if (!nullToAbsent || fieldSpecId != null) {
      map['field_spec_id'] = Variable<int>(fieldSpecId);
    }
    if (!nullToAbsent || rawText != null) {
      map['raw_text'] = Variable<String>(rawText);
    }
    return map;
  }

  TextFieldDataCompanion toCompanion(bool nullToAbsent) {
    return TextFieldDataCompanion(
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      fieldSpecId: fieldSpecId == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldSpecId),
      rawText: rawText == null && nullToAbsent
          ? const Value.absent()
          : Value(rawText),
    );
  }

  factory TextFieldDatumModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TextFieldDatumModel(
      entryId: serializer.fromJson<int>(json['entryId']),
      fieldSpecId: serializer.fromJson<int>(json['fieldSpecId']),
      rawText: serializer.fromJson<String>(json['rawText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'fieldSpecId': serializer.toJson<int>(fieldSpecId),
      'rawText': serializer.toJson<String>(rawText),
    };
  }

  TextFieldDatumModel copyWith(
          {int entryId, int fieldSpecId, String rawText}) =>
      TextFieldDatumModel(
        entryId: entryId ?? this.entryId,
        fieldSpecId: fieldSpecId ?? this.fieldSpecId,
        rawText: rawText ?? this.rawText,
      );
  @override
  String toString() {
    return (StringBuffer('TextFieldDatumModel(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId, ')
          ..write('rawText: $rawText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(entryId.hashCode, $mrjc(fieldSpecId.hashCode, rawText.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TextFieldDatumModel &&
          other.entryId == this.entryId &&
          other.fieldSpecId == this.fieldSpecId &&
          other.rawText == this.rawText);
}

class TextFieldDataCompanion extends UpdateCompanion<TextFieldDatumModel> {
  final Value<int> entryId;
  final Value<int> fieldSpecId;
  final Value<String> rawText;
  const TextFieldDataCompanion({
    this.entryId = const Value.absent(),
    this.fieldSpecId = const Value.absent(),
    this.rawText = const Value.absent(),
  });
  TextFieldDataCompanion.insert({
    @required int entryId,
    @required int fieldSpecId,
    @required String rawText,
  })  : entryId = Value(entryId),
        fieldSpecId = Value(fieldSpecId),
        rawText = Value(rawText);
  static Insertable<TextFieldDatumModel> custom({
    Expression<int> entryId,
    Expression<int> fieldSpecId,
    Expression<String> rawText,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (fieldSpecId != null) 'field_spec_id': fieldSpecId,
      if (rawText != null) 'raw_text': rawText,
    });
  }

  TextFieldDataCompanion copyWith(
      {Value<int> entryId, Value<int> fieldSpecId, Value<String> rawText}) {
    return TextFieldDataCompanion(
      entryId: entryId ?? this.entryId,
      fieldSpecId: fieldSpecId ?? this.fieldSpecId,
      rawText: rawText ?? this.rawText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (fieldSpecId.present) {
      map['field_spec_id'] = Variable<int>(fieldSpecId.value);
    }
    if (rawText.present) {
      map['raw_text'] = Variable<String>(rawText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TextFieldDataCompanion(')
          ..write('entryId: $entryId, ')
          ..write('fieldSpecId: $fieldSpecId, ')
          ..write('rawText: $rawText')
          ..write(')'))
        .toString();
  }
}

class $TextFieldDataTable extends TextFieldData
    with TableInfo<$TextFieldDataTable, TextFieldDatumModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $TextFieldDataTable(this._db, [this._alias]);
  final VerificationMeta _entryIdMeta = const VerificationMeta('entryId');
  GeneratedIntColumn _entryId;
  @override
  GeneratedIntColumn get entryId => _entryId ??= _constructEntryId();
  GeneratedIntColumn _constructEntryId() {
    return GeneratedIntColumn(
      'entry_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fieldSpecIdMeta =
      const VerificationMeta('fieldSpecId');
  GeneratedIntColumn _fieldSpecId;
  @override
  GeneratedIntColumn get fieldSpecId =>
      _fieldSpecId ??= _constructFieldSpecId();
  GeneratedIntColumn _constructFieldSpecId() {
    return GeneratedIntColumn(
      'field_spec_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rawTextMeta = const VerificationMeta('rawText');
  GeneratedTextColumn _rawText;
  @override
  GeneratedTextColumn get rawText => _rawText ??= _constructRawText();
  GeneratedTextColumn _constructRawText() {
    return GeneratedTextColumn(
      'raw_text',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [entryId, fieldSpecId, rawText];
  @override
  $TextFieldDataTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'text_field_data';
  @override
  final String actualTableName = 'text_field_data';
  @override
  VerificationContext validateIntegrity(
      Insertable<TextFieldDatumModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id'], _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('field_spec_id')) {
      context.handle(
          _fieldSpecIdMeta,
          fieldSpecId.isAcceptableOrUnknown(
              data['field_spec_id'], _fieldSpecIdMeta));
    } else if (isInserting) {
      context.missing(_fieldSpecIdMeta);
    }
    if (data.containsKey('raw_text')) {
      context.handle(_rawTextMeta,
          rawText.isAcceptableOrUnknown(data['raw_text'], _rawTextMeta));
    } else if (isInserting) {
      context.missing(_rawTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId, fieldSpecId};
  @override
  TextFieldDatumModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TextFieldDatumModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TextFieldDataTable createAlias(String alias) {
    return $TextFieldDataTable(_db, alias);
  }
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AlignmentsTable _alignments;
  $AlignmentsTable get alignments => _alignments ??= $AlignmentsTable(this);
  $CardsTable _cards;
  $CardsTable get cards => _cards ??= $CardsTable(this);
  $CardFormatsTable _cardFormats;
  $CardFormatsTable get cardFormats => _cardFormats ??= $CardFormatsTable(this);
  $ComponentsTable _components;
  $ComponentsTable get components => _components ??= $ComponentsTable(this);
  $ComponentTypesTable _componentTypes;
  $ComponentTypesTable get componentTypes =>
      _componentTypes ??= $ComponentTypesTable(this);
  $DecksTable _decks;
  $DecksTable get decks => _decks ??= $DecksTable(this);
  $EntriesTable _entries;
  $EntriesTable get entries => _entries ??= $EntriesTable(this);
  $EntriesTagsTable _entriesTags;
  $EntriesTagsTable get entriesTags => _entriesTags ??= $EntriesTagsTable(this);
  $EntryTypesTable _entryTypes;
  $EntryTypesTable get entryTypes => _entryTypes ??= $EntryTypesTable(this);
  $FieldDataTable _fieldData;
  $FieldDataTable get fieldData => _fieldData ??= $FieldDataTable(this);
  $FieldSpecsTable _fieldSpecs;
  $FieldSpecsTable get fieldSpecs => _fieldSpecs ??= $FieldSpecsTable(this);
  $FieldTypesTable _fieldTypes;
  $FieldTypesTable get fieldTypes => _fieldTypes ??= $FieldTypesTable(this);
  $FillColorsTable _fillColors;
  $FillColorsTable get fillColors => _fillColors ??= $FillColorsTable(this);
  $HighlightColorsTable _highlightColors;
  $HighlightColorsTable get highlightColors =>
      _highlightColors ??= $HighlightColorsTable(this);
  $ImageFieldDataTable _imageFieldData;
  $ImageFieldDataTable get imageFieldData =>
      _imageFieldData ??= $ImageFieldDataTable(this);
  $StructuresTable _structures;
  $StructuresTable get structures => _structures ??= $StructuresTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  $TextComponentsTable _textComponents;
  $TextComponentsTable get textComponents =>
      _textComponents ??= $TextComponentsTable(this);
  $TextFieldDataTable _textFieldData;
  $TextFieldDataTable get textFieldData =>
      _textFieldData ??= $TextFieldDataTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        alignments,
        cards,
        cardFormats,
        components,
        componentTypes,
        decks,
        entries,
        entriesTags,
        entryTypes,
        fieldData,
        fieldSpecs,
        fieldTypes,
        fillColors,
        highlightColors,
        imageFieldData,
        structures,
        tags,
        textComponents,
        textFieldData
      ];
}
