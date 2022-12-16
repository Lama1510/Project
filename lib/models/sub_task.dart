class SubTask {
  int? id;
  String? attachment;
  String? location; 
  String? reminder;
  String subtitle = " sub tasks " ;

  //construcror:
  SubTask({this.id,required this.subtitle});

 // SubTask({this.id,this.attachment,  this.location, this.reminder ,required this.subtitle});

  // factory SubTask.fromMap(Map<String, dynamic> data) {
  //   return SubTask(
  //     id: data['id'],
  //     attachment: data['attachment'],
  //     location: data['location'],
  //     reminder: data['reminder'],
  //     subtitle: data['subtitle'],
  //   );
  // }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id':id,
  //     'attachment' : attachment,
  //     'location' : location,
  //     'reminder' : reminder,
  //     'subtitle' : subtitle,
  //   };
  // }

  @override
  String toString() {
    return "attachment : $attachment ,  location : $location , reminder: $reminder";
  }

}