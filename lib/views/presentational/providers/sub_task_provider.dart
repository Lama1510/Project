// import 'package:flutter/material.dart';
// import 'package:project/models/sub_task.dart';
// import 'package:project/models/task.dart';
// import 'package:project/views/presentational/providers/task_list.dart';

// class SubTaskProvider extends ChangeNotifier {
//   String subtitle=""; 

//   SubTaskProvider();
 
//   final SubTask _subTask = SubTask(subtitle: SubTaskProvider().subtitle);

//   // get tasks list :
//   SubTask get subTasks {
//     return _subTask;
//   }

//   // add subtask :
//   addSubTask(Task task,SubTask subTask){
//     try{
//       TaskList().exists(task) ?
//       task.subTasks.add(subTask)
//       : print("task doesnt exist in subtask list");
//     }catch(e){
//       print ("no sub or no task");
//     }
//     notifyListeners();
//   }   
  
//   // remove specific subtask from tasks list
//   remove(Task task,SubTask subTask){
//     task.subTasks.remove(subTask);
//     notifyListeners();
//   }
  
//   bool existsSubTask(Task task, SubTask subTask){
//     return task.subTasks.contains(task.subTasks)? true: false;
//   }
// }