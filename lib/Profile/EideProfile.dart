import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/SaveData/Data.dart';

import 'icon_widget.dart';

class EideProfile extends StatelessWidget {
  static const keyUserName = 'key-location';
  static const keyEmail = 'key-location';
  static const keyNumber = 'key-location';
  static const keyPassword = 'key';
  static const keyCompanyName = 'location';

  EideProfile({Key? key}) : super(key: key);
  String userName = "Fartash";
  String password = "aqqf2425";
  String nameCompany ="Leaf";
  String email = "aq.fartash.421@gmail.com";
  String number = '09926067519';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Edit Profile',
        subtitle: 'UserName, NumberPhone, Password',
        leading: IconWidget(
          icon: Icons.edit,
          color: Colors.black45,
        ),
        child: SettingsScreen(
          title: 'Edit Profile',
          children: [
            buildUserName(),
            buildPassword(),
            buildEmail(),
            buildNumberPhone(),
            buildNameCompany(),
          ],
        ),
      );

  Widget buildNumberPhone() => TextInputSettingsTile(
        title: 'Edit NumberPhone',
        settingKey: keyNumber,
        initialValue: number,
        onChange: (keyNumber) {},
      );

  Widget buildPassword() => TextInputSettingsTile(
        title: 'Edit Password',
        settingKey: keyPassword,
        initialValue: password,
        onChange: (keyPassword) {},
      );

  Widget buildUserName() => TextInputSettingsTile(
        title: 'Edit UserName',
        settingKey: keyUserName,
        initialValue: userName,
        onChange: (keyUserName) {},
      );

  Widget buildEmail() => TextInputSettingsTile(
        title: 'Edit Email',
        settingKey: keyEmail,
        initialValue: email,
        onChange: (keyEmail) {},
      );
  Widget buildNameCompany() => TextInputSettingsTile(
    title: 'Edit Name Company',
    settingKey: keyCompanyName,
    initialValue: nameCompany,
    onChange: (keyCompanyName) {},
  );
}
