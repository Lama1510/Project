//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'addTask.dart';
import 'task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Contact APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];
  final List<Task> _completedTasks = [];
  void _taskAdded(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }
  String calculateDifference(DateTime? date) {
    String day="";
    int i =0;
    DateTime now = DateTime.now();
    //print(DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays);
    try{
      i=DateTime(date!.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // menue icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                ),
                // title 'inbox'
                const Text(
                  " Inbox",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.black),
          ],
        ),
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
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) => Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
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
                                        // int d = 0;
                                        // try {
                                        //   d = calculateDifference(_tasks[index].date);
                                        // }
                                        // catch(e) {
                                        //   print("hello from date");
                                        //   d= null;
                                        //   //return;
                                        // }
                                        setState(() {
                                          //_tasks[index].state="c";
                                          _completedTasks.add(_tasks[index]);
                                          //print(_tasks[index].state);
                                          _tasks.remove(_tasks[index]);
                                        });
                                        },
                                      icon: Icon(Icons.check_box_outline_blank)),
                                    //icon:Icon(_tasks[index].state !="c" ? Icons.check_box_outline_blank : null)),
                                    Text(_tasks[index].title),
                                    //Text(_tasks[index].state !="c" ? _tasks[index].title : ""),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    // if(_tasks[index].date != null){
                                    //     calculateDifference(_tasks[index].date);
                                    //   }
                                    //   else{
                                    //     ""
                                    //   }
                                    
                                    // Text(
                                    //   if(_tasks[index].date != null){
                                    //     calculateDifference(_tasks[index].date);
                                    //   }
                                    //   else{
                                    //     ""
                                    //   }
                                    // )
                                    
                                    Text(_tasks[index].date != null ? 
                                    calculateDifference(_tasks[index].date).toString()
                                    //dateFormatter.format(_tasks[index].date as DateTime)  
                                    : "" 
                                    )
                                  ],
                                )
                              ],
                            )
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
                              //Text(_tasks[index].state =="c" ? _completedTasks[index].title : "")
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
