import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Basket_Shoping/MyBasket.dart';
import '../../Basket_Shoping/MyFavorite.dart';
import '../../Favorite.dart';
import '../Data.dart';

class ShoePage extends StatefulWidget {
  final item;

  const ShoePage({Key? key, this.item}) : super(key: key);

  @override
  State<ShoePage> createState() => _ShoePageState(item: item);
}

class _ShoePageState extends State<ShoePage> {
  int numOfItem = MyBasket.getInstance()!.listBasket.length;
  final item;
  bool checkAddOrRemove = true;

  _ShoePageState({required this.item});

  bool check = true;

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
                        MaterialPageRoute(
                            builder: (context) => const Favorite()),
                      ),
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    size: 30,
                    // color: addColor,
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
            Container(
                height: 83,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.white60,
                    ),
                    Spacer(),
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
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onPressed: () {},
                          ),
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
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white60,
                    ),
                  ],
                )),
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
                    child: check ?  IconButton(
                      onPressed: () {
                        setState(() {
                          check = !check;
                        });
                        MyFavorite.getInstance()!.listFavorite.add(item);
                      },
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ): IconButton(
                      onPressed: () {
                        setState(() {
                          check = !check;
                        });
                        MyFavorite.getInstance()!.listFavorite.remove(item);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color:Colors.red,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildRemoveNow(),
                    // checkAddOrRemove ? buildByNow() : buildRemoveNow(),
                    InkWell(
                      onTap: _toggleAddOrRemove,
                      child: changeAddOrRemove(),
                    ),
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


  Widget Added_toBasket(){
    setState(() {
      numOfItem = MyBasket.getInstance()!.listBasket.length;
    });
    return  Row(
      children: [
        buildOutlineButton(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (numOfItem > 0) {
                  MyBasket.getInstance()!
                      .listBasket
                      .remove(MyBasket.getInstance()!.listBasket.last);
                }
                numOfItem =
                    numOfItem = MyBasket.getInstance()!.listBasket.length;
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
                MyData add = MyBasket.getInstance()!.listBasket.last;
                MyBasket.getInstance()!.listBasket.add(add);
                numOfItem = MyBasket.getInstance()!.listBasket.length;
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

  Widget changeAddOrRemove() {
    if (checkAddOrRemove == true) {
      return buildByNow();
    } else {
      return buildRemoveNow();
    }
  }

  void _toggleAddOrRemove() {
    setState(() {
      checkAddOrRemove = !checkAddOrRemove;
    });
  }

  Widget buildByNow() {
    return TextButton(
      onPressed: () {

        MyBasket.getInstance()!.listBasket.add(item);
        setState(() {
          numOfItem = MyBasket.getInstance()!.listBasket.length;
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

  Widget buildRemoveNow() {
    return TextButton(
      onPressed: () {
        MyBasket.getInstance()!.listBasket.add(item);
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
}
