import 'package:flutter/material.dart';
import 'package:project/models/task.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks=[];

  // get tasks list :
  List<Task> get tasks {
    //notifyListeners();
    return _tasks;
  }

  // add a task to tasks list :
  addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }
  
  // remove one task from tasks list
  remove(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
  
  // if a task exists in tasks list
  bool exists(Task task){
    return _tasks.contains(task)? true: false;
  }
}