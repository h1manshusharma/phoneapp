import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:phoneapp/model/contact_model.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  static const String contactboxkey = "contactboxkey";

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      // Just to make sure it doesn't initialize twice, it was causing some minor issues without this check
      Hive.registerAdapter(ContactAdapter());
    }
    //

    await Hive.openBox<Contact>(contactboxkey);
  }

  void saveContact(Contact contact) {
    Hive.box<Contact>(contactboxkey).add(contact);
  }

  List<Contact> getAllContacts() {
    return Hive.box<Contact>(contactboxkey).values.toList();
  }
}
