import 'package:flutter/material.dart';

class Elevetedbutton extends StatelessWidget {
  final String text1;
  final String text2;
  final Function onPressed;

  const Elevetedbutton(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
        fixedSize: const Size(80, 80),
        shape: const CircleBorder(),
        surfaceTintColor: Colors.grey,
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(3)),
          Text(
            text1,
            style: TextStyle(fontSize: 30),
          ),
          Text(text2),
        ],
      ),
    );
  }
}
