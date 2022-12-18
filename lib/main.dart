// packages :
import 'package:flutter/material.dart';
import 'package:project/views/container/catagory_tasks.dart';
import 'package:project/views/presentational/providers/sub_task_provider.dart';
import 'package:provider/provider.dart';

// widgets of project
import 'package:project/views/container/home.dart';
import 'package:project/views/container/task_details.dart';
import 'package:project/views/presentational/providers/task_list.dart';

void main() {
      runApp(
      ChangeNotifierProvider(
        create: (context) => TaskList(),
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(),
            '/taskDetails': (context) => TaskDetailsScreen(),
            '/catagoryDetails': (context) => CatagoryDetailsScreen()
          },
        )
      )
    );
}

// providers: [
//         ChangeNotifierProvider(
//         create: (context) => TaskList()),
//         Provider(create: (context) => SubTaskProvider()),
//       ],