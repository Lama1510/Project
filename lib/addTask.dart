import 'package:flutter/material.dart';
import 'task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onTaskAdd;

  const AddTaskScreen({Key? key, required this.onTaskAdd}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController cataController = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Task Title ",
                  ),
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "Task Title ",
                //   ),
                //   controller: stateController,
                //   keyboardType: TextInputType.text,
                //   textInputAction: TextInputAction.next,
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "Task Title ",
                //   ),
                //   controller: cataController,
                //   keyboardType: TextInputType.text,
                //   textInputAction: TextInputAction.next,
                // ),
                
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        children: [
                         IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.calendar_month)),
                      IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.flag)),
                      IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.more_sharp)),
                      IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.inbox)),
                        ],
                  
                      ),
                      
                  //     ElevatedButton(
                  //   child: Icon(Icons.send, color: Colors.black,) ,
                  //   onPressed: () {
                  //    widget.onTaskAdd(
                  //     Task(
                  //       title: titleController.text, 
                  //       state: stateController.text,
                  //        category: cataController.text ),);
                  //   Navigator.pop(context);
                  //   titleController.clear();
                  // },),
                  IconButton(onPressed: () {
                     widget.onTaskAdd(
                      Task(
                        title: titleController.text, 
                        state: stateController.text,
                         category: cataController.text ),);
                    Navigator.pop(context);
                    titleController.clear();
                  }, icon:Icon(Icons.send))
                      ],
                      
                    ) ,
                const SizedBox(
                  height: 50,
                  
                    
                   
                 
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
