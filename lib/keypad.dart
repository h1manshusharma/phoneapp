import 'package:flutter/material.dart';
import 'package:phoneapp/contacts.dart';
import 'package:phoneapp/favorites.dart';
import 'package:phoneapp/recents.dart';
import 'package:phoneapp/voicemail.dart';

import 'button.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class Keypad extends StatefulWidget {
  const Keypad({Key? key}) : super(key: key);

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  bool isDisabled = true;
  int currentindex = 3;
  final screens = [
    const Favorites(),
    const Recents(),
    const Contacts(),
    const Keypad(),
    const Voicemail()
  ];

  TextEditingController _textEditingController = TextEditingController();

  void moveTextCursorPosition() {
    _textEditingController.selection = TextSelection(
        baseOffset: _textEditingController.text.length,
        extentOffset: _textEditingController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentindex == 3
            ? Column(
                children: [
                  Container(
                    width: 255,
                    child: AutoSizeTextField(
                      minLines: 1,
                      maxLines: 1,
                      style: TextStyle(fontSize: 30),
                      controller: _textEditingController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  isDisabled == true
                      ? Text("")
                      : const Text(
                          "Add Number",
                          style: TextStyle(color: Colors.blue),
                        ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Elevetedbutton(
                              text1: "1",
                              text2: "",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}1';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "2",
                              text2: "ABC",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}2';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "3",
                              text2: "DEF",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}3';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Elevetedbutton(
                              text1: "4",
                              text2: "GHI",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}4';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "5",
                              text2: "JKL",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}5';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "6",
                              text2: "MNO",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}6';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Elevetedbutton(
                              text1: "7",
                              text2: "PQRS",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}7';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "8",
                              text2: "TUV",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}8';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "9",
                              text2: "WXYZ",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}9';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Elevetedbutton(
                              text1: "*",
                              text2: "",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}*';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "0",
                              text2: "+",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}0';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                          Elevetedbutton(
                              text1: "#",
                              text2: "",
                              onPressed: () {
                                _textEditingController.text =
                                    '${_textEditingController.text}#';
                                moveTextCursorPosition();
                                setState(() {
                                  isDisabled = false;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          fixedSize: const Size(70, 70),
                          shape: const CircleBorder(),
                          surfaceTintColor: Colors.grey,
                        ),
                        child: const Icon(Icons.phone),
                      ),
                      isDisabled == true
                          ? Container(
                              width: 70,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                _textEditingController.text =
                                    _textEditingController.text.substring(0,
                                        _textEditingController.text.length - 1);
                                if (_textEditingController.text == "") {
                                  setState(() {
                                    isDisabled = true;
                                  });
                                }
                                moveTextCursorPosition();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                fixedSize: const Size(70, 70),
                                shape: const CircleBorder(),
                                surfaceTintColor: Colors.grey,
                              ),
                              child: const Icon(Icons.backspace),
                            ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                  ),
                ],
              )
            : screens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        //selectedfontsize
        //unselectedfontsize
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) => setState(() => currentindex = index),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.time_to_leave),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.voicemail),
            label: "",
          ),
        ],
      ),
    );
  }
}
