import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/sub_task.dart';
import '../../main.dart';
import '../../models/task.dart';


class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  TextEditingController subtaskController =TextEditingController();
   List<SubTask> subtasks = [ ];
   

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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    
    int task_index ;
  
    try{
      task_index = int.parse(i.toString());
    }catch(e){
      task_index = -1;
    }

   
    //print(i);
    _showDaialog(context){
        showDialog(context: context, builder: (context) =>AlertDialog(
          content:TextFormField(
                  decoration: const InputDecoration(
                    labelText: "sub Task Title ",
                  ),
                  controller: subtaskController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ), 
          actions: [
           IconButton(onPressed: (){
             setState(() {
            MyHomePage.tasks[task_index].subTasks.add(SubTask(subtitle: subtaskController.text)) ;
           // subtasks.add(SubTask(subtitle: subtaskController.text));
           
                     subtaskController.clear();
                     Navigator.of(context).pop();

             });
              
            }, icon:Icon( Icons.send)),
          

          ],
        ) ,
      );


      }
       int counter ;
    try{
       counter =MyHomePage.tasks[task_index].subTasks.length;
    }catch(e){
      counter=0;

    }
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Inbox" ,  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
      ),
      body:
         Container(
          padding:EdgeInsets.all(8),
          height: 100,
          
          color: Colors.white,
          child:Expanded(child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Row(
           children: [
             IconButton(
               onPressed: () {
                
               },
               icon: Icon(Icons.text_snippet_outlined),
             ),
             //Text(index != -1 ? MyHomePage.tasks[index].date.toString(): 'n'),
             Text(task_index != -1 ? calculateDifference(MyHomePage.tasks[task_index].date): '' ,
               style: TextStyle(color: Colors.black),
             ),
           
           ],
         ),
         IconButton(
             onPressed: () {},
             icon: Icon(Icons.flag_sharp),
           ),
            ],
            ),
      
            Row(
         children: [
      
           // Text(task_index != -1 ? MyHomePage.tasks[task_index].title: '' ,
           // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
           // ),
           Text(task_index != -1 ? MyHomePage.tasks[task_index].title: '' ,
           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
           ),
          
         ],
           
            ),
            SizedBox(
              height: 50,
            ),
            
             Container(
              
          
          height: 100,
         

               child:Column(
                children: [
                   Expanded(
                

            
                 child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  itemCount:counter,
                  
                  itemBuilder: (context, Index) => Column(
                    children: [
                      Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             IconButton(
                               onPressed: (){},
                               icon: Icon(Icons.check_box_rounded, color: Colors.black45,)
                               ),
                              // Text(subtasks[Index].subtitle)
                              // Text( MyHomePage.tasks[task_index].subTasks![Index].subtitle.isNotEmpty? MyHomePage.tasks[task_index].subTasks![Index].subtitle : " empty"),
                               Text(MyHomePage.tasks[task_index].subTasks[Index].subtitle )
                           ],
                         ),
                    ],
                  )
                            
                            ),
               
               
           ),
                ],
               )
             )
      
          ],
          
          )
          )
      
        ),
      
      
     
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
                  onPressed: () {
                    _showDaialog(context);

                    
                  },
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