import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoneapp/screens/contacts_screen.dart';
import 'package:phoneapp/screens/favorites.dart';
import 'package:phoneapp/screens/recents.dart';
import 'package:phoneapp/screens/voicemail.dart';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:phoneapp/widgets/button.dart';
import 'package:provider/provider.dart';

import '../model/contact_model.dart';
import '../services/themeService.dart';
import '../view model/contact_view_model.dart.dart';

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

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }

  Uint8List? _image;

  openGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  openCamera() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      body: SafeArea(
        child: currentindex == 3
            ? Column(
                children: [
                  Container(
                    width: 255,
                    child: AutoSizeTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      minLines: 1,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 30),
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
                      : GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                context: context,
                                builder: (context) {
                                  return Flexible(
                                    child: Column(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.all(20),
                                          padding: const EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Cancel"),
                                              const Text("New Contact"),
                                              ElevatedButton(
                                                child: const Text("Done"),
                                                onPressed: () {
                                                  if (_fnameController
                                                          .text.isNotEmpty &&
                                                      _textEditingController
                                                          .text.isNotEmpty) {
                                                    final contactviewmodel =
                                                        Provider.of<
                                                                ContactViewModel>(
                                                            context,
                                                            listen: false);
                                                    contactviewmodel.addContact(
                                                        Contact(
                                                            fname:
                                                                _fnameController
                                                                    .text,
                                                            lname:
                                                                _lnameController
                                                                    .text,
                                                            phone: int.parse(
                                                                _textEditingController
                                                                    .text)));
                                                    // setState(() {
                                                    //   contacts.add(Contact(
                                                    //       fname:
                                                    //           _fnameController
                                                    //               .text,
                                                    //       lname:
                                                    //           _lnameController
                                                    //               .text,
                                                    //       phone: int.parse(
                                                    //           _textEditingController
                                                    //               .text)));
                                                    // });
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          child: GestureDetector(
                                            onTap: openGallery,
                                            child: Column(
                                              children: [
                                                _image != null
                                                    ? CircleAvatar(
                                                        radius: 64,
                                                        backgroundImage:
                                                            MemoryImage(
                                                                _image!),
                                                      )
                                                    : const CircleAvatar(
                                                        radius: 64,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                'https://i.stack.imgur.com/l60Hf.png'),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            TextField(
                                              controller: _fnameController,
                                              decoration: const InputDecoration(
                                                  hintText: "First Name"),
                                            ),
                                            TextField(
                                              controller: _lnameController,
                                              decoration: const InputDecoration(
                                                  hintText: "Last Name"),
                                            ),
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              controller:
                                                  _textEditingController,
                                              decoration: const InputDecoration(
                                                  hintText: "Phone Number"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                            // numberService.number =
                            //     int.parse(_textEditingController.text);
                          },
                          child: const Text(
                            "Add Number",
                            style: TextStyle(color: Colors.blue),
                          ),
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
                      const SizedBox(
                        width: 70,
                      ),
                      ElevatedButton(
                        onLongPress: () {
                          themeService.darkTheme = !themeService.darkTheme;
                        },
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
