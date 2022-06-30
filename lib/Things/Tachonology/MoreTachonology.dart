import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Things/Tachonology/DataCamera.dart';
import 'package:my_pojects/Things/Tachonology/DataComputer.dart';
import 'package:my_pojects/Things/Tachonology/DataMobile.dart';
import 'package:my_pojects/Things/ShowDetails/ShowDetails.dart';

import '../Sports/ColtsSport.dart';
import '../Sports/ThaingSport.dart';
import '../Sports/ThingsTravel.dart';
import '../ViewList.dart';


class MyTachoNa extends StatefulWidget {
  final item;
  const MyTachoNa({  required this.item,
        Key? key
  }) : super(key: key);

  @override
  State<MyTachoNa> createState() => _MyTachoNaState(item);
}

class _MyTachoNaState extends State<MyTachoNa> {
  final item;
  _MyTachoNaState(this.item);


  @override
  Widget build(BuildContext context) {
    // VeiwList list = VeiwList(DataMobile().items);
    // VeiwList list2= VeiwList(DataComputer().items);
    // VeiwList list3 = VeiwList(DataCamera().items);
    //
    // String title="";
    VeiwList result;
    bool checkList= item.title == 'موبايل';
    bool checkList2 = item.title=='لپ تاپ';
    if(checkList){
      result= VeiwList(DataMobile().items);
    }else if( checkList2){
      result =  VeiwList(DataComputer().items);
    }else
      result = VeiwList(DataCamera().items);


      return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
          actions: [
            Padding(padding: EdgeInsets.only(right: 10),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [

                IconButton(onPressed: (){},
                  icon:Icon(Icons.tune,),
                ),
                Text("Filters",style: TextStyle(fontWeight: FontWeight.w400),),
                IconButton(onPressed: (){},
                  icon:Icon(Icons.sort,),
                ),
                Text("Sort",style: TextStyle(fontWeight: FontWeight.w400),),
              ],
            ),
            )
          ],
        ),
        body: result
      );

  }
}
