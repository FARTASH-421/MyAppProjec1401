import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_pojects/LongPage.dart';

import 'SaveData/Data.dart';
import 'SaveData/SiveInfo.dart';


class Spalsh extends StatefulWidget {
 const
 Spalsh ({Key? key}) : super(key: key);
  @override

  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  List<Widget> message = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    get();
    Timer(const Duration(seconds:4 ),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
             return const LongPage();
            }
            ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFDDEA71),
              Color(0xFF2E7D32),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         Column(

           children: [
             Image.asset(
               'images/PngItem.png',
               height:200,
               width: MediaQuery.of(context).size.width,
             ),
           ],
         ),

            Column(
              children: const [
                Text("DigiGreen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: "Kurale",
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            const CircularProgressIndicator(
              color: Colors.black,

            ),
          ],
        ),
      ),
    );
  }


  get() async{
    String request = "getSave\ncount:10000\u0000";
    await Socket.connect("10.0.2.2", 8000).then((severSocket){
      severSocket.write(request);
      severSocket.flush();
      severSocket.listen((response) {
        setState(() {
          addMessage(String.fromCharCodes(response));

        });
      });
    });
  }

  addMessage(String str){
    List<Information>? listData = MyDataInf.getInstance()?.listInfo;
    String userName="",number="",password="",email="",nameSalary="";

    List <Map<String,String>> list = stringToMap(str);
    list.forEach((element) {
      number= element["number"].toString();
      var str=  element["user"].toString();
      List<String> result = str.split('|');

      userName= result[0];
      email = result[1];
      password =result[2];
      nameSalary = result[3];

      Information savedata = Information(userName, number, password, nameSalary, email);

      if (!(listData!.contains(savedata))) {
        listData.add(savedata);
      }

      print('name: ${userName} and Phone number: ${number} email: ${email} password: ${password}and: ${nameSalary}');

    });
    print('=================================');
  }
  List<Map<String,String>> stringToMap(String str){
    List<Map<String,String>> list= List.empty(growable: true);
    final lines= str.trim().split("\n");

    lines.forEach((element) {

      final expr = element.split(",,");
      Map<String,String> map = {};

      expr.forEach((ele) {

        int index = ele.indexOf(":");
        String key= ele.substring(0,index);
        String value = ele.substring(index+1);
        map[key]= value;

      });

      list.add(map);
    });
    return list;
  }




}
