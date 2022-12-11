// import 'package:flutter/material.dart';
// import 'package:project/views/presentational/task_list.dart';
// import 'package:provider/provider.dart';

// class ShowDiaolgOfSubTask extends StatefulWidget{
//   final TextEditingController subtaskController ;
//   ShowDiaolgOfSubTask({Key? key, required this.subtaskController}) : super(key: key);

//   @override
//   _ShowDiaolgOfSubTaskState createState() => _ShowDiaolgOfSubTaskState(subtaskController);
// }

// class _ShowDiaolgOfSubTaskState extends State<ShowDiaolgOfSubTask> {
//     late final TextEditingController subtaskController ;
//   _ShowDiaolgOfSubTaskState(TextEditingController subtaskController){
//     this.subtaskController = subtaskController;
//   }
  
//   @override
//   Widget build(BuildContext context) {
//      showDaialog(context){
//       showDialog(
//         context: context,
//         builder: (context) =>AlertDialog(
//         content:TextFormField(
//                 decoration: const InputDecoration(labelText: "sub Task Title "),
//                 controller: subtaskController,
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//               ), 
//         actions: [
//           IconButton(
//             onPressed: (){
//               MyHomePage.tasks[task_index].subTasks.add(SubTask(subtitle: subtaskController.text)) ;// subtasks.add(SubTask(subtitle: subtaskController.text));
//               subtaskController.clear();
//               Navigator.of(context).pop();
//               // setState(() {

//               // });
//             },
//             icon:Icon( Icons.send)),
//           ],
//         ),
//       );
//   }

//   }
// }

//   //builder: Consumer<TaskList>()
