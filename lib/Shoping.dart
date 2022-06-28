import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyBasket.dart';
import 'package:my_pojects/Things/ViewList.dart';

class BasketShoping extends StatefulWidget {
  BasketShoping({Key? key}) : super(key: key);

  @override
  State<BasketShoping> createState() => _BasketShopingState();
}

class _BasketShopingState extends State<BasketShoping> {
  @override
  Widget build(BuildContext context) {
    VeiwList list1 = VeiwList(MyBasket.getInstance()!.listBasket);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basket Products',
          style:
              TextStyle(fontFamily: "Nas", fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
      body: MyBasket.getInstance()!.listBasket.isEmpty
          ? buildShowIsEmpty()
          : list1,
    );
  }

  Widget buildShowIsEmpty() => Center(
        child:Column(
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
                "https://images.milledcdn.com/2021-10-20/3_2RlBZMiqaXHNjQ/9Ms9IRESGQuO.gif"
                , alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 40,),
            Text("Basket  is  Empty :(",style: TextStyle(
              fontSize: 45,
              fontFamily: "Nas",
              fontWeight: FontWeight.bold
            ),)
          ],
        )

      );
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
