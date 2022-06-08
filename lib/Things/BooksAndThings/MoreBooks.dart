import 'package:flutter/material.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForBooks.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForMusic.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForProdectHand.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForThings.dart';

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
    // VeiwList list1 = VeiwList(DataForBook().items);
    // VeiwList list2 = VeiwList(DataForBook().items);
    // VeiwListStat list3 = VeiwList(DataForBook().items);
    // VeiwListState list4 = VeiwListState(DataForBook().items);


    if (item.title == 'كتاب') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body:VeiwList(DataForBook().items),
      );
    }
    if (item.title == 'لوازم التحرير') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body:VeiwList(DataForThings().items),
      );
    }
    if (item.title =='موسيقي') {
      return Scaffold(
        appBar: AppBar(

          title: Text(item.title),
        ),
        body: VeiwList(DataForMusic().items),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: VeiwList(DataForProdectHand().items),
    );
  }
}
