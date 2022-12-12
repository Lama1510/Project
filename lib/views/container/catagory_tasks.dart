import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/sub_task.dart';
import 'package:project/models/task.dart';
import 'package:project/views/container/add_task.dart';
import 'package:project/views/presentational/providers/task_list.dart';
import 'package:provider/provider.dart';

class CatagoryDetailsScreen extends StatefulWidget {
  const CatagoryDetailsScreen({super.key});

  @override
  State<CatagoryDetailsScreen> createState() => _CatagoryDetailsScreenState();
}


// void getTasks ( int i){
//    List<String> catagorys =[];
//    int index=0;
//    Consumer<TaskList>(
//     builder: (context, value, child) => 
//    )
  

// }

class _CatagoryDetailsScreenState extends State<CatagoryDetailsScreen> {
 
//  try{

//  } 
//  catch(e){

//  }
  @override
  Widget build(BuildContext context) {
    int I;

    final Object? i = ModalRoute.of(context)!.settings.arguments;
    int? i_tasks =int.parse(i.toString());
    return Scaffold(
      appBar: AppBar (title:  Text("Tasks")),
      body:Consumer <TaskList>(
        builder: (context, value, child) =>  ListView.builder(
          itemCount:value.tasks.length ,
          itemBuilder: (context, index) => Column(
                
            children: [
             // Text(Provider.of<TaskList>(context , listen:true ).tasks[index].title),
            // Text("${value.tasks[index].group}")

              Text("${catagory.values[i_tasks]== value.tasks[index].group? Provider.of<TaskList>(context , listen:true ).tasks[index].title : "" }"),
            ],
          ),
        ),
         )
    );
  }
}