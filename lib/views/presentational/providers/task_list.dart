import 'package:flutter/material.dart';
import 'package:project/models/sub_task.dart';
import 'package:project/models/task.dart';

import 'database.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _dataBaseTasks = [];

  // get tasks list :
  List<Task> get tasks {
    //notifyListeners();
    return _tasks;
  }

  // add a task to tasks list :
  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // add a subtask to a task :
  addSubTask(SubTask sub_task, int task_index) {
    try {
      print("${sub_task.subtitle} is sub task title ");

      _tasks[task_index].subTasks.add(sub_task);
      notifyListeners();
    } catch (e) {
      print("sub task isnt added");
    }
    notifyListeners();
  }

  // remove one task from tasks list
  remove(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // if a task exists in tasks list
  bool exists(Task task) {
    return _tasks.contains(task) ? true : false;
  }

  bool existsSub(Task task) {
    return _tasks.contains(task.subTasks) ? true : false;
  }

//db list :
  // retrive and save in it :
  List<Task> get dataBaseTasks {
    _dataBaseTasks= DatabaseProvider.db.getTasks() as List<Task>;
    return _dataBaseTasks;
  }
}
