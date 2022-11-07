import 'package:flutter/material.dart';
import 'task.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onTaskAdd;

  const AddTaskScreen({Key? key, required this.onTaskAdd}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController cataController = TextEditingController();

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
                          IconButton(
                            onPressed: () {
                              _selectDate(context);
                              print(_selectedDate);
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
                  IconButton(
                    onPressed: () {
                      DateTime? d= new DateTime(2017, 9, 7);
                      if(titleController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'please enter task title',
                          gravity: ToastGravity.BOTTOM_LEFT,
                          timeInSecForIosWeb: 2,
                          fontSize: 25.5,
                          backgroundColor: Colors.amber
                          );
                        print("hi text");
                        _selectedDate="";
                        return;
                      }
                      try {
                        d = DateFormat("yMMMMd").parse(_selectedDate);
                      }
                      catch(e) {
                        print("hello from date");
                        d= null;
                        //return;
                      }

                      widget.onTaskAdd(
                        Task(
                          title: titleController.text, 
                          //state: stateController.text,
                          category: cataController.text,
                          // date: _selectedDate !=null ? DateFormat("yMMMMd").parse(_selectedDate) : null
                          date: d
                          ),
                          );
                      Navigator.pop(context);
                      titleController.clear();
                      _selectedDate="";
                      setState(() {
                    });
                    }, 
                    icon:Icon(Icons.send))
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
