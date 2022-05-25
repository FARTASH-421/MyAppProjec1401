import 'package:flutter/material.dart';
class Shoping extends StatefulWidget {
  const Shoping({Key? key}) : super(key: key);

  @override
  State<Shoping> createState() => _ShopingState();
}

class _ShopingState extends State<Shoping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text('سبد خرید',
                    style: TextStyle(
                        fontFamily: "Nas",
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text('لیست خرید بعدی',
                    style: TextStyle(
                        fontFamily: "Nas",
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                ],
              ),

            ],
          )

         ],
    ),

    body: Text("Shping",
      style: TextStyle(
        fontSize: 50,
    ),
    ),
    );
  }
}
