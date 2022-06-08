import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Tachonology/DataCamera.dart';
import 'package:my_pojects/Things/Tachonology/DataComputer.dart';
import 'package:my_pojects/Things/Tachonology/DataMobile.dart';
import 'package:my_pojects/Things/ShowDetails/ShowDetails.dart';

import '../Sports/ColtsSport.dart';
import '../Sports/ThaingSport.dart';
import '../Sports/ThingsTravel.dart';
import '../ViewList.dart';


class MyTachoNa extends StatefulWidget {
  final item;
  const MyTachoNa({  required this.item,
        Key? key
  }) : super(key: key);

  @override
  State<MyTachoNa> createState() => _MyTachoNaState(item);
}

class _MyTachoNaState extends State<MyTachoNa> {
  final item;
  _MyTachoNaState(this.item);


  @override
  Widget build(BuildContext context) {
    VeiwList list = VeiwList(DataMobile().items);
    VeiwList list2= VeiwList(DataComputer().items);
    VeiwList list3 = VeiwList(DataCamera().items);

    if(item.title == 'موبايل') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list,
      );
    }
    if(item.title=='لپ تاپ') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list2,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: list3,
    );
  }
}
