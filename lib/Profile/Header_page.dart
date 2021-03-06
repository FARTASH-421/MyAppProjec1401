import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'icon_widget.dart';

class HeaderPage extends StatelessWidget {
static const keyDarkMode = 'key-dark-mode';

@override
  Widget build(BuildContext context)=> Column(
    children: [
      buildDarkMode(),
    ],
  );

  Widget buildDarkMode () =>SwitchSettingsTile(
      title: 'Dark Mode',
      settingKey: keyDarkMode,
      leading: IconWidget(icon:Icons.dark_mode, color: Color(0xFF6422EF3),),
      onChange: (_){ },
  );

}
