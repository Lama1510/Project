// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Contact APP'),
    );
  }
}
// class _MyAppState extends State<MyApp> {
// This widget is the root of your application.

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [
    Task(title: " studing ", state: "not yet ", category: "category"),
  ];
  void _taskAdded(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
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
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(8),
              height: 100,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                  Text(
                    "Tasks : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              )),
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(8),
              height: 100,
              child: Expanded(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                  Text(
                    " completed : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return AddTaskScreen(onTaskAdd: _taskAdded);
              });
        },
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: [
        
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                  icon: const Icon(
                    Icons.check_box,
                    color: Colors.black,
                  ),
                  onPressed: () {},),
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
                  onPressed: () {  },)
          ],
         )

      ],
    );
  }
}

// void taskAdded(Task task) {
//             setState(() {
//               tasks.add(task);
//             });
//           }
