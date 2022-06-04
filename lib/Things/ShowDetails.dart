import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Shoping.dart';

import '../Basket_Shoping/MyBasket.dart';
import '../Favorite.dart';

class ShoePage extends StatelessWidget {
  final item;

  const ShoePage({
    required this.item,
    Key? key,
  }) : super(key: key);

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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favorite()),
                  ),
                  icon: const Icon(
                    Icons.favorite_border_sharp,
                    size: 30,
                    color: Colors.redAccent,
                  )),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 2),
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
                    fontFamily: "Kurale"
                  ),
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
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)),
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
