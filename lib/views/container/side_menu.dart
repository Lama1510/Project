import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:project/models/catagory.dart';
import 'package:project/models/task.dart';
import 'package:project/views/container/add_task.dart';

import 'catagory_tasks.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfilePicture(
                name: 'LAMA AYAYDAH',
                radius: 31,
                fontsize: 21,
                random: true,
              ),
              Text(" Sign in or sign up"),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.hexagon_outlined,
                    color: Colors.black,
                  )),
            ],
          )),
          SizedBox(
            height: 400,
            child: Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                          leading: Icon(Icons.menu_rounded),
                          title: Text("${catagory.values[index].name}"),
                          onTap: () => {
                            Navigator.pushNamed(context, "/catagoryDetails" , arguments: index)
                          },
                        ))),
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                //  _showDaialog(context);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                          Text("Add List ")
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings_applications_outlined,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
