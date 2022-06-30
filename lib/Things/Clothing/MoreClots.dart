import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Clothing/ForChildern.dart';
import 'package:my_pojects/Things/Clothing/ForWoman.dart';
import '../ViewList.dart';
import 'ForMan.dart';

class MyClots extends StatefulWidget {
  final item;

  const MyClots({required this.item, Key? key}) : super(key: key);

  @override
  State<MyClots> createState() => _MyClotsState(item);
}

class _MyClotsState extends State<MyClots> {
  final item;

  _MyClotsState(this.item);

  @override
  Widget build(BuildContext context) {
    VeiwList result;
    bool list1 = item.title == 'زنانه';
    bool list2 = item.title == 'مردانه';
    if (list1) {
      result = VeiwList(DataForWoman().items);
    } else if (list2) {
      result = VeiwList(DataForMan().items);
    } else
      result = VeiwList(DataChildren().items);

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
