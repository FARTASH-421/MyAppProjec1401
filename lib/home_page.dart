import 'package:flutter/material.dart';
import 'package:my_pojects/ShopButtonNavigator.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stores',
      color: Colors.blue,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sreach'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            )
          ],
          backgroundColor: Colors.orange,

        ),
        body: Center(

          child: Text('خوش آمدید',
            style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlue,
                fontFamily: "Nas"
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
          backgroundColor: Colors.red,
        child: Icon(Icons .add_shopping_cart,color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class MySearchDelegate  extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context){

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
        onPressed: () => close(context,null)
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

