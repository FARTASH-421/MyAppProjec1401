import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/Profile/account_page.dart';
import 'package:my_pojects/Profile/image_profile.dart';
import 'icon_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) => Scaffold(
    // backgroundColor: Color(0x393F8DFF),
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SettingsGroup(
            title: 'ProFile',
            children: [
              Image.asset('images/ksenia.jpg'),
            ],
          ),

          buildDarkMode(),
          SettingsGroup(
            title: 'GENERAL',
            children: [
              AccontPage(),
              buildLogOut(),
              bulidDeletAccount(),
              ],
          ),
          SettingsGroup(
              title: 'FEEDBACK',
              children: [
                const SizedBox(height: 8,),
                bulidReportBug(context),
                bulidSendFeedback(context),
              ]
          ),
        ],
      ),
    ),
  );
  Widget buildLogOut() =>SimpleSettingsTile(
    title: 'Logout',
    leading: IconWidget( icon: Icons.logout, color: Colors.blueAccent,),
    subtitle: '',
    onTap: ()=> Utils.showSnackBar(context, 'Clicked Logout') ,
  );

  Widget bulidAccount() =>SimpleSettingsTile(
    leading: IconWidget( icon:Icons.person,color: Colors.green,),
    title: 'Account Settings',
    subtitle: 'Privacy, Security, Language',
    child: Container(),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context){
              return AccontPage();
            }
        ),
      );
    },
  );

  Widget bulidDeletAccount() =>SimpleSettingsTile(
      title: 'Delete Acount',
      subtitle: '',
    leading: IconWidget( icon: Icons.delete, color: Colors.pink,),
    onTap: ()=> Utils.showSnackBar(context,'Clicked Deleted'),
  );

 Widget bulidReportBug(BuildContext context) =>SimpleSettingsTile(
     title: 'Report A Bug',
      subtitle: '',
      leading: IconWidget( icon: Icons.bug_report, color: Colors.teal,),
      onTap: ()=> Utils.showSnackBar(context,'Clicked Report A Bug'),

 );

 Widget bulidSendFeedback(BuildContext context) =>SimpleSettingsTile(
   title: 'Send Feedback',
   subtitle: '',
   leading: IconWidget( icon:Icons.thumb_up, color: Colors.purple,),
   onTap: ()=> Utils.showSnackBar(context,'Clicked SendFeedBack'),

 );

  Widget buildDarkMode () =>SwitchSettingsTile(
    title: 'Dark Mode',
    settingKey: keyDarkMode,
    leading: IconWidget(icon:Icons.dark_mode, color: Color(0xFF6422ef3),),
    onChange: (_){ },
  );
}

class Utils{

  static showSnackBar(BuildContext context, String s) =>
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context){
              return Navigator();
            }
        ),
      );
}
class Feedback{

}