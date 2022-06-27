import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Home/SearchBar_Page.dart';
import 'package:my_pojects/ShopButtonNavigator.dart';
import 'package:my_pojects/Things/Clothing/Colts.dart';
import 'package:my_pojects/Things/Sports/Sports.dart';

import '../Things/BooksAndThings/BooksAndThings.dart';
import '../Things/Tachonology/ComputerAndMobile.dart';
import 'UploadPage.dart';
import 'body.dart';
import 'headrWithSearchBox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(),
      body: Body() ,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadPage(context: context,),

            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white,
          size: 30,),
// /      //   backgroundColor: Colors.orange[400],
      ),
    );
  }

  AppBar buildAppBar()=>AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      icon: const Icon(Icons.list_outlined,size: 35,),
      onPressed: () { },
    ),
  );

      // Scaffold(
      // appBar: AppBar(
      //   title: const Text("Search"),
      //   titleTextStyle: const TextStyle(
      //     fontFamily: "Kurale",
      //     fontSize: 30,
      //   ),
      //   actions: const [
      //     SearchBar(),
      //   ],
      // ),
      //
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     _comp.build(context),
      //     _colts.build(context),
      //     _book.build(context),
      //     _sport.build(context),
      //
      //   ],
      // ),
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => UploadPage(context: context,),
      //
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add, color: Colors.white,
      //     size: 30,),
      //   backgroundColor: Colors.orange[400],
      // ),
    // );
  }