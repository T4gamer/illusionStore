import 'package:mongo_dart/mongo_dart.dart';

class MongoDbConnection {
  static final MongoDbConnection _singleton = MongoDbConnection._internal();

  factory MongoDbConnection() {
    return _singleton;
  }

  MongoDbConnection._internal();

  Db? _db;

  Future<Db> getDatabase() async {
    if (_db == null) {
      final db = Db('mongodb://localhost:27017/my_database');
      await db.open();
      _db = db;
    }
    return _db!;
  }
}
