class Task {
  String title;
 // DateTime? _date;
  String   state; 
  String  category;

  //construcror:
  Task({required this.title, required this.state , required this.category});

  //getters and setters :
  //Getter methods :
 // String get title =>title;
 // DateTime? get date =>_date;
 // String get state =>state;
 // String get category =>category;

 
  //Setter methods :
  // set title(String value) {
  //   title = value;
  // }
  //set date(DateTime? value) {
 //   _date = value;
 // }
  // set state (String ? value) {
  //   state = value;
  // }
  // set category(String ? value) {
  //   category = value;
  // }

  @override
  String toString() {
    return "title : $title ,  state : $state , category: $category";
  }


}