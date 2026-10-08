import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:offline_app/data/sync.dart' as cat_api;
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isOnline => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class SavedCatFacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fact => text()();
  DateTimeColumn get savedAt => dateTime()();
}

@DriftDatabase(tables: [TodoItems, SavedCatFacts])
class AppDatabase extends _$AppDatabase {
  // AppDatabase(QueryExecutor executor) : super(executor);
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(savedCatFacts);
      }
    },
  );

  Future<String> fetchAndSaveCatFact() async {
    final fetchedFact = await cat_api.fetchCatFacts();
    await into(savedCatFacts).insert(
      SavedCatFactsCompanion.insert(
        fact: fetchedFact.catFact,
        savedAt: DateTime.now(),
      ),
    );
    return fetchedFact.catFact;
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
