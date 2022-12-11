// packages :
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// widgets of project
import 'package:project/views/container/home.dart';
import 'package:project/views/container/task_details.dart';
import 'package:project/views/presentational/task_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskList(),
      child:MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/taskDetails': (context) => TaskDetailsScreen(),
        },
        )
      )
    );
  }


