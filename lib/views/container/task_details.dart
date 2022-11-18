import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/views/presentational/navbar.dart';

import '../../main.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {

    String calculateDifference(DateTime date) {
      //MMMMd
      final formating = new DateFormat('MMMd');
      String formatedDate ; 
      String daysLeft="";
      int i =0;
      DateTime now = DateTime.now();
      try{
        i=DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
        formatedDate = formating.format(date);
        //print("i = $i");
        if(i==0){
          daysLeft = "Today, $formatedDate";
          }else if(i==1){
            daysLeft = "Tomorrow, $formatedDate";
          }else if(i>1){
            daysLeft = "$i days later, $formatedDate";
          }
          else {
            daysLeft = formatedDate;
          }
      }catch(e){
        daysLeft="";
      }
      return daysLeft;
      }
  
  @override
  Widget build(BuildContext context) {
    final Object? i = ModalRoute.of(context)!.settings.arguments;
    int index ;
    try{
      index = int.parse(i.toString());
    }catch(e){
      index = -1;
    }
    //print(i);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: navbar(),
      ),
      body:Container(
        padding:EdgeInsets.all(8),
        child:Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.text_snippet_outlined),
                ),
                //Text(index != -1 ? MyHomePage.tasks[index].date.toString(): 'n'),
                Text(index != -1 ? calculateDifference(MyHomePage.tasks[index].date): '' ,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.flag_sharp),
              ),
          // Expanded(
          //   child: ,
            
          // )
          ],
          ),

          Row(
            children: [
              Text(index != -1 ? MyHomePage.tasks[index].title: '' ,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          )

        ],
        )
      ) ,
      // footer
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.tag,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.alarm,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.image,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_sharp,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  onPressed: () {},
                )
              ],
            )],
            )
      ],
    );
  }
}