import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/Profile/setting_page.dart';
import 'package:my_pojects/SiveInfo.dart';

import 'ShopButtonNavigator.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}
class _SingUpPageState extends State<SingUpPage>{
  SettingPage set = SettingPage();
  var userName;
  var numberPhone;
  var password;
  var UserAcount;
  var email;


  Widget _bulidLoge(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("WellCome",
            style: TextStyle(
              fontFamily: "Kurale",
              fontSize: MediaQuery.of(context).size.height/25,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
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
          borderRadius: const BorderRadius.all(Radius.circular(30.0),),
          child: Container(
            height: MediaQuery.of(context).size.height* 0.7,
            width: MediaQuery.of(context).size.width *0.9,
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
                    Text('SignUp',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height/30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Kurale"
                      ),
                    ),
                  ],
                ),
                _bulidUserName(),
                _bulidPhoneNumber(),
                _bulidPassword(),
                _bulidUserAcount(),
                _bulidEmail(),
                _bulidAdd(),
              ],

            ),

          ),
        ),
      ],
    );
  }

  Widget  _bulidUserName(){
    print(userName);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        onChanged: (value){

          setState(() {
            this.userName = value;
          });
         set.userName = userName;
        },
        decoration: const InputDecoration(
          labelText:"*نام و نام خانوادگی",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText :'نام و نام خانوادگی',
        ),
      ),
    );
  }
  Widget  _bulidPhoneNumber(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            this.numberPhone= value;
          });
          set.numberPhone= numberPhone;
        },
        decoration: const InputDecoration(
          labelText:"*شماره تماس",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText :'شماره تماس',
        ),
      ),
    );
  }
  Widget  _bulidPassword(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            password = value;
          });
          set.email = email;
        },
        decoration: const InputDecoration(
          labelText:"*رمز عبور",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText :'رمزعبور',
        ),
      ),
    );
  }
  Widget  _bulidEmail(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            this.email= value;
          });
          set.email = email;
        },
        decoration: const InputDecoration(
          labelText:"ایمیل",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText :'ایمیل',
        ),
      ),
    );
  }
  Widget  _bulidUserAcount(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            UserAcount = value;
          });
          set.UserAcount = UserAcount;
        },
        decoration: const InputDecoration(
          labelText:"نام فروشند/ فروشگاه",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText :'نام فروشند/ فروشگاه',
        ),
      ),
    );
  }
  Widget _bulidAdd(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: FloatingActionButton(
    backgroundColor: Colors.lightGreen,
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context){
                return ShopButtonNavigator();
              }
          ),
        );
      },
      child: Icon(Icons.add,
      ),
    ),
        ),
      ],
    );
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
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                      color:Colors.grey,
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
                ],
              )
            ],
          ),

        ));
  }


}
