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
    VeiwList result;
    bool list1 = item.title == 'پوشاک ورزشی';
    bool list2 = item.title == 'لوازم ورزشي';
    if (list1) {
      result = VeiwList(dataClots().items);
    } else if (list2) {
      result = VeiwList(dataSportClots().items);
    } else
      result = VeiwList(dataTravel().items);

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
