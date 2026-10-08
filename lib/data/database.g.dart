// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isOnlineMeta = const VerificationMeta(
    'isOnline',
  );
  @override
  late final GeneratedColumn<bool> isOnline = GeneratedColumn<bool>(
    'is_online',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_online" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    isCompleted,
    isOnline,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['body']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('is_online')) {
      context.handle(
        _isOnlineMeta,
        isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      isOnline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_online'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String content;
  final bool isCompleted;
  final bool isOnline;
  final DateTime? createdAt;
  const TodoItem({
    required this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
    required this.isOnline,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_online'] = Variable<bool>(isOnline);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      isCompleted: Value(isCompleted),
      isOnline: Value(isOnline),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isOnline': serializer.toJson<bool>(isOnline),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith({
    int? id,
    String? title,
    String? content,
    bool? isCompleted,
    bool? isOnline,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => TodoItem(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    isCompleted: isCompleted ?? this.isCompleted,
    isOnline: isOnline ?? this.isOnline,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isOnline: $isOnline, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, content, isCompleted, isOnline, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.isCompleted == this.isCompleted &&
          other.isOnline == this.isOnline &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<bool> isCompleted;
  final Value<bool> isOnline;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.isCompleted = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       content = Value(content);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<bool>? isCompleted,
    Expression<bool>? isOnline,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isOnline != null) 'is_online': isOnline,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<bool>? isCompleted,
    Value<bool>? isOnline,
    Value<DateTime?>? createdAt,
  }) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
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
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isOnline: $isOnline, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SavedCatFactsTable extends SavedCatFacts
    with TableInfo<$SavedCatFactsTable, SavedCatFact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedCatFactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _factMeta = const VerificationMeta('fact');
  @override
  late final GeneratedColumn<String> fact = GeneratedColumn<String>(
    'fact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, fact, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_cat_facts';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedCatFact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fact')) {
      context.handle(
        _factMeta,
        fact.isAcceptableOrUnknown(data['fact']!, _factMeta),
      );
    } else if (isInserting) {
      context.missing(_factMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_savedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedCatFact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedCatFact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fact'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $SavedCatFactsTable createAlias(String alias) {
    return $SavedCatFactsTable(attachedDatabase, alias);
  }
}

class SavedCatFact extends DataClass implements Insertable<SavedCatFact> {
  final int id;
  final String fact;
  final DateTime savedAt;
  const SavedCatFact({
    required this.id,
    required this.fact,
    required this.savedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fact'] = Variable<String>(fact);
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  SavedCatFactsCompanion toCompanion(bool nullToAbsent) {
    return SavedCatFactsCompanion(
      id: Value(id),
      fact: Value(fact),
      savedAt: Value(savedAt),
    );
  }

  factory SavedCatFact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedCatFact(
      id: serializer.fromJson<int>(json['id']),
      fact: serializer.fromJson<String>(json['fact']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fact': serializer.toJson<String>(fact),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  SavedCatFact copyWith({int? id, String? fact, DateTime? savedAt}) =>
      SavedCatFact(
        id: id ?? this.id,
        fact: fact ?? this.fact,
        savedAt: savedAt ?? this.savedAt,
      );
  SavedCatFact copyWithCompanion(SavedCatFactsCompanion data) {
    return SavedCatFact(
      id: data.id.present ? data.id.value : this.id,
      fact: data.fact.present ? data.fact.value : this.fact,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedCatFact(')
          ..write('id: $id, ')
          ..write('fact: $fact, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fact, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedCatFact &&
          other.id == this.id &&
          other.fact == this.fact &&
          other.savedAt == this.savedAt);
}

class SavedCatFactsCompanion extends UpdateCompanion<SavedCatFact> {
  final Value<int> id;
  final Value<String> fact;
  final Value<DateTime> savedAt;
  const SavedCatFactsCompanion({
    this.id = const Value.absent(),
    this.fact = const Value.absent(),
    this.savedAt = const Value.absent(),
  });
  SavedCatFactsCompanion.insert({
    this.id = const Value.absent(),
    required String fact,
    required DateTime savedAt,
  }) : fact = Value(fact),
       savedAt = Value(savedAt);
  static Insertable<SavedCatFact> custom({
    Expression<int>? id,
    Expression<String>? fact,
    Expression<DateTime>? savedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fact != null) 'fact': fact,
      if (savedAt != null) 'saved_at': savedAt,
    });
  }

  SavedCatFactsCompanion copyWith({
    Value<int>? id,
    Value<String>? fact,
    Value<DateTime>? savedAt,
  }) {
    return SavedCatFactsCompanion(
      id: id ?? this.id,
      fact: fact ?? this.fact,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fact.present) {
      map['fact'] = Variable<String>(fact.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedCatFactsCompanion(')
          ..write('id: $id, ')
          ..write('fact: $fact, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $SavedCatFactsTable savedCatFacts = $SavedCatFactsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    todoItems,
    savedCatFacts,
  ];
}

typedef $$TodoItemsTableCreateCompanionBuilder =
    TodoItemsCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      Value<bool> isCompleted,
      Value<bool> isOnline,
      Value<DateTime?> createdAt,
    });
typedef $$TodoItemsTableUpdateCompanionBuilder =
    TodoItemsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<bool> isCompleted,
      Value<bool> isOnline,
      Value<DateTime?> createdAt,
    });

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodoItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodoItemsTable,
          TodoItem,
          $$TodoItemsTableFilterComposer,
          $$TodoItemsTableOrderingComposer,
          $$TodoItemsTableAnnotationComposer,
          $$TodoItemsTableCreateCompanionBuilder,
          $$TodoItemsTableUpdateCompanionBuilder,
          (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
          TodoItem,
          PrefetchHooks Function()
        > {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isOnline = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion(
                id: id,
                title: title,
                content: content,
                isCompleted: isCompleted,
                isOnline: isOnline,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                Value<bool> isCompleted = const Value.absent(),
                Value<bool> isOnline = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion.insert(
                id: id,
                title: title,
                content: content,
                isCompleted: isCompleted,
                isOnline: isOnline,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodoItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodoItemsTable,
      TodoItem,
      $$TodoItemsTableFilterComposer,
      $$TodoItemsTableOrderingComposer,
      $$TodoItemsTableAnnotationComposer,
      $$TodoItemsTableCreateCompanionBuilder,
      $$TodoItemsTableUpdateCompanionBuilder,
      (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
      TodoItem,
      PrefetchHooks Function()
    >;
typedef $$SavedCatFactsTableCreateCompanionBuilder =
    SavedCatFactsCompanion Function({
      Value<int> id,
      required String fact,
      required DateTime savedAt,
    });
typedef $$SavedCatFactsTableUpdateCompanionBuilder =
    SavedCatFactsCompanion Function({
      Value<int> id,
      Value<String> fact,
      Value<DateTime> savedAt,
    });

class $$SavedCatFactsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedCatFactsTable> {
  $$SavedCatFactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fact => $composableBuilder(
    column: $table.fact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedCatFactsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedCatFactsTable> {
  $$SavedCatFactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fact => $composableBuilder(
    column: $table.fact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedCatFactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedCatFactsTable> {
  $$SavedCatFactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fact =>
      $composableBuilder(column: $table.fact, builder: (column) => column);

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);
}

class $$SavedCatFactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedCatFactsTable,
          SavedCatFact,
          $$SavedCatFactsTableFilterComposer,
          $$SavedCatFactsTableOrderingComposer,
          $$SavedCatFactsTableAnnotationComposer,
          $$SavedCatFactsTableCreateCompanionBuilder,
          $$SavedCatFactsTableUpdateCompanionBuilder,
          (
            SavedCatFact,
            BaseReferences<_$AppDatabase, $SavedCatFactsTable, SavedCatFact>,
          ),
          SavedCatFact,
          PrefetchHooks Function()
        > {
  $$SavedCatFactsTableTableManager(_$AppDatabase db, $SavedCatFactsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedCatFactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedCatFactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedCatFactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fact = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
              }) =>
                  SavedCatFactsCompanion(id: id, fact: fact, savedAt: savedAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fact,
                required DateTime savedAt,
              }) => SavedCatFactsCompanion.insert(
                id: id,
                fact: fact,
                savedAt: savedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedCatFactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedCatFactsTable,
      SavedCatFact,
      $$SavedCatFactsTableFilterComposer,
      $$SavedCatFactsTableOrderingComposer,
      $$SavedCatFactsTableAnnotationComposer,
      $$SavedCatFactsTableCreateCompanionBuilder,
      $$SavedCatFactsTableUpdateCompanionBuilder,
      (
        SavedCatFact,
        BaseReferences<_$AppDatabase, $SavedCatFactsTable, SavedCatFact>,
      ),
      SavedCatFact,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$SavedCatFactsTableTableManager get savedCatFacts =>
      $$SavedCatFactsTableTableManager(_db, _db.savedCatFacts);
}
