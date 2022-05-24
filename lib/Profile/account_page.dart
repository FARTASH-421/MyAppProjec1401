import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/Profile/setting_page.dart';

import 'icon_widget.dart';

class AccontPage extends StatelessWidget {
static const keyLanguage = 'key-language';
static const keyLocation = 'key-location';
static const keyPassword = 'key-password';
  var Language = {
    1: 'English',
    2: 'Persion',
    3: 'Chinese',
    4: 'Hindi'
  };
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
    title: 'Account Settings',
    subtitle: 'Privacy, Security, Language',
    leading: IconWidget( icon: Icons.person,color: Colors.greenAccent,),
    child: SettingsScreen(
      title: 'Account Settings',
      children: [
        builLanguage(),
        buildLocation(),
        buildPassword(),
        buildPrivacy(context),
        buildSecurity(context),
        buildAcconuntInfo(context),
      ],
    ),
  );

  Widget builLanguage() =>DropDownSettingsTile(
    title: 'Language',
    settingKey: keyLanguage,
    selected: 1,
    values: Language,
    onChange: (language){ },
  );

  Widget buildLocation() => TextInputSettingsTile(
    title: 'Location',
    settingKey: keyLocation,
    initialValue: 'Iran',
    onChange: (location){ },

  );
  Widget bulidAccount() =>SimpleSettingsTile(
    leading: IconWidget( icon:Icons.person,color: Colors.green,),
    title: 'Account Settings',
    subtitle: 'Privacy, Security, Language',
    child: Container(),
    onTap: () { },
  );

  Widget buildPassword() => TextInputSettingsTile(
    settingKey: keyPassword,
    title:'Password',
    obscureText: true,
    validator: (password) => password !=null && password.length >= 6
        ? null :'Enter 6 characters',

  );

 Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
     title: 'Privacy',
     subtitle: '',
   leading: IconWidget( icon: Icons.lock, color: Colors.blue,),
   onTap: ()=> Utils.showSnackBar(context,'Clicked Privacy'),
 );


Widget buildSecurity(context) =>SimpleSettingsTile(
  title: 'Security',
  subtitle: '',
  leading: IconWidget( icon: Icons.security, color: Colors.red,),
  onTap: ()=> Utils.showSnackBar(context,'Clicked Security'),
);


Widget buildAcconuntInfo(context) =>SimpleSettingsTile(
  title: 'AccountInfo',
  subtitle: '',
  leading: IconWidget( icon: Icons.info, color: Colors.purple,),
  onTap: ()=> Utils.showSnackBar(context,'Clicked AccountInfo'),
);

}
