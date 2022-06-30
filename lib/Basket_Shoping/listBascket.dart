import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyBasket.dart';
import 'ShowDetails/myProducte.dart';

class ListBasket extends StatefulWidget {
  final List Myitem;

  const ListBasket(this.Myitem, {Key? key}) : super(key: key);

  @override
  State<ListBasket> createState() => _ListBasketState(Myitem);
}

class _ListBasketState extends State<ListBasket> {
  List Myitems;

  _ListBasketState(this.Myitems);

  Widget build(BuildContext context) => ListView.builder(
      itemCount: Myitems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(4),
          child: MyBecketProduct(BasketList.getInstance()!.listBasket[index] , rimoveItem ,index )
        );
      });

  void rimoveItem(int index){
    setState(() {
      BasketList.getInstance()!.listBasket.removeAt(index);
    });
  }
}
