// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Content extends DataClass implements Insertable<Content> {
  final int id;
  final String title;
  final String innercontent;
  final DateTime createdate;
  Content(
      {required this.id,
      required this.title,
      required this.innercontent,
      required this.createdate});
  factory Content.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Content(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      innercontent: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}innercontent'])!,
      createdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}createdate'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['innercontent'] = Variable<String>(innercontent);
    map['createdate'] = Variable<DateTime>(createdate);
    return map;
  }

  ContentsCompanion toCompanion(bool nullToAbsent) {
    return ContentsCompanion(
      id: Value(id),
      title: Value(title),
      innercontent: Value(innercontent),
      createdate: Value(createdate),
    );
  }

  factory Content.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Content(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      innercontent: serializer.fromJson<String>(json['innercontent']),
      createdate: serializer.fromJson<DateTime>(json['createdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'innercontent': serializer.toJson<String>(innercontent),
      'createdate': serializer.toJson<DateTime>(createdate),
    };
  }

  Content copyWith(
          {int? id,
          String? title,
          String? innercontent,
          DateTime? createdate}) =>
      Content(
        id: id ?? this.id,
        title: title ?? this.title,
        innercontent: innercontent ?? this.innercontent,
        createdate: createdate ?? this.createdate,
      );
  @override
  String toString() {
    return (StringBuffer('Content(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('innercontent: $innercontent, ')
          ..write('createdate: $createdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, innercontent, createdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Content &&
          other.id == this.id &&
          other.title == this.title &&
          other.innercontent == this.innercontent &&
          other.createdate == this.createdate);
}

class ContentsCompanion extends UpdateCompanion<Content> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> innercontent;
  final Value<DateTime> createdate;
  const ContentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.innercontent = const Value.absent(),
    this.createdate = const Value.absent(),
  });
  ContentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String innercontent,
    this.createdate = const Value.absent(),
  })  : title = Value(title),
        innercontent = Value(innercontent);
  static Insertable<Content> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? innercontent,
    Expression<DateTime>? createdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (innercontent != null) 'innercontent': innercontent,
      if (createdate != null) 'createdate': createdate,
    });
  }

  ContentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? innercontent,
      Value<DateTime>? createdate}) {
    return ContentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      innercontent: innercontent ?? this.innercontent,
      createdate: createdate ?? this.createdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (innercontent.present) {
      map['innercontent'] = Variable<String>(innercontent.value);
    }
    if (createdate.present) {
      map['createdate'] = Variable<DateTime>(createdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('innercontent: $innercontent, ')
          ..write('createdate: $createdate')
          ..write(')'))
        .toString();
  }
}

class $ContentsTable extends Contents with TableInfo<$ContentsTable, Content> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _innercontentMeta =
      const VerificationMeta('innercontent');
  @override
  late final GeneratedColumn<String?> innercontent = GeneratedColumn<String?>(
      'innercontent', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createdateMeta = const VerificationMeta('createdate');
  @override
  late final GeneratedColumn<DateTime?> createdate = GeneratedColumn<DateTime?>(
      'createdate', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [id, title, innercontent, createdate];
  @override
  String get aliasedName => _alias ?? 'contents';
  @override
  String get actualTableName => 'contents';
  @override
  VerificationContext validateIntegrity(Insertable<Content> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('innercontent')) {
      context.handle(
          _innercontentMeta,
          innercontent.isAcceptableOrUnknown(
              data['innercontent']!, _innercontentMeta));
    } else if (isInserting) {
      context.missing(_innercontentMeta);
    }
    if (data.containsKey('createdate')) {
      context.handle(
          _createdateMeta,
          createdate.isAcceptableOrUnknown(
              data['createdate']!, _createdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Content map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Content.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ContentsTable createAlias(String alias) {
    return $ContentsTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ContentsTable contents = $ContentsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contents];
}
