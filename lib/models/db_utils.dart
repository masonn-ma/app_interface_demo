import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._init();
  static Database? _database;

  DbHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
  }

  Future<void> insertUser(User user) async {
    final db = await instance.database;
    await db.insert('users', {
      'id': user.id,
      'name': user.name,
      'age': user.age,
    });
  }

  Future<void> deleteUser(String id) async {
    final db = await instance.database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<User>> getUsers() async {
    final db = await instance.database;
    final result = await db.query('users');
    return result
        .map(
          (json) => User(
            id: json['id'] as String,
            name: json['name'] as String,
            age: json['age'] as int,
          ),
        )
        .toList();
  }

  List<User> filterUsers(List<User> users, String searchQuery) {
    if (searchQuery.isEmpty) return users;

    final query = searchQuery.toLowerCase();

    // field-specific search
    if (query.contains(":")) {
      final parts = query.split(":");
      if (parts.length != 2) return users;

      final field = parts[0];
      final value = parts[1];

      return users.where((user) {
        switch (field) {
          case "name":
            return user.name.toLowerCase().contains(value);
          case "age":
            return user.age.toString().contains(value);
          case "id":
            return user.id.toLowerCase().contains(value);
          default:
            return false;
        }
      }).toList();
    }

    return users.where((user) {
      return user.name.toLowerCase().contains(query) ||
          user.age.toString().contains(query) ||
          user.id.toLowerCase().contains(query);
    }).toList();
  }

  Future<User?> updateUser(User user) async {
    final db = await instance.database;
    await db.update(
      'users',
      {'name': user.name, 'age': user.age},
      where: 'id = ?',
      whereArgs: [user.id],
    );
    return User(id: user.id, name: user.name, age: user.age);
  }

  Future<void> insertUsersFromJson(List<Map<String, dynamic>> jsonList) async {
    final db = await instance.database;
    final batch = db.batch();

    for (var json in jsonList) {
      final user = User.fromJson(json);

      batch.insert('users', user.toMap());
    }

    await batch.commit(noResult: true);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
