import 'package:flutter/material.dart';
import 'UploadPage.dart';
import 'body.dart';
import 'headrWithSearchBox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadPage(context: context,),

            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white,
          size: 30,),
        backgroundColor: kPrimaryColor
      ),
    );
  }

  AppBar buildAppBar() =>
      AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 35,),
          onPressed: () {},
        ),
      );
}