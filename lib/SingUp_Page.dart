import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pojects/LongPage.dart';
import 'package:my_pojects/SaveData/Data.dart';
import 'package:my_pojects/SaveData/SiveInfo.dart';
import 'ShopButtonNavigator.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  List<Information>? list = MyDataInf.getInstance()?.listInfo;

  TextEditingController userName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameCompany = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController _dataUser = TextEditingController(text: "");
  TextEditingController _numberPhone = TextEditingController(text: "");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _log = "";

  final RegExp emailExp = new RegExp(
      "/[a-zA-Z]{1}[a-zA-Z0-9.,~`.><!@#\$%^&*()_-]{1,}.((@gmail|yahoo|outlook).)((net)|(com)|(ir)(org))/",
      caseSensitive: false,
      multiLine: false);

  Widget _bulidTextWelcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "WellCome",
            style: TextStyle(
              fontFamily: "Kurale",
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              key: _formKey,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16,),
                    Text(
                      'SignUp',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Kurale"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _buildFullName("Full Name *"),
                _buildEmail("E-mail address *"),
                _buildNumber("number *"),
                _buildPassword("Password *"),
                _buildSalaryName("Name Company/Salary"),
                SizedBox(
                  height: 50,
                ),
                _bulidAdd(),
                Spacer(),
                _buildLongIn(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumber(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xff2b7557),
            )
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        controller: number,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          // hintText: myHintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.phone,
            color: Colors.orange,
            size: 28,
          ),
          hintText: title,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPassword(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xff2b7557),
            )
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        controller: password,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.security,
            color: Colors.orange,
            size: 28,
          ),
          hintText: title,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildEmail(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 25),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xff2b7557),
            )
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        controller: email,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          // hintText: myHintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.email_outlined,
            color: Colors.orange,
            size: 28,
          ),
          hintText: title,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildFullName(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xff2b7557),
            )
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        controller: userName,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          // hintText: myHintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.person,
            color: Colors.orange,
            size: 28,
          ),
          hintText: title,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSalaryName(String title) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xff2b7557),
            )
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        controller: nameCompany,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: Icon(
            Icons.shop,
            color: Colors.orange,
            size: 28,
          ),
          hintText: title,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _bulidAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Container(
            height: 50,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.lightBlueAccent,
            ),
            child: TextButton(
              onPressed: () {
                Information my = Information(userName.text, number.text,
                    password.text, nameCompany.text, email.text);

                if (!(list!.contains(my))) {
                  list!.add(my);
                }
                if (_formKey.currentState!.validate()) {
                  _dataUser.text = userName.text +
                      "|" +
                      email.text +
                      "|" +
                      password.text +
                      "|" +
                      nameCompany.text;
                  _numberPhone.text = number.text;
                  send(_dataUser.text, _numberPhone.text);
                  Text(_log);

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => ShopButtonNavigator(),
                      ),
                      (Route<dynamic> route) => false);
                }
              },
              child: Text("New Register",
              style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold,fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  send(String userdata, String number) async {
    String request = "save\nuser:$userdata,,number:${number}\u0000";

    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        setState(() {
          _log += String.fromCharCodes(response) + "\n";
        });
      });
    });
  }

  Widget _buildLongIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account ? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Nas",
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:  SingleChildScrollView(
        child:Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                _bulidTextWelcome(),
                SizedBox(height: 30,),
                _buildContainer(),

              ],
            )
          ],
        ),
      ),
      ),
    );
  }
}

// Widget _buildTextFiled(
//     String title, TextEditingController Mycontroller, String myHintText) {
//   return Padding(
//     key: _formKey,
//     padding: EdgeInsets.all(15),
//     child: TextFormField(
//
//       controller: Mycontroller,
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         labelText: title,
//         hintText: myHintText,
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.purpleAccent,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black45),
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildEmail(String title,  TextEditingController Email,) {
//   return Padding(
//     padding: EdgeInsets.all(15),
//     child: TextFormField(
//       controller: Email,
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         labelText: title,
//         hintText: "enter email address",
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.purpleAccent,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black45),
//         ),
//       ),
//       keyboardType: TextInputType.phone,
//       validator: (value) {
//         if (!(value!.isEmpty) &&
//             !emailExp.hasMatch(value)) {
//           return "Enter a valid  E-mail address";
//         }
//         return null;
//       },
//     ),
//   );
// }

//
// Widget _buildPassword(String title,  TextEditingController password,) {
//   return Padding(
//     padding: EdgeInsets.all(15),
//     child: TextFormField(
//       controller: password,
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         labelText: title,
//         hintText: "enter Password",
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.purpleAccent,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black45),
//         ),
//       ),
//       keyboardType: TextInputType.visiblePassword,
//       validator: (value) {
//         if (!(value!.isEmpty) &&
//             !RegExp("^((\+98)|(0)|(0098))[0-9]{10}").hasMatch(value)) {
//           return "Enter a Password";
//         }
//         return null;
//       },
//     ),
//   );
// }

// Widget _buildNumber(String title,  TextEditingController number,) {
//   return Padding(
//     padding: EdgeInsets.all(15),
//     child: TextFormField(
//       controller: number,
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         labelText: title,
//         hintText: title,
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.purpleAccent,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black45),
//         ),
//       ),
//       keyboardType: TextInputType.phone,
//       validator: (val) {
//         bool check = true;
//         for (int i = 0; i < list!.length; i++) {
//           if (number.value.text == list?[i].number) check = false;
//         }
//         if (!(val!.isEmpty) &&
//             check &&
//             !RegExp(r"^((\+98)|(0)|(0098))[0-9]{10}").hasMatch(val)) {
//           return "Enter a valid phone number";
//         }
//         return null;
//       },
//     ),
//   );
// }
