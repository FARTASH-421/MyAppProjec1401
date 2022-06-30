import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Data.dart';
import '../../Home/headrWithSearchBox.dart';
import '../../Things/ShowDetails/ShowDetails.dart';
import '../MyBasket.dart';

typedef OnRemovePressed(int index);

class MyBecketProduct extends StatefulWidget {
    MyData mylist;
    OnRemovePressed _onRemovePressed;
    int _index;
   MyBecketProduct(this.mylist,this._onRemovePressed,this._index, {Key? key}) : super(key: key);

  @override
  State<MyBecketProduct> createState() => _MyBecketProductState();
}

class _MyBecketProductState extends State<MyBecketProduct> {


  Random random = Random();
  int _count = 1;
  var randomNumber;

  Widget buildPositoned() {
    randomNumber = random.nextInt(80);

    return Positioned(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 18,
        child: Text(
          randomNumber.toString() + "%",
          style: TextStyle(fontSize: 16),
        ),
      ),
      top: 0,
      left: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    MyData myList= widget.mylist;
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width - 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                  child: Text(
                    myList.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06AFEF),
                    ),
                    // style: Theme.of(context).textTheme.button
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [Icon(Icons.circle), buildPositoned()],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Increment();
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                        Text(_count.toString()),
                        IconButton(
                          onPressed: () {
                            decrement();
                          },
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding / 3),
                      decoration: BoxDecoration(
                          color: Colors.teal[100],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22))),
                      child: Text(
                        myList.price,
                        style: const TextStyle(
                            fontFamily: "Kurale",
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding - 4,
                          // vertical: kDefaultPadding
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// remove products
                            IconButton(
                                onPressed: () {
                                  widget._onRemovePressed(widget._index);
                                },
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                  size: 35,
                                )),
                          ],
                        )),
                  ],
                )
              ],
            ),
          )),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Card(
              color: Colors.white70,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(30)),
              ),
              child: Ink.image(
                image: NetworkImage(myList.urlImage),
                height: 150,
                width: 150,
                fit: BoxFit.fill,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoePage(
                        item:myList,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      elevation: 5,
      color: Colors.white38,
    );
  }

  void Increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
      if(_count==0){
        setState(() {
          widget._onRemovePressed(widget._index);
        });
      }
    });
  }
}
