import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white60,
      title: Text('Chat',
        style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontFamily: "Kurale"
        ),
      ),
    ),
      body: Text("Chat"),
    );
  }
}
