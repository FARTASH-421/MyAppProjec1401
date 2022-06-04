import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_pojects/LongPage.dart';


class Spalsh extends StatefulWidget {
 const
 Spalsh ({Key? key}) : super(key: key);
  @override

  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:4 ),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LongPage(),
            ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFDDEA71),
              Color(0xFF2E7D32),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Image.asset(
               'images/newShop.gif',
               height:200,
               width: MediaQuery.of(context).size.width,
             ),
             Image.asset(
               'images/PngItem.png',
               height:200,
               width: MediaQuery.of(context).size.width,
             ),
           ],
         ),

            Column(
              children: const [
                Text("DigiGreen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: "Kurale",
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            const CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
