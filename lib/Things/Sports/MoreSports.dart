import 'package:flutter/material.dart';

import 'ColtsSport.dart';
import '../ViewList.dart';
import 'ThaingSport.dart';
import 'ThingsTravel.dart';

class MoreSports extends StatefulWidget {
  final item;

  const MoreSports({required this.item, Key? key}) : super(key: key);

  @override
  State<MoreSports> createState() => _MoreSportsState(item);
}

class _MoreSportsState extends State<MoreSports> {
  final item;

  _MoreSportsState(this.item);

  @override
  Widget build(BuildContext context) {
    VeiwList list1 = VeiwList(dataClots().items);
     VeiwList list2= VeiwList(dataSportClots().items);
     VeiwList list3 = VeiwList(dataTravel().items);

    if(item.title=='پوشاک ورزشی') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: list1.build(context),
      );
    }
    if(item.title == 'لوازم ورزشي') {
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
