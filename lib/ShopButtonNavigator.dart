import 'package:flutter/material.dart';
import 'package:my_pojects/Chat.dart';
import 'package:my_pojects/Favorite.dart';
import 'package:my_pojects/Profile.dart';
import 'package:my_pojects/Shoping.dart';
import 'package:my_pojects/home_page.dart';

class ShopButtonNavigator  extends StatefulWidget {

  @override
  State<ShopButtonNavigator > createState() => _ShopButtonNavigatorState();
}

class _ShopButtonNavigatorState extends State<ShopButtonNavigator > {
  final scrrens= [ Profile(), Chat(), Shoping(), Favorite(), Home(),];
  int currentIndex =4 ;
  @override

  Widget build(BuildContext context) =>MaterialApp(
  debugShowCheckedModeBanner: false,
  title:'DigiGreen',
  color: Colors.lightGreenAccent,
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
  );

}

// shape: CircularNotchedRectangle(),
// notchMargin: 10,
// clipBehavior: Clip.antiAlias,
//
// child: Container(
// height: 60,
// color: Colors.orange,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container (
// width: MediaQuery.of(context).size.width/2-30,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Icon(Icons.person_outline,size: 30,color: Colors.white,),
// Icon(Icons.message_outlined,size: 30, color: Colors.white,),
// ],
// ),
// ),
// Container(
// width: MediaQuery.of(context).size.width/2-30,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children:[
// Icon(Icons.border_all,size: 30,color: Colors.white,
// ),
//
// Icon(Icons.home,size: 30, color: Colors.white)
// ],
// ),
// ),
// ],
// ),
// ),
