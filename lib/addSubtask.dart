// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'main.dart';
// import 'models/sub_task.dart';
// import 'models/task.dart';

// class AddSubTask extends StatefulWidget{
  
//  final Function(Task) onTaskAdd;

//   AddSubTask({Key? key, required this.onTaskAdd}) : super(key: key);

//   @override
//   _AddSubTaskStatecreateState() => _AddSubTaskState();
  
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }



// }
// class _AddSubTaskState extends State <AddSubTask> {
//   TextEditingController subtaskController =TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);
//     return Padding(
//                                    padding: mediaQueryData.viewInsets,
                                 
//                                   child: SingleChildScrollView(
//                                     child: Container(
//                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                                       child :Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: "sub Task Title ",
//                   ),
//                   controller: subtaskController,
//                   keyboardType: TextInputType.text,
//                   textInputAction: TextInputAction.next,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
                            
//                             },
//                             icon: Icon(Icons.calendar_month)
//                             ),
//                           IconButton(
//                             onPressed: () {
                              
//                             },
//                             icon: Icon(Icons.flag)
//                             ),
//                           IconButton(onPressed: () {
                              
//                             },
//                             icon: Icon(Icons.more_sharp)
//                             ),
//                           IconButton(
//                             onPressed: () {
                              
//                             },
//                             icon: Icon(Icons.inbox)
//                             ),
//                         ],
//                       ),
//                       IconButton(
//                         onPressed: () {
                          
                          
                          
//                           setState(() {
//                             MyHomePage.tasks[task].subTasks?.add(SubTask(subtitle: subtaskController.text)) ;
//                           subtaskController.clear();
//                           });
//                           Navigator.of(context).pop();
//                         },
//                         icon:Icon(Icons.send)
//                       )
//                       ],
//                 ) ,
//                 const SizedBox(
//                   height: 50,                  
//                 )
//               ],
//             ),
//           ),
//                                     ),
//                                   )
                                
                                
//                                 );
                                
        
//   }

// }
