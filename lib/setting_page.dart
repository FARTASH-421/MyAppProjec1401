import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_pojects/icon_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SettingsGroup(
            title: 'GENERAL',
            children: [
                buildLogOut(),
                bulidDeletAccount(),
              ],
          ),
          const SizedBox(height: 32,),
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
    onTap: (){ } ,
  );
  Widget bulidDeletAccount() =>SimpleSettingsTile(
      title: 'Delete Acount',
      subtitle: '',
    leading: IconWidget( icon: Icons.delete, color: Colors.pink,),
    onTap: ()=> Util.showSnackBar(context,'Clicked Deleted'),
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
}
