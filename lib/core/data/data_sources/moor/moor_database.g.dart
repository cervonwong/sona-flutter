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
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cards, decks, entries, entriesTags, tags];
}
