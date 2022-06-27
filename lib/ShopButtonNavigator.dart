import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/Favorite.dart';
import 'package:my_pojects/Shoping.dart';
import 'package:my_pojects/Home/home_page.dart';
import 'Profile/Header_page.dart';
import 'Profile/ProfilePage.dart';

class ShopButtonNavigator extends StatefulWidget {
  const ShopButtonNavigator({Key? key}) : super(key: key);

  @override
  State<ShopButtonNavigator> createState() => _ShopButtonNavigatorState();
}

class _ShopButtonNavigatorState extends State<ShopButtonNavigator> {

  late Colors color;
  final scrrens = [
    Profiles(),
    BasketShoping(),
    Favorite(),
    Home(),
  ];
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) => ValueChangeObserver<bool>(
        cacheKey: HeaderPage.keyDarkMode,
        defaultValue: true,
        builder: (_, isDarkMode, __) => MaterialApp(
          title: 'Digi Green',
          color: Colors.lightGreen,
          debugShowCheckedModeBanner: false,
          theme: isDarkMode
              ? ThemeData.dark().copyWith(
                  primaryColor: Colors.teal,
                  accentColor: Colors.white,
                  scaffoldBackgroundColor: Color(0xFF041E34),
                  canvasColor: Color(0xFF05182C),
                )
              : ThemeData.light().copyWith(accentColor: Colors.black,
            scaffoldBackgroundColor: Color(0xFFA5C2E0),
            canvasColor: Color(0xFF9DBDCE),
          ),
          home: Scaffold(
            body: scrrens[currentIndex],

            bottomNavigationBar: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              selectedFontSize: 16,
              unselectedFontSize: 13,
              showUnselectedLabels: false,
              elevation: 10,
              onTap: (index) => setState(() => currentIndex = index),
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 30,
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                  ),
                  label: 'Shoping',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_sharp,
                    size: 30,
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30,),
                  label: 'Home',
                ),
              ],
            ),
          ),
        ),
      );
}
