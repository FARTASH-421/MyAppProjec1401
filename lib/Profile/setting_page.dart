import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_pojects/LongPage.dart';
import 'package:my_pojects/Profile/EideProfile.dart';
import 'package:my_pojects/Profile/account_page.dart';
import 'package:my_pojects/SaveData/Data.dart';
import 'package:my_pojects/SaveData/SiveInfo.dart';
import 'package:my_pojects/Things/Tachonology/ComputerAndMobile.dart';
import 'MyDetital.dart';
import 'icon_widget.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  PickedFile? _imageFile;
  final ImagePicker _piker = ImagePicker();
  static const keyDarkMode = 'key-dark-mode';
  String imagePath = "images/Profile.jpg";

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Color(0x393F8DFF),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
            children: [
              imageProfile(),
              SettingsGroup(
                title: '',
                children: [
                  showInfo(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SettingsGroup(title: 'سفارش های من', children: [
                IconProfile(context).buildContiner(),
              ]),
              buildDarkMode(),
              SettingsGroup(
                title: 'GENERAL',
                children: [
                  AccontPage(),
                  buildLogOut(),
                  bulidDeletAccount(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildLogOut() => SimpleSettingsTile(
        title: 'Logout',
        leading: IconWidget(
          icon: Icons.logout,
          color: Colors.blueAccent,
        ),
        subtitle: '',
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BuildAlertDialog(
                  "Log out?", "Are you sure want to log out?", context);
            },
          );
        },
      );

  Widget bulidAccount() => SimpleSettingsTile(
        leading: const IconWidget(
          icon: Icons.person,
          color: Colors.green,
        ),
        title: 'Account Settings',
        subtitle: 'Privacy, Security, Language',
        child: Container(),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AccontPage();
            }),
          );
        },
      );

  Widget bulidDeletAccount() => SimpleSettingsTile(
        title: 'Delete Acount',
        subtitle: '',
        leading: const IconWidget(
          icon: Icons.delete,
          color: Colors.pink,
        ),
        onTap: () => Utils.showSnackBar(context, 'Clicked Deleted'),
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        title: 'Dark Mode',
        settingKey: keyDarkMode,
        leading: const IconWidget(
          icon: Icons.dark_mode,
          color: Color(0xFF6422ef3),
        ),
        onChange: (_) {},
      );

  Widget imageProfile() => Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 110.0,
              backgroundImage: imaage(),
            ),
            Positioned(
              bottom: 20.0,
              right: 14.0,
              child: InkWell(
                child: const IconWidget(
                    icon: Icons.camera_alt, color: Colors.teal),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => buttonSheet()),
                  );
                },
              ),
            ),
          ],
        ),
      );

  void takePhone(ImageSource source) async {
    try {
      final pickedFile = await _piker.getImage(source: source);
      if (pickedFile == null) return;
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Widget showInfo() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyDataInf.getInstance()!
                            .listInfo
                            .last
                            .userName
                            .toString(),
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontFamily: "Kurale"),
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyDataInf.getInstance()!
                            .listInfo
                            .last
                            .numberPhone
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            ),
            EideProfile(),
          ],
        ),
      );

  Widget buttonSheet() => Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Choose Profile Photo",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Kurale",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                    onPressed: () {
                      takePhone(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Kurale",
                      ),
                    )),
                FlatButton.icon(
                    onPressed: () {
                      takePhone(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text(
                      "Image",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Kurale",
                      ),
                    )),
              ],
            ),
          ],
        ),
      );

  Widget logoutButton() => Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Key",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Kurale",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );

  AssetImage imaage() {
    AssetImage n = AssetImage(imagePath);
    if (_imageFile != null) {
      n = AssetImage((_imageFile!.path));
      return n;
    }
    return n;
  }

  Widget BuildAlertDialog(String title, String content, BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Kurale",
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: const TextStyle(
                    fontFamily: "Kurale",
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      onPressed: () => Navigator.of(context).pop(
                        Material()
                      ),
                      child: Text("No",style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      onPressed: () => Navigator.popUntil(
                        context,
                        (route) =>route.isFirst
                      ),
                      child: Text("Yes",style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              radius: 30,
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 35,
              ),
            ),
            top: -35,
          ),
        ],
      ),
    );
  }
}

class Utils {
  static showSnackBar(BuildContext context, String s) => showModalBottomSheet(
        context: context,
        builder: ((builder) => Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                s,
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontFamily: "Kurale",
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              //
            )),
      );
}
