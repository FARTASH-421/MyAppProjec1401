import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/Profile/Header_page.dart';
import 'package:my_pojects/splush_screen.dart';

import 'Home/headrWithSearchBox.dart';

Future<void> main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const Store());
}

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final isDarkMode = Settings.getValue<bool>(HeaderPage.keyDarkMode, true);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Digi Green',
        color: Colors.green,
        debugShowCheckedModeBanner: false,

        home: Spalsh(),
      );
}
