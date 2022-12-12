import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // menue icon
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.menu),
                //   color: Colors.black,
                // ),
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
        );
  }
}