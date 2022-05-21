import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_pojects/ShopButtonNavigator.dart';

class LongPage extends StatefulWidget {
  const LongPage({Key? key}) : super(key: key);
  @override
  State<LongPage> createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
   String? password;
    var numberPhone;
    bool isHidePassword= true;

 Widget _bulidLoge(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 70),
         child: Text("خوش آمدید",
         style: TextStyle(
           fontFamily: "Nas",
           fontSize: MediaQuery.of(context).size.height/25,
           fontWeight: FontWeight.bold,
           color: Colors.lightBlue,
         ),
         ),
       ),
     ],
   );
 }
 Widget _bulidOrRow(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
    children: const [
     Text('- OR -',
   style: TextStyle(
     fontWeight: FontWeight.w400,
   ),
   )
    ],
   );
 }
 Widget _bulidContianer(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       ClipRRect(
         borderRadius: const BorderRadius.all(Radius.circular(20.0),),
         child: Container(
           height: MediaQuery.of(context).size.height* 0.6,
           width: MediaQuery.of(context).size.width * 0.8,
           decoration: const BoxDecoration(
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
               _bulidPhoneNumberRow(),
               _bulidPasswordRow(),
               _bulidForgitPasswordRow(),
               _bulidLoginButton(),
               _bulidOrRow(),
               _bulidSocialBtnRow(),
             ],
           ),
         ),
       ),
     ],
   );
 }

 Widget  _bulidPhoneNumberRow(){
   return Padding(padding: const EdgeInsets.all(8),
     child: TextFormField(
       autofocus:true,
       keyboardType: TextInputType.emailAddress,
       onChanged: (value){
         setState(() {
           numberPhone = value;
         });
         print(numberPhone);
       },
       decoration: const InputDecoration(
         prefixIcon: Icon(Icons.phone, color: Colors.lightGreen,),
         hintText: 'PhoneNumber',
       ),
     ),
   );
 }
  Widget  _bulidPasswordRow(){
    return Padding(padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: isHidePassword,
        onChanged: (value){
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(

          prefixIcon: const Icon(Icons.lock, color: Colors.lightGreen,),
          hintText :'Password',
          suffixIcon:InkWell(
            onTap: _togglePassword,
            child:  changeIconsPassword(),
          ),

        ),
      ),

    );
 }
  Widget _bulidLoginButton(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Container(
         height: 1.4* (MediaQuery.of(context).size.height/20 ),
         width: 5* (MediaQuery.of(context).size.width/10 ),
         margin: const EdgeInsets.only(bottom: 20),
         child : RaisedButton (
           elevation: 5.0,
           color: Colors.lightGreen,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30.0),
           ),
           onPressed: () {
             Navigator.of(context).push(
               MaterialPageRoute(
                   builder: (context){
                     return ShopButtonNavigator();
                   }
               ),
             );
           },
           child: Text("Login",
           style: TextStyle(
             fontSize: MediaQuery.of(context).size.height/40
           ),),
         ),
       ),
     ],
   );
  }
  Widget _bulidSingUpBtn(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Padding(padding: const EdgeInsets.only(top: 40),
       child: FlatButton(onPressed: (){
         Navigator.of(context).push(
           MaterialPageRoute(
               builder: (context){
                 return ShopButtonNavigator();
               }
           ),
         );
         },
         child: RichText(
           text: TextSpan(
             children: [
               TextSpan(
                 text: "Don't have an account? ",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize:  MediaQuery.of(context).size.height/40,
                   fontWeight: FontWeight.w400,
                 ),
               ),
           TextSpan(
             text: "Sign Up",
             style: TextStyle(
               color: Colors.green,
               fontSize:  MediaQuery.of(context).size.height/40,
               fontWeight: FontWeight.bold,
                )
              )
             ],
           ),
         ),
       ),
       )
     ],
   );
  }
Widget _bulidSocialBtnRow(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       GestureDetector(
         onTap: () {
           Navigator.of(context).push(
             MaterialPageRoute(
                 builder: (context){
                   return ShopButtonNavigator();
                 }
             ),
           );
           setState(() { });
         },
         child: Container(
           height: 80,
           width: 60,
           decoration: const BoxDecoration(
             shape: BoxShape.circle,
             color: Colors.black,
             boxShadow: [
               BoxShadow(
                 color: Colors.black26,
                 offset: Offset(0,2),
                 blurRadius: 6.0,
               ),
             ],
           ),
           child: Icon(
           FontAwesomeIcons.google,
             color: Colors.white,
           ),
         ),
       )
     ],

   );
}
Widget _bulidForgitPasswordRow(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       FlatButton(onPressed: (){
         Navigator.of(context).push(
           MaterialPageRoute(
               builder: (context){
                 return ShopButtonNavigator();
               }
           ),
         );
       },
           child: const Text("Forget Password"),
       ),
     ],
   );
}
Widget changeIconsPassword(){
   if(isHidePassword == true){
   return Icon(
      Icons.visibility
   );
   }
   else return Icon(Icons.visibility_off);
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xfff2f3f7),
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    color:Colors.lightGreen ,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    )
                  ),
                ),
              ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bulidLoge(),
                _bulidContianer(),
                _bulidSingUpBtn(),
              ],
              )
            ],
          ),
    ));
  }

  void _togglePassword() {
   setState(() {
     isHidePassword = !isHidePassword;
   });
  }
}
