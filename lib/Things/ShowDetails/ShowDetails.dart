import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_pojects/Profile/icon_widget.dart';
import 'package:my_pojects/Shoping.dart';
import 'package:my_pojects/Things/ShowDetails/Added_toBasket.dart';

import '../../Basket_Shoping/MyBasket.dart';
import '../../Basket_Shoping/MyFavorite.dart';
import '../../Favorite.dart';

class ShoePage extends StatefulWidget {
  final item;

  const ShoePage({Key? key, this.item}) : super(key: key);

  @override
  State<ShoePage> createState() => _ShoePageState(item: item);
}

class _ShoePageState extends State<ShoePage> {

  final item;

  _ShoePageState({ required this.item });

  Color addColor = Colors.redAccent;
  Color removeColor = Colors.blueAccent;
  bool check = false;

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
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Favorite()),
                    ),
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    size: 30,
                    color: addColor,
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
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: const [

                    IconWidget(
                      icon: Icons.check,
                      color: Colors.blueAccent
                    ),
                  SizedBox(width: 8,),
                  IconWidget(
                      icon: Icons.check,
                      color: Colors.orange
                  ),
                  SizedBox(width: 8,),
                  IconWidget(
                      icon: Icons.check,
                      color: Colors.green
                  ),
                  SizedBox(width: 8,),
                  IconWidget(
                      icon: Icons.check,
                      color: Colors.black
                  ),
                  SizedBox(width: 8,),
                  IconWidget(
                      icon: Icons.check,
                      color: Colors.yellowAccent
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
            Padding(
              padding: const EdgeInsets.all(
                15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CartCounter(),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 36,
                    width: 38,
                    decoration: BoxDecoration(
                      color: check ?  removeColor: addColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          check !=check;
                        });
                        MyFavorite.getInstance()!.listFavorite.add(item);

                      },
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Container(
                        height: 60,
                        width: 58,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen),
                        ),
                        child:   IconButton(
                            onPressed: () =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BasketShoping()),
                                ),
                          icon: const Icon(Icons.add_shopping_cart),
                          iconSize: 40,
                        ),
                      ),
                        TextButton(
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.8,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50)),
                              )),
                        )
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                )),
          ],
        ),
      ),
    );
  }
}
