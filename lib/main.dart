import 'package:flutter/material.dart';
import 'package:phoneapp/add_contacts.dart';

import 'keypad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: Keypad(),
    );
  }
}
