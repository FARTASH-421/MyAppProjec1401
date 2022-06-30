import 'package:flutter/material.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForBooks.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForMusic.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForProdectHand.dart';
import 'package:my_pojects/Things/BooksAndThings/DataForThings.dart';
import '../ViewList.dart';

class MyBooks extends StatefulWidget {
  final item;

  const MyBooks({this.item, Key? key}) : super(key: key);

  @override
  State<MyBooks> createState() => _MyBooksState(item);
}

class _MyBooksState extends State<MyBooks> {
  final item;

  _MyBooksState(this.item);

  @override
  Widget build(BuildContext context) {
    VeiwList result;
    bool list1 = item.title == 'كتاب';
    bool list2 = item.title == 'لوازم التحرير';
    bool list3 = item.title == 'موسيقي';

    if (list1) {
      result = VeiwList(DataForBook().items);
    } else if (list2) {
      result = VeiwList(DataForThings().items);
    } else if (list3) {
      result = VeiwList(DataForMusic().items);
    } else
      result = VeiwList(DataForProdectHand().items);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune,
                  ),
                ),
                Text(
                  "Filters",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                  ),
                ),
                Text(
                  "Sort",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
      body: result,
    );
  }
}
