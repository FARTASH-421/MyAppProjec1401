import 'package:flutter/material.dart';


class LongPage extends StatefulWidget {
  const LongPage({Key? key}) : super(key: key);
  @override
  State<LongPage> createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
  late String email,password;
 Widget _bulidLoge(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Text("Logan",
       style: TextStyle(
         fontSize: MediaQuery.of(context).size.height/25,
         fontWeight: FontWeight.bold,
         color: Colors.white,
       ),
       ),

     ],
   );
 }
 Widget _bulidContianer(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       ClipRRect(
         borderRadius: BorderRadius.all(Radius.circular(20.0),),
         child: Container(
           height: MediaQuery.of(context).size.height* 0.6,
           width: MediaQuery.of(context).size.width * 0.8,
           decoration: BoxDecoration(
             color: Colors.white
           ),
           child:  Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Login',
                     style: TextStyle(
                       fontSize: MediaQuery.of(context).size.height/30
                     ),
                   ),
                 ],
               ),
               _bulidEmailRow(),
               _bulidPasswordRow(),
             ],
           ),
         ),
       ),

     ],
   );
 }

 Widget  _bulidEmailRow(){
   return Padding(padding: EdgeInsets.all(8),
     child: TextFormField(
       keyboardType: TextInputType.emailAddress,
       onChanged: (value){
         setState(() {
           this.email = value;
         });
       },
       decoration: InputDecoration(
         prefixIcon: Icon(Icons.email, color: Colors.lightGreen,),
         label: Text('E-mail'),
       ),
     ),

   );
 }
  Widget  _bulidPasswordRow(){
    return Padding(padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            this.email = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.lightGreen,),
          label: Text('Password'),
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff2f3f7),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.lightGreen ,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(70),
                      bottomRight: const Radius.circular(70),
                    )
                  ),
                ),
              ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bulidLoge(),
                _bulidContianer(),
              ],
              )
            ],
          ),

    ));
  }
}
