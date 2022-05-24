import 'package:flutter/material.dart';
import 'SiveInfo.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int add =4 ;

  @override
  Widget build(BuildContext context) {
    Info inform= Info();
    print(inform.numberPhone);
    print(inform.userName);
    return Scaffold(
        appBar: AppBar(
          title: Text('Sreach'),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: (){
          //       showSearch(
          //         context: context,
          //         delegate: MySearchDelegate(),
          //       );
          //     },
          //   )
          // ],
          // backgroundColor: Colors.orange,

        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            children: List.generate(this.add, (int postion){
              return generateItem();
            }),
          ),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            this.add++;
          });
        },
        child:Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );

  }
}

Card generateItem() {

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30))
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 200,
                  child:  Image.asset("images/ksenia.jpg"),
                )
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "خرید کالا",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Nas",
                      color: Colors.lightBlueAccent
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.edit,size: 20,),
                  ],
                )

              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Center(
                 child: Text(
                   "Good Shoping",
                   style: TextStyle(
                     fontFamily: "Kurale",
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                   ),
                 ),
               ),
              ],
            ),
          ),
        ],
      ),
    elevation: 4,
    color: Colors.white54,
  );
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

