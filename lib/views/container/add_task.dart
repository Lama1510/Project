import 'package:flutter/material.dart';
import 'package:project/views/container/side_menu.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:drop_down_list/drop_down_list.dart';
import '../presentational/providers/database.dart';
import '../presentational/providers/task_list.dart';
import 'home.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onTaskAdd;

  const AddTaskScreen({Key? key, required this.onTaskAdd}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController cataController = TextEditingController();
catagory group_catagory = catagory.Inbox;

String _selectedDate = '';

class _AddTaskScreenState extends State<AddTaskScreen> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add( Duration(days: 1095)),
    );
     if (picked != null) {
       setState(() {// we format the selected date and assign it to the state variable
          _selectedDate = new DateFormat.yMMMMd("en_US").format(picked);
          //_selectedDate = new DateFormat.yMMMMd("en_US").format(picked);
        });
     }
  }

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
                 SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    DropdownButton(
                      value: group_catagory,
                      onChanged: (catagory? newValue) {
                                  setState(() {
                                    group_catagory = newValue!;
                                  });
                                },
                      items:  catagory.values.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.name));
                          }).toList(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _selectDate(context);
                              //print(_selectedDate);
                            },
                            icon: Icon(Icons.calendar_month)
                            ),
                          IconButton(
                            onPressed: () {
                              
                            },
                            icon: Icon(Icons.flag)
                            ),
                          IconButton(onPressed: () {
                              
                            },
                            icon: Icon(Icons.more_sharp)
                            ),
                          IconButton(
                            onPressed: () {
                     
                            },
                            icon: Icon(Icons.inbox)
                            ),
                        ],
                      ),
                      Consumer<TaskList>(
                      builder: (context, value, child) {
                        return  IconButton(
                        onPressed: () { 
                          late DateTime d ;
                          if(titleController.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'please enter task title',
                              gravity: ToastGravity.BOTTOM_LEFT,
                              timeInSecForIosWeb: 2,
                              fontSize: 25.5,
                              backgroundColor: Colors.amber
                              );
                            //print("hi text");
                            return;
                          }
                          try {
                            d = DateFormat("yMMMMd").parse(_selectedDate);
                          }
                          catch(e) {
                            print("you didn't add a date");
                            Fluttertoast.showToast(
                              msg: 'please enter task date',
                              gravity: ToastGravity.BOTTOM_LEFT,
                              timeInSecForIosWeb: 2,
                              fontSize: 25.5,
                              backgroundColor: Colors.amber
                              );
                            return;
                          }
                          // print(titleController.text + " : is task title");
                          // print(d.toString() + " : is task date");

                          Task addedTask = Task( title: titleController.text , date: d , group: group_catagory , state: 'toDo' );
                          print("$addedTask added task");
                        
                         
                          DatabaseProvider.db.insertTask(addedTask);
                          print(value.dataBaseTasks.isNotEmpty? DatabaseProvider.db.getTasks():"noth");
                           
                         
                         
                          _selectedDate="";
                          setState(() {
                              value.addTask(addedTask);
                             titleController.clear();
                             Navigator.pop(context);
                          });
                        }, 
                        icon:Icon(Icons.send)
                      );
                      }
                      )                     
                      
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
