import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_pojects/Shoping.dart';

import '../../Basket_Shoping/MyBasket.dart';
import '../../Basket_Shoping/MyFavorite.dart';
import '../../Favorite.dart';

class ShoePage extends StatelessWidget {
  final item;

  ShoePage({
    required this.item,
    Key? key,
  }) : super(key: key);
   Color favoriteColor = Colors.redAccent;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasketShoping()),
                ),
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                  onPressed: () {
                    MyFavorite.getInstance()!.listFavorite.add(item);
                    favoriteColor= Colors.redAccent;

                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: favoriteColor,
                  )),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 2),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Title: ' +
                      item.title +
                      '\nPrice: ' +
                      item.price +
                      '\nNameSeller: ${item.nameSeller}' +
                      '\nColors:${item.colors}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Kurale"),
                ),
              ],
            ),
            Expanded(
              child: Align(
                child: Padding(
                    padding: const EdgeInsets.only(),
                    child: TextButton(
                      onPressed: () {
                        MyBasket.getInstance()!.listBasket.add(item);
                      },
                      child: Container(
                          child: const Center(
                            child: Text(
                              "Add to Basket",
                              style: TextStyle(
                                fontFamily: "Kurale",
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: favoriteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          )),
                    )),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
