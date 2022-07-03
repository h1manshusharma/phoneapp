import 'package:flutter/material.dart';

import 'package:phoneapp/screens/keypad.dart';
import 'package:phoneapp/services/loacalstorageservice.dart';
import 'package:phoneapp/services/themeService.dart';
import 'package:phoneapp/view%20model/contact_view_model.dart.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorageService = LocalStorageService();
  await localStorageService.initializeHive();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// themeService.darkTheme  => true

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(
            create: (_) => ThemeService(sharedPreferences)),
        ChangeNotifierProvider<ContactViewModel>(
            create: (_) => ContactViewModel()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeService = Provider.of<ThemeService>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Phone App',
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor:
                    themeService.darkTheme ? Colors.black : Colors.cyan),
            home: const Keypad(),
          );
        },
      ),
    );
  }
}

// (
//               colorScheme: ColorScheme.fromSeed(
//                   brightness: themeService.darkTheme
//                       ? Brightness.dark
//                       : Brightness.light,
//                   seedColor: Colors.indigo),
//             ),
