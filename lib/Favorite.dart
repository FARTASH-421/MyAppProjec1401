import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite"),
      ),
      body: Text("Favorite",
        style: TextStyle(
          fontSize: 50
        ),
      ),
    );
  }
}
