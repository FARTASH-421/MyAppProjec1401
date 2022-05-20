import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DigiBlue'),
        ),
        body: Center(
          child: Text('Wellcome my app',
          style: TextStyle(
            color: Colors.lightBlue
          ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){},
       child: Icon(Icons.bookmark_added),
        ),
      ),
    );
  }
}
