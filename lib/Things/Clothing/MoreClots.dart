import 'package:flutter/material.dart';

import '../Sports/ColtsSport.dart';
import '../Sports/ThaingSport.dart';
import '../Sports/ThingsTravel.dart';
import '../ViewList.dart';
import '../pageKala.dart';

class MyClots extends StatefulWidget {
  final item;

  const MyClots({
    required this.item
    , Key? key}) : super(key: key);

  @override
  State<MyClots> createState() => _MyClotsState(item);
}

class _MyClotsState extends State<MyClots> {
  final item;

  _MyClotsState(this.item);


  @override
  Widget build(BuildContext context) {
    VeiwList list1 = VeiwList(dataSportClots().items);
    VeiwList list2 = VeiwList(dataClots().items);
    VeiwList list3 = VeiwList(dataTravel().items);

    if (item.title == 'زنانه') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list1.build(context),
      );
    }
    if (item.title == 'مردانه') {
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
