import 'package:flutter/material.dart';
import 'package:my_pojects/Basket_Shoping/MyFavorite.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List Myitems = MyFavorite.getInstance()!.listFavorite;

  @override
  Widget build(BuildContext context) {
    int add = Myitems.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite Products",
          style: TextStyle(
              fontFamily: "Nas",
            fontWeight: FontWeight.bold,
            fontSize: 24
          ), ),
      ),

      body:Myitems.isEmpty?
      buildShowIsEmpty() :
      Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          children: List.generate(add, (int position) {
            setState(() {
              add = Myitems.length;
            });
            return generateItem(Myitems, add);
          }),
        ),
      ),
    );
  }

  Card generateItem(items, int add) {
    List item = items;

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30))),
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
                  width: 150,
                  child: Image.network(item[add - 1].urlImage),
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
                    item[add - 1].title,
                    style: const TextStyle(
                        fontSize: 20, fontFamily: "Nas", color: Colors.purple),
                  ),
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.red,
                    ),
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
                    item[add - 1].price,
                    style: const TextStyle(
                        fontFamily: "Kurale",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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


  Widget buildShowIsEmpty() => Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.favorite_outline_outlined,color: Colors.red,size: 150,)
          ),
          SizedBox(height: 40,),
          Text("Favorite is Empty :(",style: TextStyle(
              fontSize: 45,
              fontFamily: "Nas",
              fontWeight: FontWeight.bold
          ),)
        ],
      )

  );

}
