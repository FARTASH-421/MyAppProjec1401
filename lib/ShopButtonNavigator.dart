import 'package:flutter/material.dart';

class ShopButtonNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50,
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container (
              width: MediaQuery.of(context).size.width/2-30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children :[
                   Icon(Icons.person_outline,size: 30,color: Colors.white,
                   ),
                   Icon(Icons.message_outlined,size: 30, color: Colors.white,
                   ),
                ],
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width/2-30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Icon(Icons.border_all,size: 30,color: Colors.white,),
                
                  Icon(Icons.home,size: 30, color: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
