import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:phoneapp/button.dart';
import 'package:phoneapp/contacts.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Cancel"),
                ),
                Text("New Contact"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Done"),
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 60, 58, 58),
                    focusColor: Color.fromARGB(255, 60, 58, 58),
                    hoverColor: Color.fromARGB(255, 60, 58, 58),
                    filled: true,
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 60, 58, 58),
                    focusColor: Color.fromARGB(255, 60, 58, 58),
                    hoverColor: Color.fromARGB(255, 60, 58, 58),
                    filled: true,
                    hintText: "Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
