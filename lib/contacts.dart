import 'package:flutter/material.dart';
import 'package:phoneapp/add_contacts.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  bool isAdding = false;
  final List<Map> users = [
    {"Name": "xyz", "phone": 643432, "email": "himada@kjlfsl.com"},
    {"Name": "Kfsg", "phone": 643222, "email": "himada@kjlfsfl.com"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Center(
          child: Text(
            "Groups",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Contacts"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAdding = true;
                });
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      body: isAdding
          ? AddContact()
          : Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
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
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                Container(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          "https://instagram.fslv1-1.fna.fbcdn.net/v/t51.2885-19/197059297_648665832755876_1296887896743691820_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fslv1-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=SQdo2e-x0ccAX8SY5X2&tn=erf0_UnRKMFbOTN4&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT8GK2t7OKM5dbjOibPIx9GvLNpCvoPRthblmyouVm6nHQ&oe=62B7A2C1&_nc_sid=8fd12b",
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Himanshu Sharma",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text("My Card"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: ListTile(
                          title: Text(users[index]["Name"]),
                        ),
                      );
                    },
                    itemCount: users.length,
                  ),
                ),
              ],
            ),
    );
  }
}
