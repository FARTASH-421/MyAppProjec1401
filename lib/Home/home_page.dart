import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Home/SearchBar_Page.dart';
import 'package:my_pojects/Things/Colts.dart';

import '../Things/ComputerAndMobile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int add = 4;

  @override
  Widget build(BuildContext context) {
    Colts _colts = Colts(context);
    Comp _comp= Comp(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        titleTextStyle: const TextStyle(
          fontFamily: "Kurale",
          fontSize: 30,
        ),
        actions: const [
          SearchBar(),
        ],
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _colts.build(context),
          _comp.build(context),
          _colts.build(context),
          _comp.build(context),
          _colts.build(context),
          _comp.build(context),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this.add++;
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
