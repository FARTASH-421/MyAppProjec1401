import 'package:flutter/material.dart';
import 'package:my_pojects/ShopButtonNavigator.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stores',
      color: Colors.blue,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          leading: Icon( Icons.arrow_back, color: Colors.black),
          elevation: 0,
          title: Text(
            'MyDigiRead',
            style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent,fontFamily: "Kurale"),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.dehaze,color: Colors.black,), onPressed: () { },
            )
          ],
        ),
        body: Center(

          child: Text('خوش آمدید',
            style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlue,
                fontFamily: "Nas"
            ),
          ),
        ),
        bottomNavigationBar: ShopButtonNavigator(),
        floatingActionButton: FloatingActionButton(onPressed: (){},
          backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.add_shopping_cart,color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}