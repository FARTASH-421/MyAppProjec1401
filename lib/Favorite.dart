import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontFamily: "Kurale"
          ),
        ),
      ),
      body: Text("Favorite",
        style: TextStyle(
          fontSize: 50
        ),
      ),
    );
  }
}
