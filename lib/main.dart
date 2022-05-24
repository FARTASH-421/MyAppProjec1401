import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/LongPage.dart';
import 'package:my_pojects/Profile/Header_page.dart';
import 'package:my_pojects/Profile/account_page.dart';
import 'package:my_pojects/SingUp_Page.dart';
import 'package:my_pojects/Profile/setting_page.dart';
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
  final isDarkMode = Settings.getValue<bool>(HeaderPage.keyDarkMode, true);
  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: HeaderPage.keyDarkMode,
      defaultValue: true,
      builder: (_,isDarkMode,__)=> MaterialApp(
        title: 'Stores',
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
          primaryColor: Colors.teal,
          accentColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFF170635),
          canvasColor: Color(0xFF170635),
        )
        : ThemeData.light().copyWith(accentColor: Colors.black38),

        home:LongPage(),
      ),
    );
  }
}



