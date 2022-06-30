import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyBasket.dart';
import 'package:my_pojects/Basket_Shoping/byNow.dart';
import 'Basket_Shoping/listBascket.dart';
import 'Things/Data.dart';

class BasketShoping extends StatefulWidget {
  BasketShoping({Key? key}) : super(key: key);

  @override
  State<BasketShoping> createState() => _BasketShopingState();
}

class _BasketShopingState extends State<BasketShoping> {
  ListBasket list1 = ListBasket(BasketList.getInstance()!.listBasket);
  List<MyData> listProduct = BasketList.getInstance()!.listBasket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basket Products',
          style: TextStyle(
              fontFamily: "Nas", fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: BasketList.getInstance()!.listBasket.isEmpty
          ? buildShowIsEmpty()
          : list1,
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  buildContinueBuy(),
                  buildTotalPrice(),
                  buildCount(listProduct.length.toString())
                ],
              )
            ],
          )),
    );
  }

  Widget buildShowIsEmpty() => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.network(
              "https://images.milledcdn.com/2021-10-20/3_2RlBZMiqaXHNjQ/9Ms9IRESGQuO.gif",
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Basket  is  Empty :(",
            style: TextStyle(
                fontSize: 45, fontFamily: "Nas", fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget buildContinueBuy() {
    return TextButton(
      onPressed: () {
        if(listProduct.length>0) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BuyNow()),
          );
        }
        return null;
      },
      child: Container(
        child: Center(
          child: Text(
            "   CONTINUE BUY",
            style: TextStyle(
              fontFamily: "Kurale",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.35,
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  Widget buildCount(String count) {
    return Positioned(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 18,
        child: Text(
          count,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      top: -10,
      left: -100,
    );
  }

  Widget buildTotalPrice() {
    int sum = 0;
    setState(() {
      listProduct.forEach((element) {
        List<String> result = element.price.split("\$");
        sum += int.parse(result[0]);
      });
    });
    return Positioned(
      top: -2,
      left: -290,
      child: Container(
        child: Center(
          child: Text(
            'Total Price: ${sum}\$',
            style: TextStyle(fontSize: 16, fontFamily: "Kurale"),
            //
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
