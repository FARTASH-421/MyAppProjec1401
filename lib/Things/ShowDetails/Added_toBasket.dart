import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyBasket.dart';
import 'package:my_pojects/Things/Data.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItem = MyBasket.getInstance()!.listBasket.length;

  @override
  Widget build(BuildContext context) {

    setState(() {
      this.numOfItem = MyBasket.getInstance()!.listBasket.length;
    });
    return Row(
      children: [
        buildOutlineButton(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (numOfItem > 0) {
                  MyBasket.getInstance()!
                      .listBasket
                      .remove(MyBasket.getInstance()!.listBasket.last);
                }
                numOfItem =
                    numOfItem = MyBasket.getInstance()!.listBasket.length;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(numOfItem.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                MyData add = MyBasket.getInstance()!.listBasket.last;
                MyBasket.getInstance()!.listBasket.add(add);
                numOfItem = MyBasket.getInstance()!.listBasket.length;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          onPressed: press,
          child: Icon(icon)),
    );
  }
}
