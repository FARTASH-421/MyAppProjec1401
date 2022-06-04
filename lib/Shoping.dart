import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyBasket.dart';
import 'package:my_pojects/Things/Data.dart';
import 'package:my_pojects/Things/ViewList.dart';

class BasketShoping extends StatefulWidget {
  BasketShoping({Key? key}) : super(key: key);

  @override
  State<BasketShoping> createState() => _BasketShopingState();
}

class _BasketShopingState extends State<BasketShoping> {
  @override
  Widget build(BuildContext context) {


    if (MyBasket.getInstance()!.listBasket.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'سبد خرید',
                      style: TextStyle(
                          fontFamily: "Nas", fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        body: const Center(
          child: Text(
            "سبد خرید تون خالی است",
            style: TextStyle(
                fontSize: 40,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontFamily: "Nas"),
          ),
        ),
      );
    } else {
      print(MyBasket.getInstance()!.listBasket.length);
      VeiwList list1 = VeiwList(MyBasket.getInstance()!.listBasket);
      return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'سبد خرید',
                      style: TextStyle(
                          fontFamily: "Nas", fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        body: list1.build(context),
      );
    }
  }
}

class Empty extends StatefulWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
