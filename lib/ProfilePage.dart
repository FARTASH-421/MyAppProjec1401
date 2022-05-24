import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) =>Scaffold(
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          buildLogOut(),
          bulidDeletAccount(),

        ],
      ),
    ),
  );
  Widget buildLogOut() =>SimpleSettingsTile(
    title: 'Logout',
    leading: Icon(Icons.logout, color: Colors.blueAccent,),
    subtitle: '',
    onTap: (){ } ,

  );

 Widget bulidDeletAccount() =>SimpleSettingsTile(
     title: 'Delete Account',
      subtitle: '',
   leading: Icon(Icons.delete, color: Colors.pinkAccent,
   ),
   onTap: () => Util.,
 );
}
