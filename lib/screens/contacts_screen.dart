import 'dart:typed_data';

import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:phoneapp/model/contact_model.dart';
import 'package:phoneapp/screens/contact_detail.dart';
import 'package:phoneapp/view%20model/contact_view_model.dart.dart';

import 'package:phoneapp/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class Contacts extends StatefulWidget {
  const Contacts({
    Key? key,
  }) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

List<Contact> contacts = [];

final TextEditingController _searchContoller = TextEditingController();

class _ContactsState extends State<Contacts> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Groups",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                    const Text(
                      "Contacts",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    IconButton(
                        onPressed: () {
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
                                        width:
                                            MediaQuery.of(context).size.width -
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
                                                    _phoneController
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
                                                              _phoneController
                                                                  .text)));
                                                  // setState(() {
                                                  //   contacts.add(Contact(
                                                  //       fname: _fnameController
                                                  //           .text,
                                                  //       lname: _lnameController
                                                  //           .text,
                                                  //       phone: int.parse(
                                                  //           _phoneController
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
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: GestureDetector(
                                          onTap: openGallery,
                                          child: Column(
                                            children: [
                                              _image != null
                                                  ? CircleAvatar(
                                                      radius: 64,
                                                      backgroundImage:
                                                          MemoryImage(_image!),
                                                    )
                                                  : const CircleAvatar(
                                                      radius: 64,
                                                      backgroundImage: NetworkImage(
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
                                            controller: _phoneController,
                                            decoration: const InputDecoration(
                                                hintText: "Phone Number"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchInput(
                    textController: _searchContoller, hintText: "Search"),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 3,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://instagram.fjai1-2.fna.fbcdn.net/v/t51.2885-19/197059297_648665832755876_1296887896743691820_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai1-2.fna.fbcdn.net&_nc_cat=108&_nc_ohc=dZGggK2NXpAAX9h1nNz&tn=erf0_UnRKMFbOTN4&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT-1l61xv6wP8FUoOgfPedUOY8C7UJW7hDp2fVgdb8P-Lg&oe=62C38041&_nc_sid=8fd12b"),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Himanshu Sharma",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "My Card",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("A"),
                ),
                const Divider(
                  thickness: 3,
                ),
                Flexible(
                  child: Consumer<ContactViewModel>(
                    builder: ((context, value, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.contacts.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                const ContactDetail();
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          value.contacts[index].fname,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 3,
                                  ),
                                ],
                              ),
                            );
                          });

                      //  List.generate(
                      // items.length,
                      // (index) => TransactionCard(
                      //       item: items[index],
                      //     )),
                    }),
                  ),
                  // width: double.infinity,
                  // height: MediaQuery.of(context).size.width,
                  // child: ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: contacts.length,
                  //   itemBuilder: (context, index) {
                  //     return Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Align(
                  //               alignment: Alignment.topLeft,
                  //               child: Text(
                  //                 contacts[index].fname,
                  //                 style: const TextStyle(fontSize: 20),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         const Divider(
                  //           thickness: 3,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
