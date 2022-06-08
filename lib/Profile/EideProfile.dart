import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/SaveData/Data.dart';

import 'icon_widget.dart';

class EideProfile extends StatelessWidget {
  static const keyUserName = 'key-UserName';
  static const keyEmail = 'key-Email';
  static const keyNumber = 'key-Number';
  static const keyPassword = 'key-Password';
  static const keyCompanyName = 'key-CompanyName';

  EideProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Edit Profile',
        subtitle: 'UserName, NumberPhone, Password',
        leading: const IconWidget(
          icon: Icons.edit,
          color: Colors.black45,
        ),
        child: SettingsScreen(
          title: 'Edit Profile',
          children: [
            buildUserName(),
            buildSecurity(context),
            buildEmail(),
            buildNumberPhone(),
            buildNameCompany(),
          ],
        ),
      );
  Widget buildSecurity(context) =>SimpleSettingsTile(
    title: 'Security',
    subtitle: 'Edit Password',
    leading: IconWidget( icon: Icons.security, color: Colors.red,),
    onTap: ()=>Text("This Problum"),
  );


  Widget buildNumberPhone() => TextInputSettingsTile(
        title: 'Edit NumberPhone',
        settingKey: keyNumber,
        initialValue: MyDataInf.getInstance()!.listInfo.last.numberPhone.toString(),
        onChange: (keyNumber) {},
      );

  Widget buildPassword() => TextInputSettingsTile(
        title: 'Edit Password',
        settingKey: keyPassword,
        initialValue: MyDataInf.getInstance()!.listInfo.last.password.toString(),
        onChange: (keyPassword) {},
      );

  Widget buildUserName() => TextInputSettingsTile(
        title: 'Edit UserName',
        settingKey: keyUserName,
        initialValue: MyDataInf.getInstance()!.listInfo.last.userName.toString(),
        onChange: (keyUserName) {},
      );

  Widget buildEmail() => TextInputSettingsTile(
        title: 'Edit Email',
        settingKey: keyEmail,
        initialValue: MyDataInf.getInstance()!.listInfo.last.email.toString(),
        onChange: (value) {

        },
      );
  Widget buildNameCompany() => TextInputSettingsTile(
    title: 'Edit Name Company',
    settingKey: keyCompanyName,
    initialValue: MyDataInf.getInstance()!.listInfo.last.UserAcount.toString(),
    onChange: (keyCompanyName) {},
  );
}
