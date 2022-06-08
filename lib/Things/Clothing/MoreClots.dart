import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Clothing/ForChildern.dart';
import 'package:my_pojects/Things/Clothing/ForWoman.dart';

import '../Sports/ColtsSport.dart';
import '../Sports/ThaingSport.dart';
import '../Sports/ThingsTravel.dart';
import '../ViewList.dart';
import '../ShowDetails/ShowDetails.dart';
import 'ForMan.dart';

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
    // VeiwListState list1 =  VeiwListState(DataForWoman().items);
    // VeiwListState list2 = VeiwListState(DataForWoman().items);
    // VeiwListState list3 = VeiwListState(DataForWoman().items);

    if (item.title == 'زنانه') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body:  VeiwList(DataForWoman().items),
      );
    }
    if (item.title == 'مردانه') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body:  VeiwList(DataForMan().items),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body:  VeiwList(DataChildren().items),
    );
  }
}
