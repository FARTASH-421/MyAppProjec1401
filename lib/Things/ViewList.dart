import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Home/headrWithSearchBox.dart';
import 'ShowDetails/ShowDetails.dart';

class VeiwList extends StatefulWidget {
  final List Myitem;

  const VeiwList(this.Myitem, {Key? key}) : super(key: key);

  @override
  State<VeiwList> createState() => _VeiwListState(Myitem);
}

class _VeiwListState extends State<VeiwList> {
  List Myitems;

  _VeiwListState(this.Myitems);

  Widget build(BuildContext context) => ListView.builder(
      itemCount: Myitems.length,
      itemBuilder: (context, index) {
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: SizedBox(
                height: 136,
                width: MediaQuery.of(context).size.width - 177,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
                      child:  Text(
                        Myitems[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF06AFEF),
                        ),
                          // style: Theme.of(context).textTheme.button
                      ),
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
                          child:  Text(
                            Myitems[index].price,
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
                              horizontal: kDefaultPadding-4,
                              vertical: kDefaultPadding ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.yellowAccent,),
                                  Icon(Icons.star,color: Colors.yellowAccent,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.star,color: Colors.yellowAccent,),
                                  Icon(Icons.star_half,color: Colors.yellowAccent,),
                                  Icon(Icons.star_outline_sharp,color: Colors.black45),
                                ],
                              )
                            ],
                          )
                        )
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
                    image: NetworkImage(Myitems[index].urlImage),
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoePage(
                            item: Myitems[index],
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
      });
}
