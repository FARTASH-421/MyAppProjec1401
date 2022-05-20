import 'package:flutter/material.dart';
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
            'فروشگا من',
            style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent,fontFamily: "Nas"),
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
        floatingActionButton: FloatingActionButton(onPressed: () {  },

        ),
      ),
    );
  }
}