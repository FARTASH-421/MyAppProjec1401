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
  final userName = TextEditingController();
  final numberPhone = TextEditingController();
  final password = TextEditingController();
  final nameCompany = TextEditingController();
  final email = TextEditingController();

  Widget _bulidTextWelcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
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

  Widget _bulidContianer() {
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                _bulidTextFiled("User Name*", userName, "Enter user name"),
                _bulidTextFiled(
                    "NumberPhone*", numberPhone, "Enter number phone"),
                _bulidTextFiled("Password*", password, "Enter password"),
                _bulidTextFiled(
                    "Name Company/Salary", nameCompany, "Enter name company"),
                _bulidTextFiled(" E-mail ", email, "Enter E-mail address"),
                _bulidAdd(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulidTextFiled(
      String title, TextEditingController Mycontroller, String myHintText) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: Mycontroller,
        onChanged: (value) {},
        decoration: InputDecoration(
          labelText: title,
          hintText: myHintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purpleAccent,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
          ),
        ),
      ),
    );
  }

  Widget _bulidAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  Information my = Information(userName.text, numberPhone.text,
                      password.text, nameCompany.text, email.text);

                  MyDataInf.getInstance()?.listInfo.add(my);

                  return const ShopButtonNavigator();
                }),
              );
            },
            child: const Icon(
              Icons.playlist_add,
              color: Colors.black,
              size: 45,
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
          body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
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
                  height: 60,
                ),
                _bulidTextWelcome(),
                _bulidContianer(),
              ],
            )
          ],
        ),
      )),
    );
  }
}
