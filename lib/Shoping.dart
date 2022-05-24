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

          TextButton(
            onPressed: () {  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('سبد خرید',
                      style: TextStyle(
                        fontFamily: "Nas",
                        fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                Text('لیست خرید بعدی',
                      style: TextStyle(
                        fontFamily: "Nas",
                        fontSize: 24,
                        color: Colors.black
                      ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white60,
      ),
      body: Text("Shping",
      style: TextStyle(
        fontSize: 50,
      ),
      ),
    );
  }
}
