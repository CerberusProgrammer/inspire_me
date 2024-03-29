import 'package:sqflite/sqflite.dart';

class Data {
  static List<Map<String, dynamic>> favoriteQuotes = [];
  static List<Map<String, dynamic>> historyQuotes = [];

  static String username = '';

  static Future<void> insertFavorite(Map<String, dynamic> favorite) async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.insert(
      'favorites',
      favorite,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertHistory(Map<String, dynamic> history) async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.insert(
      'history',
      history,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteFavorite(int id) async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.delete(
      'favorites',
      where: 'quote = ?',
      whereArgs: [id],
    );
  }

  static Future<void> deleteHistory(int id) async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.delete(
      'history',
      where: 'quote = ?',
      whereArgs: [id],
    );
  }

  static Future<void> deleteAllFavorites() async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.delete('favorites');
  }

  static Future<void> deleteAllHistories() async {
    final db = await openDatabase(
      'inspire.db',
      version: 1,
    );

    await db.delete('history');
  }
}
