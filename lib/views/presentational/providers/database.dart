import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../models/task.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static const version = 1;
  static Database? _database;
  final String tableName = 'tasks';
  Future<Database?>  get database async{
    if(_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    path += '$tableName.db';
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async{
          await db.execute('''
          create table $tableName (
          id integer primary key autoincrement,
          title text not null, 
          date date not null, 
          subTasks list
          )
          ''');
      },
    );
  }
  //FOREIGN KEY(taskId) REFERENCES Tasks(taskId) // to subtasks table.
  Future insertTask(Task task) async{
    final db = await database;
    return await db?.insert(tableName, task.toMap());
  }
  Future updateTask(Task task) async{
    final db = await database;
    return await db?.update(tableName, task.toMap(),where: 'id=?',whereArgs: [task.id]);
  }

  Future<List<Task>> getTasks() async{
    final db = await database;
    List<Map<String, dynamic>>? result =  await db?.query(tableName,orderBy: 'id asc');
    List<Task> tasks = [];
    result?.forEach((element) {
      tasks.add(Task.fromMap(element));
    });
    return tasks;
  }
  Future removeTask(int id) async{
    final db = await database;
    return await db?.delete(tableName,where: 'id = ?',whereArgs: [id]);
  }
  Future removeAll() async{
    final db = await database;
    return await db?.delete(tableName);
  }
}