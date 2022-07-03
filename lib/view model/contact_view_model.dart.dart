import 'package:flutter/cupertino.dart';
import 'package:phoneapp/model/contact_model.dart';

import '../services/loacalstorageservice.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact> get contacts => LocalStorageService().getAllContacts();

  void addContact(Contact contact) {
    LocalStorageService().saveContact(contact);
    notifyListeners();
  }
}
