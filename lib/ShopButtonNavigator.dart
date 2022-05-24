import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/Chat.dart';
import 'package:my_pojects/Favorite.dart';
import 'package:my_pojects/Shoping.dart';
import 'package:my_pojects/home_page.dart';
import 'Profile/Header_page.dart';
import 'Profile/ProfilePage.dart';

class ShopButtonNavigator  extends StatefulWidget {

  @override
  State<ShopButtonNavigator > createState() => _ShopButtonNavigatorState();
}

class _ShopButtonNavigatorState extends State<ShopButtonNavigator > {
  final scrrens= [ Profiles(), Chat(), Shoping(), Favorite(), Home(),];
  int currentIndex =4 ;
  @override

  Widget build(BuildContext context)=>ValueChangeObserver<bool>(
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

  home: Scaffold(
      body: scrrens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      showUnselectedLabels: false,
      elevation: 10,
      onTap: (index) =>setState( () => currentIndex = index ),
      currentIndex: currentIndex,
      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30,),
          label: 'Profile',
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, size: 30,),
            label: 'FeedBack',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart, size: 30,),
          label: 'Shoping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.border_all, size: 30, ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Home',
        ),
      ],

    ),
  ),
  ),
  );
}