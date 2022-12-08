import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:project/models/catagory.dart';


class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
   static List<Catagory> catagorys =[];
  TextEditingController catagoryController =TextEditingController();

  _showDaialog ( context){
    showDialog(context: context,
     builder:(context) => AlertDialog(
      content: TextField(
        decoration: const InputDecoration(
                    labelText: "List Name ",
                    
                  ),
                  controller:catagoryController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  
      ),
      actions: [
           IconButton(onPressed: (){
            setState(() {
               catagorys.add(Catagory(catagory_title: catagoryController.text));
               catagoryController.clear();
             Navigator.of(context).pop();
            });
            }, icon:Icon( Icons.send)),
          ],
     ),
     );

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfilePicture(
                  name: 'LAMA AYAYDAH',
                  radius: 31,
                  fontsize: 21,
                  random: true,
              
                               ),
                               Text(" Sign in or sign up"),
                               IconButton(onPressed: (){}, icon: Icon(Icons.search , color: Colors.black,)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.hexagon_outlined , color: Colors.black,)),
              ],
            )
            
          ), 
          ListTile(
            
            leading: Icon(Icons.inbox),
            title: Text('Inbox'),
            onTap: () => {},
          ),
          SizedBox(
            height: 400,
            child: Expanded(child: 
            ListView.builder(
              itemCount: catagorys.length,
              
              itemBuilder: (context, index) =>ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text("${catagorys[index].catagory_title}"),
              onTap: () => {},
              
            )
            )
            ),
          ),
         
          
          Row(
            children: [
              Expanded(child:  Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        _showDaialog(context);
                      }, icon: Icon(Icons.add , color: Colors.black,)),
                      Text("Add List ")
                    ],
                    
                  ),
                   IconButton(onPressed: (){}, icon: Icon(Icons.settings_applications_outlined, color: Colors.black,)),
                ],
              ),
        ),),
            ],
          )
        ],


      ),
     
    );
  }
}