import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'icon_widget.dart';

class EideProfile extends StatelessWidget {

  static const keyLocation = 'key-location';
  static const keyPassword = 'key';
  static const keyUserName = 'location';

  const EideProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
    title: 'Edit Profile',
    subtitle: 'UserName, NumberPhone, Password',
    leading: IconWidget( icon: Icons.edit,color: Colors.black45,),
    child: SettingsScreen(
      title: 'Edit Profile',
      children: [
        buildUserName(),
        buildPassword(),
        buildEmail(),
        buildNumberPhone(),

      ],
    ),
  );

  Widget buildNumberPhone() => TextInputSettingsTile(
    title: 'Edit NumberPhone',
    settingKey: keyUserName,
    initialValue: '09926067519',
    onChange: (location){ },
  );

  Widget buildPassword() => TextInputSettingsTile(
    title: 'Edit Password',
    settingKey: keyPassword,
    initialValue: '24252627',
    onChange: (keyPassword){ },
  );

  Widget buildUserName() => TextInputSettingsTile(
    title: 'Edit UserName',
    settingKey: keyLocation,
    initialValue: 'Fartash',
    onChange: (location){ },
  );

  Widget buildEmail() => TextInputSettingsTile(
    title: 'Edit Email',
    settingKey: keyLocation,
    initialValue: 'aq.fartash@gami.com',
    onChange: (location){ },
  );

}
