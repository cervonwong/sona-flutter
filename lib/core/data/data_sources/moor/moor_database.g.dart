// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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
      @required this.authorName,
      @required this.description});
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
    @required String authorName,
    @required String description,
  })  : name = Value(name),
        authorName = Value(authorName),
        description = Value(description);
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
      false,
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
      false,
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
    } else if (isInserting) {
      context.missing(_authorNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
  $CardsTable _cards;
  $CardsTable get cards => _cards ??= $CardsTable(this);
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
  $ImageFieldDataTable _imageFieldData;
  $ImageFieldDataTable get imageFieldData =>
      _imageFieldData ??= $ImageFieldDataTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  $TextFieldDataTable _textFieldData;
  $TextFieldDataTable get textFieldData =>
      _textFieldData ??= $TextFieldDataTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        cards,
        decks,
        entries,
        entriesTags,
        entryTypes,
        fieldData,
        fieldSpecs,
        imageFieldData,
        tags,
        textFieldData
      ];
}
