import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import '../../../models/sub_task.dart';
import '../../../models/task.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  static const version = 1;
  static Database? _database;

  final String firstTableName = 'tasks';
  final String secondTableName = 'subTasks';

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    path += 'mydatabase.db';
    return await openDatabase(
      path,
      version: version,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        create table $firstTableName (
          taskId integer primary key autoincrement,
          title text not null, 
          date TEXT as ISO8601 strings ("YYYY-MM-DD") not null, 
          status text NOT NULL,
        )
      ''');
    await db.execute('''
        CREATE TABLE $secondTableName(
          subTaskId INTEGER PRIMARY KEY autoincrement,
          subtitle TEXT NOT NULL,
          taskId INTEGER not null,
        )
      ''');
  }

////////// CRUD ///////////////////////////////////////////////////////////////////////////////////
// for the task :
  Future<List<dynamic>> getTasks() async {
    try {
      final db = await database;
      List<Map<String, dynamic>>? result =
          await db?.query(firstTableName, orderBy: 'taskId asc');
      List<Task> tasks = [];
      result?.forEach((element) {
        tasks.add(Task.fromMap(element));
      });
      return tasks;
    } catch (e) {
      print(" catch in getTasks() ");
    }
    return [];
  }

  Future<dynamic> getTask(int? id) async {
    try {
      final db = await database;
      List<Map<String, Object?>>? task =
          await db?.query('tasks', where: 'taskId=?', whereArgs: [id]);
      return Task.fromMap(task![0]);
    } catch (e) {
      print(" id is $id ");
      //print("catch : no tasks to get");
    }
    return "no tasks to get";
  }

  Future insertTask(Task task) async {
    final db = await database;
    return await db?.insert(firstTableName, task.toMap());
  }

  Future updateTask(Task task) async {
    final db = await database;
    return await db?.update(firstTableName, task.toMap(),
        where: 'taskId=?', whereArgs: [task.id]);
  }
  // Future updateTaskState(Task task) async {
  //   final db = await database;
  //   return await db?.update(firstTableName, task.toMap(),
  //       where: 'taskId=?', whereArgs: [task.id]);
  // }

  Future removeTask(int id) async {
    final db = await database;
    return await db
        ?.delete(firstTableName, where: 'taskId = ?', whereArgs: [id]);
  }

  Future removeAll() async {
    final db = await database;
    return await db?.delete(firstTableName);
  }

// for the subTask :
  Future<dynamic> getsubTasks(int? taskId) async {
    try {
      final db = await database;
      List<Map<String, Object?>>? subTask =
          await db?.query('subTasks', where: 'taskId=?', whereArgs: [taskId]);
      return SubTask.fromMap(subTask![0]);
    } catch (e) {
      //print(" id is $id ");
      print("catch : no sub tasks to get");
    }
    return "no sub tasks to get";
  }

  Future insertSubTask(SubTask subTask, int? taskId) async {
    // sub to map :
    Map<String, dynamic> toMap(SubTask subTask) {
      return {
        'id': subTask.id,
        'subtitle': subTask.subtitle,
        'taskId': taskId,
      };
  }
    final db = await database;
    return await db?.insert(secondTableName, toMap(subTask));
  }

  Future removeSubTask(int id) async {
    final db = await database;
    return await db
        ?.delete(secondTableName, where: 'subTaskId = ?', whereArgs: [id]);
  }
}

//  flutter config --android-sdk
//FOREIGN KEY(taskId) REFERENCES Tasks(taskId) // to subtasks table.