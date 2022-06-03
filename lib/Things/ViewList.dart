import 'package:flutter/material.dart';
import 'pageKala.dart';

class VeiwList {
  List Myitems;
  VeiwList(this.Myitems);

  Widget build(BuildContext context) => ListView.builder(
      // scrollDirection: Axis.vertical,
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
                              color: Colors.lightBlueAccent),
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
              Ink.image(
                image: NetworkImage(Myitems[index].urlImage),
                height: 150,
                width: 150,
                fit: BoxFit.fill,
                alignment: Alignment.centerRight,
                child:InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ShoePage(
                        item:Myitems[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          elevation: 1,
         color: Colors.white70,
        );
      });
}
