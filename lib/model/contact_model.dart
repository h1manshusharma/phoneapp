import 'package:hive/hive.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  String fname;
  @HiveField(1)
  String lname;
  @HiveField(2)
  int phone;

  Contact({
    required this.fname,
    required this.lname,
    required this.phone,
  });
}
