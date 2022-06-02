import 'package:flutter/material.dart';
import 'ShopButtonNavigator.dart';


class SingUpPage extends StatefulWidget {
  const SingUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}
class _SingUpPageState extends State<SingUpPage>{

  final userName= TextEditingController();
  final  numberPhone = TextEditingController();
  final password= TextEditingController();
  final nameCompany= TextEditingController();
  final email= TextEditingController();


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
        controller:userName,
        keyboardType: TextInputType.emailAddress,
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
        ),
      ),
    );
  }
  Widget  _bulidPhoneNumber(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: numberPhone,
        keyboardType: TextInputType.number,
        onChanged: (value){ },
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
        ),
      ),
    );
  }
  Widget  _bulidPassword(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.visiblePassword,
        controller: password,
        onChanged: (value){ },
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
        ),
      ),
    );
  }
  Widget  _bulidEmail(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.emailAddress,
        controller: email,
        onChanged: (value){ },
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
        ),
      ),
    );
  }
  Widget  _bulidUserAcount(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(

        keyboardType: TextInputType.text,
        controller: nameCompany,
        onChanged: (value){},
        decoration: const InputDecoration(
          labelText:"نام فروشند/فروشگاه",
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),

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

    backgroundColor: Colors.orange,
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context){
                print("Name: ${userName.text}");
                print("Password: ${password.text}");
                print("Email: ${email.text}");
                print("Number: ${numberPhone.text}");
                print("NameCompany: ${nameCompany.text}");
                return ShopButtonNavigator();
              }
          ),
        );
      },
      child: Icon(Icons.playlist_add, color: Colors.black,size: 50,),
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
