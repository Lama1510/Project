class SubTask {
  String? attachment;
  String? location; 
  String? reminder;
  String subtitle ;

  //construcror:
  SubTask({this.attachment,  this.location, this.reminder ,required this.subtitle});
  

  @override
  String toString() {
    return "attachment : $attachment ,  location : $location , reminder: $reminder";
  }

}