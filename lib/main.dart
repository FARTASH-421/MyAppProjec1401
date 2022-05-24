import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/LongPage.dart';
import 'package:my_pojects/SingUp_Page.dart';
import 'ShopButtonNavigator.dart';
import 'package:my_pojects/home_page.dart';
import 'package:my_pojects/splush_screen.dart';


Future<void>  main() async {
  await Settings.init(cacheProvider:  SharePreferenceCache());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Store());
}

class Store extends StatefulWidget {
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Stores',
      color: Colors.blue,
      home: LongPage(),

    );
  }
}



