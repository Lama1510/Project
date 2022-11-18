class SubTask {
  String? attachment;
  String? location; 
  String? reminder;

  //construcror:
  SubTask({required this.attachment, required this.location, this.reminder});

  @override
  String toString() {
    return "attachment : $attachment ,  location : $location , reminder: $reminder";
  }

}