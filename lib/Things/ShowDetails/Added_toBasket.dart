import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         SizedBox(
           width: 40,
           height: 32,
           child: OutlineButton(
             padding: EdgeInsets.zero,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(13)
             ),
             onPressed: () {  },
             child: Icon(
               Icons.remove
             )
           ),
         )
       ],
    );
  }
}
