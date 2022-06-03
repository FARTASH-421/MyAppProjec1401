import 'package:flutter/material.dart';

import '../Sports/ColtsSport.dart';
import '../Sports/ThaingSport.dart';
import '../Sports/ThingsTravel.dart';
import '../ViewList.dart';


class MyBooks extends StatefulWidget {
  final item;
  const MyBooks({
    this.item,
    Key? key}) : super(key: key);

  @override
  State<MyBooks> createState() => _MyBooksState(item);
}

class _MyBooksState extends State<MyBooks> {
  final item;
  _MyBooksState(this.item);


  @override
  Widget build(BuildContext context) {
    VeiwList list1 = VeiwList(dataSportClots().items);
    VeiwList list2 = VeiwList(dataClots().items);
    VeiwList list3 = VeiwList(dataTravel().items);

    if (item.title == 'كتاب') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list1.build(context),
      );
    }
    if (item.title == 'لوازم التحرير') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list2.build(context),
      );
    }
    if (item.title == 'موسیقی') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list2.build(context),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: list3.build(context),
    );
  }
}
