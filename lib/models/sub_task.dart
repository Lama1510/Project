class SubTask {
  int? id;
  String? attachment;
  String? location;
  String? reminder;
  String subtitle = " sub tasks ";
  int? taskId;

  //construcror:
  SubTask({this.id, required this.subtitle,  this.taskId,});
  //SubTask({this.id, required this.subtitle , required this.taskId});
  // SubTask({this.id,this.attachment,  this.location, this.reminder ,required this.subtitle});

  factory SubTask.fromMap(Map<String, dynamic> data) {
    return SubTask(
      id: data['id'],
      subtitle: data['subtitle'],
      taskId: data['subTaskId'],
    );
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'subtitle': subtitle,
  //     'taskId': taskId,
  //   };
  // }

  @override
  String toString() {
    return "attachment : $attachment ,  location : $location , reminder: $reminder";
  }
}
