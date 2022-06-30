
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_pojects/Profile/icon_widget.dart';
import 'package:my_pojects/SaveData/Data.dart';
import 'package:my_pojects/ShopButtonNavigator.dart';
import 'package:my_pojects/SingUp_Page.dart';
import 'package:url_launcher/url_launcher.dart';

class LongPage extends StatefulWidget {
  const LongPage({Key? key}) : super(key: key);

  @override
  State<LongPage> createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
  TextEditingController numberPhone = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isHidePassword = true;
  bool checkLogin = false;

  Widget _bulidLoge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            "WellCome",
            style: TextStyle(
              fontFamily: "Kurale",
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulidOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '- OR -',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget _bulidContianer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                _bulidPhoneNumberRow(),
                _bulidPasswordRow(),
                _bulidForgitPasswordRow(),
                _bulidLoginButton(),
                _bulidOrRow(),
                const SizedBox(
                  height: 15,
                ),
                _bulidSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulidPhoneNumberRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        autofocus: true,
        // keyboardType: TextInputType.number,
        controller: numberPhone,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.lightGreen,
          ),
          hintText: 'NumberPhone',
        ),
      ),
    );
  }

  Widget _bulidPasswordRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isHidePassword,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.lightGreen,
          ),
          hintText: 'Password',
          suffixIcon: InkWell(
            onTap: _togglePassword,
            child: changeIconsPassword(),
          ),
        ),
      ),
    );
  }

  Widget _bulidLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              List inf = MyDataInf.getInstance()!.listInfo;
              for (int i = 0; i < inf.length; i++) {
                if (inf[i].number == numberPhone.value.text &&
                    inf[i].password == password.value.text) {
                  checkLogin = true;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ShopButtonNavigator()),
                      (route) => false);
                }
              };
              if (!checkLogin) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BuildAlertDialog(
                        "Wrong inputs", "Pleas try again.", context);
                  },
                );
              }
              setState(() {});
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bulidSingUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SingUpPage()));
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                      text: "Sign Up",
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

  Widget _bulidSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            final url = 'https://twitter.com/i/flow/login';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            }
          },
          child: const MyIcon(
              colorThem: Colors.lightBlueAccent,
              colorIcon: Colors.white,
              myIcon: FontAwesomeIcons.twitter),
        ),
        const SizedBox(
          width: 13,
        ),
        GestureDetector(
          onTap: () async {
            final url = 'https://www.facebook.com/';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            }
          },
          child: const MyIcon(
              colorThem: Colors.indigo,
              colorIcon: Colors.white,
              myIcon: FontAwesomeIcons.facebookF),
        ),
        const SizedBox(
          width: 13,
        ),
        GestureDetector(
          onTap: () async {
            final url = 'https://github.com/';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            }
          },
          child: const MyIcon(
              colorThem: Colors.black,
              colorIcon: Colors.white,
              myIcon: FontAwesomeIcons.github),
        ),
        const SizedBox(
          width: 13,
        ),
        GestureDetector(
          onTap: () async {
            final url = 'https://www.linkedin.com/login';

            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            }
          },
          child: const MyIcon(
              colorThem: Colors.blueAccent,
              colorIcon: Colors.white,
              myIcon: FontAwesomeIcons.linkedin),
        ),
      ],
    );
  }

  Widget _bulidForgitPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const ShopButtonNavigator();
              }),
            );
          },
          child: const Text(
            "Forget Password",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 15,
                fontWeight: FontWeight.bold),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff2f3f7),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  )),
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

  Widget BuildAlertDialog(String title, String content, BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 17,
                ),
                Text(
                  title + " !",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent,
                    fontFamily: "Kurale",
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Okey",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 27,
              child: Icon(
                Icons.assistant_photo,
                color: Colors.white,
                size: 30,
              ),
            ),
            top: -30,
          ),
        ],
      ),
    );
  }
}
