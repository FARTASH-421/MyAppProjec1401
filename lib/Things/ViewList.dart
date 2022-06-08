import 'package:flutter/material.dart';
import 'ShowDetails/ShowDetails.dart';
class VeiwList extends StatefulWidget {
    final  List Myitem;
  const VeiwList(
      this.Myitem,
      {Key? key}) : super(key: key);

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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          Myitems[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAF3636),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          Myitems[index].price,
                          style: const TextStyle(
                              fontFamily: "Kurale",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 2),
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
            ],
          ),
          elevation: 5,
          color: Colors.white38,
        );
      });
}

