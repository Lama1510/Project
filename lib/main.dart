//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/views/presentational/navbar.dart';
import 'package:project/views/container/task_details.dart';
import 'views/container/add_task.dart';
import 'models/task.dart';

void main() {
  runApp(
    MaterialApp(
        routes: {
          '/' : (context) => MyHomePage(),
          '/taskDetails' : (context) => TaskDetailsScreen(),
        },
      )
  );
}

class MyHomePage extends StatefulWidget {
  static List<Task> tasks = [];
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _completedTasks = [];
  void _taskAdded(Task task) {
    setState(() {
      MyHomePage.tasks.add(task);
    });
  }
  String calculateDifference(DateTime date) {
    String day="";
    int i =0;
    DateTime now = DateTime.now();
    //print(DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays);
    try{
      i=DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
      if(i==0){
        day="Today";
      }else if(i==1){
        day="Tomorrow";
      }else{
        day="";
      }
    }catch(e){
      i=2;
    }
    return day;
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    // final today = DateTime(now.year, now.month, now.day);
    // final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: navbar()
      ),
      // double height =MediaQuery.of(context).size.height *0.9;
      body: ListView(
        children: [
          // added tasks
          Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(1),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Tasks:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: MyHomePage.tasks.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/taskDetails', arguments: index
                            );
                          },
                          child : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                     // on pressing on the check box , change the task state into completed
                                      onPressed: () {
                                        setState(() {
                                          //tasks[index].state="c";
                                          _completedTasks.add(MyHomePage.tasks[index]);
                                          //print(tasks[index].state);
                                          MyHomePage.tasks.remove(MyHomePage.tasks[index]);
                                        });
                                        },
                                      icon: Icon(Icons.check_box_outline_blank)),
                                    //icon:Icon(tasks[index].state !="c" ? Icons.check_box_outline_blank : null)),
                                    Text(MyHomePage.tasks[index].title),
                                    //Text(tasks[index].state !="c" ? tasks[index].title : ""),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(MyHomePage.tasks[index].date != null ? 
                                    calculateDifference(MyHomePage.tasks[index].date).toString()
                                    : "" 
                                    )
                                  ],
                                )
                              ],
                            ))
                            ),
                  )
                ],
              )),
          // completed tasks
          Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(1),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Completed:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _completedTasks.length,
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.check_box)
                              ),
                              Text(_completedTasks[index].title),
                              //Text(tasks[index].state =="c" ? _completedTasks[index].title : "")
                          ],
                        )
                        )
                      )
                  ]))
        ],
      ),
      // + add tasks
      floatingActionButton: FloatingActionButton(
        onPressed: () {          
          showModalBottomSheet(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return AddTaskScreen(onTaskAdd: _taskAdded);
              });
        },
        child: Icon(Icons.add),
      ),
      // footer
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.check_box,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.hexagon,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
