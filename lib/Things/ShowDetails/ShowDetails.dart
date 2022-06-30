import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Basket_Shoping/MyBasket.dart';
import '../../Basket_Shoping/MyFavorite.dart';
import '../../Favorite.dart';
import '../../Shoping.dart';
import '../Data.dart';

class ShoePage extends StatefulWidget {
  final item;

  const ShoePage({Key? key, this.item}) : super(key: key);

  @override
  State<ShoePage> createState() => _ShoePageState(item: item);
}

class _ShoePageState extends State<ShoePage> {
  int numOfItem = BasketList.getInstance()!.listBasket.length;
  int numFavorite = MyFavorite.getInstance()!.listFavorite.length;
  var star ="3";
  final item;

  _ShoePageState({required this.item});

  bool checkBuy = true;
  bool check = true;
  bool chooseIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  IconButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Favorite()),
                          ),
                      icon: Icon(
                        Icons.favorite_outline_outlined,
                        size: 30,
                        // color: addColor,
                      )),
                  buildCount(numFavorite.toString()),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BasketShoping()),
                          ),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        // color: addColor,
                      )),
                  buildCount(numOfItem.toString()),
                ],
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 2),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.white60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Title: ' + item.title,
                            style: TextStyle(
                                fontFamily: "Kurale",
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      child:  Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Icon(Icons.more_vert),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "دیدگاه کاربران(12) ",
                                style: TextStyle(),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "پرسش و پاسخ(5) ",
                                style: TextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.only(left: 8,right: 8),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          RatingBar.builder(
                            initialRating:3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                star = rating.toString();
                              });
                              print(rating);
                            },
                          ),
                          Text("("+star.toString()+")")
                        ],
                      ),
                    ),

                    Container(
                      height: 1.5,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white60,
                    ),
                  ],
                )),

            Container(
              child:Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Color: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: chooseIcon
                            ? Icon(Icons.circle,
                            color: Colors.blueAccent, size: 30)
                            : Icon(
                          Icons.check_circle,
                          color: Colors.blueAccent,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: chooseIcon
                            ? Icon(Icons.circle, color: Colors.black, size: 30)
                            : Icon(
                          Icons.check_circle,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            chooseIcon = !chooseIcon;
                          });
                        },
                        icon: chooseIcon
                            ? Icon(Icons.circle, color: Colors.red, size: 30)
                            : Icon(
                          Icons.check_circle,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            chooseIcon = !chooseIcon;
                          });
                        },
                        icon: chooseIcon
                            ? Icon(Icons.circle, color: Colors.green, size: 30)
                            : Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    '\nNameSeller: ${item.nameSeller}' +
                        '\nColors:${item.colors}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Kurale"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Added_toBasket(),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 36,
                    width: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: check
                        ? IconButton(
                            onPressed: () {
                              MyFavorite.getInstance()!.listFavorite.add(item);
                              setState(() {
                                check = !check;
                                numFavorite = MyFavorite.getInstance()!
                                    .listFavorite
                                    .length;
                              });
                            },
                            icon: const Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.white,
                              size: 35,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              MyFavorite.getInstance()!
                                  .listFavorite
                                  .remove(item);
                              setState(() {
                                check = !check;
                                numFavorite = MyFavorite.getInstance()!
                                    .listFavorite
                                    .length;
                              });
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Align(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: checkBuy
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [buildPrice(), buildByNow()],
                      )
                    : Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.bottomCenter,
                        children: [
                          buildCancelByNow(),
                          buildCancelIcon(),
                        ],
                      ),
              ),
              alignment: Alignment.bottomCenter,
            )),
          ],
        ),
      ),
    );
  }

  Widget buildCount(String count) {
    return Positioned(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 9,
        child: Text(
          count,
          style: TextStyle(fontSize: 14),
        ),
      ),
      top: 0,
      left: 22,
    );
  }

  Widget Added_toBasket() {
    setState(() {
      numOfItem = BasketList.getInstance()!.listBasket.length;
    });
    return Row(
      children: [
        buildOutlineButton(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (numOfItem > 0) {
                  BasketList.getInstance()!
                      .listBasket
                      .remove(BasketList.getInstance()!.listBasket.last);
                }
                numOfItem =
                    numOfItem = BasketList.getInstance()!.listBasket.length;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(numOfItem.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                MyData add = BasketList.getInstance()!.listBasket.last;
                BasketList.getInstance()!.listBasket.add(add);
                numOfItem = BasketList.getInstance()!.listBasket.length;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          onPressed: press,
          child: Icon(icon)),
    );
  }

  Widget buildByNow() {
    return TextButton(
      onPressed: () {
        BasketList.getInstance()!.listBasket.add(item);
        setState(() {
          checkBuy = !checkBuy;
          numOfItem = BasketList.getInstance()!.listBasket.length;
        });
      },
      child: Container(
          child: const Center(
            child: Text(
              "BUY NOW",
              style: TextStyle(
                fontFamily: "Kurale",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.57,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          )),
    );
  }

  Widget buildPrice() {
    return TextButton(
      onPressed: () {
        BasketList.getInstance()!.listBasket.add(item);
      },
      child: Container(
          child: Center(
            child: Text(
              'Price: ' + item.price,
              style: TextStyle(
                fontFamily: "Kurale",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }

  Widget buildCancelIcon() {
    return Positioned(
      child: IconButton(
        onPressed: () {
          BasketList.getInstance()!.listBasket.remove(item);
          setState(() {
            checkBuy = !checkBuy;
            numOfItem = BasketList.getInstance()!.listBasket.length;
          });
        },
        icon: Icon(
          Icons.cancel_sharp,
          color: Colors.white,
          size: 40,
        ),
      ),
      top: -24,
      left: -8,
    );
  }

  Widget buildCancelByNow() {
    return TextButton(
      onPressed: () {
        BasketList.getInstance()!.listBasket.remove(item);
        setState(() {
          checkBuy = !checkBuy;
          numOfItem = BasketList.getInstance()!.listBasket.length;
        });
      },
      child: Container(
          child: const Center(
            child: Text(
              "CANCEL BUY",
              style: TextStyle(
                fontFamily: "Kurale",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.57,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          )),
    );
  }
}
