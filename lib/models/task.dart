import 'package:project/models/sub_task.dart';

class Task {
  int? id;
  String title;
  DateTime  date = DateTime(2017, 9, 7);
  String   ? state; 
//String ?  category;
  List<SubTask> subTasks =[] ;

  //construcror:
  Task({this.id,required this.title,  required this.date });
  //Task({required this.title, required this.state , required this.category, this.date});

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data['id'],
      title: data['title'],
      date: data['date'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id' :id,
      'title' : title,
      'date' : date,
    };
  }

  @override
  String toString() {
    return "title : $title , date : $date";
  }

}