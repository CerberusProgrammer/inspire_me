import 'package:sqflite/sqflite.dart';

class Data {
  static List<Map<String, dynamic>> favoriteQuotes = [];
  static List<Map<String, dynamic>> historyQuotes = [];

  void createTable(Database db) async {
    await db.execute('''
    CREATE TABLE quotes (
      _id TEXT PRIMARY KEY,
      content TEXT,
      author TEXT,
      authorId TEXT,
      tags TEXT,
      length INTEGER,
      favorite INTEGER
    );
  ''');
  }
}
