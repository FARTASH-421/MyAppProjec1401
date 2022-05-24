import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class HeaderPage extends StatelessWidget {
static const keyDarkMode = 'key-dark-mode';


  @override
  Widget build(BuildContext context)=> Column(
    children: [
      buildHeader(),
      const SizedBox(height:  32,),
      buildUser(context),
      buildDarkMode(),
    ],
  );

  Widget buildDarkMode () =>SwitchSettingsTile(
      title: 'Dark Mode',
      settingKey: keyDarkMode,
      leading: Icon(Icons.dark_mode, color: Color(0xFF6422EF3),),
      onChange: (_){ },
  );

 Widget buildHeader()=> Center(
   child: Text(
     'Settings',

   ),
 );
}
