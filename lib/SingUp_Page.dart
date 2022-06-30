import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool isHidePassword = true;

  TextEditingController userName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameCompany = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController _dataUser = TextEditingController(text: "");
  TextEditingController _numberPhone = TextEditingController(text: "");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _log = "";

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
        Form(
          key: _formKey,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
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
                  Container(
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
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          bool check = true;
                          for (int i = 0; i < list!.length; i++) {
                            if (userName.text == list?[i].userName)
                              check = false;
                          }
                          if (!check) {
                            return "The user account is available!";
                          } else
                            return null;
                        } else {
                          return "user name is empty";
                        }
                      },
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        // hintText: myHintText,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        icon: Icon(
                          Icons.person,
                          color: Colors.orange,
                          size: 28,
                        ),
                        hintText: "Full Name *",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          if (!RegExp(
                                  r"^[a-zA-Z]{1}[a-zA-Z0-9.,~`.><!@#\$%^&*()_-]{1,}.((@gmail|yahoo|outlook).)((net)|(com)|(ir)(org))")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        } else {
                          return "email address is empty";
                        }
                      },
                      decoration: InputDecoration(
                        // hintText: myHintText,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.orange,
                          size: 28,
                        ),
                        hintText: "E-mail address ",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
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
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          bool check = true;
                          for (int i = 0; i < list!.length; i++) {
                            if (number.value.text == list?[i].number) {
                              check = false;
                            }
                          }
                          if (!check) {
                            return "The number phone account is available !";
                          } else if (!RegExp(r"^((\+98)|(0)|(0098))[0-9]{10}")
                              .hasMatch(value)) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        } else {
                          return "phone number is empty";
                        }
                      },
                      decoration: InputDecoration(
                        // hintText: myHintText,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        icon: Icon(
                          Icons.phone,
                          color: Colors.orange,
                          size: 28,
                        ),
                        hintText: "number *",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
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
                      obscureText: isHidePassword,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          if (!RegExp(r"[\da-zA-Z~`!@#$%^&*()_+=}{:;?.>,<]{8,}")
                              .hasMatch(value)) {
                            return "Enter a valid password";
                          } else
                            return null;
                        } else {
                          return "password is empty";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        icon: Icon(
                          Icons.security,
                          color: Colors.orange,
                          size: 28,
                        ),
                        hintText: "Password *",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: _togglePassword,
                          child: changeIconsPassword(),
                        ),
                      ),

                    ),
                  ),
                  Container(
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        icon: Icon(
                          Icons.shop,
                          color: Colors.orange,
                          size: 28,
                        ),
                        hintText: "Name Company/Salary",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
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
                              if (_formKey.currentState!.validate()) {
                                Information my = Information(
                                    userName.text,
                                    number.text,
                                    password.text,
                                    nameCompany.text,
                                    email.text);

                                if (!(list!.contains(my))) {
                                  list!.add(my);
                                }
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
                                      builder: (context) =>
                                          ShopButtonNavigator(),
                                    ),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  _buildLongIn(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget changeIconsPassword() {
    if (isHidePassword == true) {
      return const Icon(Icons.visibility);
    } else {
      return const Icon(Icons.visibility_off);
    }
  }

  void _togglePassword() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
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
        body: SingleChildScrollView(
          child: Stack(
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
                  SizedBox(
                    height: 40,
                  ),
                  _bulidTextWelcome(),
                  SizedBox(
                    height: 30,
                  ),
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
