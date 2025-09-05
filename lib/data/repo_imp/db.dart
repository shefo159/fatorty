import 'package:fatorty/data/models/expense.dart';

import '../const/db_text.dart';
import '../repo/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB extends IDatabaseService{

  static Database? database;

  @override
  Future<void> init() async {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'expenses.db');

       DB.database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
        CREATE TABLE $tableExpenses(
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnTitle TEXT NOT NULL,
          $columnCategory TEXT NOT NULL,
          $columnAmount REAL NOT NULL,
          $columnDate TEXT NOT NULL
        )
      ''');
        },
      );
  }
  @override
  Future<void> close() {
    return database!.close();
  }

  @override
  Future<List<Expense>> getAllExpenses() {
    return DB.database!.rawQuery('SELECT * FROM $tableExpenses ORDER BY $columnDate DESC').then((maps) {
      return List.generate(maps.length, (i) {
        return Expense.fromMap(maps[i]);
      });
    });
  }

  @override
  Future<void> insert({required Expense expense}) async {
    await DB.database!.insert(tableExpenses, expense.toMap());
    return Future.value();
  }

  @override
  Future<void> removeExpense(int id) {
    return DB.database!.delete(tableExpenses, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<void> clearExpenses() {
    return DB.database!.delete(tableExpenses);
  }

}