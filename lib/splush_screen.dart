import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'home_page.dart';


class Spalsh extends StatefulWidget {
  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Home()
            ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFA9900F),
              Color(0xFFFa1010)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('images/PngItem.png',
                  width: 360,
                  height: 360,),
                Text("DigiRed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontFamily: "Kurale",
                    fontSize: 45,

                  ),
                ),
              ],
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
