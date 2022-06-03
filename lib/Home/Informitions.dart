import 'package:flutter/material.dart';

// Padding(
//   padding: const EdgeInsets.all(10),
//   child: GridView.count(
//     crossAxisCount: 2,
//     crossAxisSpacing: 3,
//     children: List.generate(this.add, (int postion){
//       return generateItem();
//     }),
//   ),
//
// ),

Card generateItem() {
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(30))
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
              const Center(
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
                children: const [
                  Icon(Icons.edit,size: 20,),
                ],
              )

            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
    color: Colors.white24,
  );
}

