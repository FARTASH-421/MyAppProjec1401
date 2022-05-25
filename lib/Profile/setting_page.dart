import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_pojects/Profile/account_page.dart';
import '../SingUp_Page.dart';
import 'icon_widget.dart';


class SettingPage extends StatefulWidget {
  var _userName;
  var _numberPhone;
  var _password;
  var _UserAcount;
  var _email;


  @override
  State<SettingPage> createState() => _SettingPageState();

  get userName => _userName;

  set userName(value) {
    _userName = value;
  }
  get numberPhone => _numberPhone;
  set numberPhone(value) {
    _numberPhone = value;
  }

  get password => _password;
  set password(value) {
    _password = value;
  }

  get UserAcount => _UserAcount;
  set UserAcount(value) {
    _UserAcount = value;
  }

  get email => _email;
  set email(value) {
    _email = value;
  }
}

class _SettingPageState extends State<SettingPage> {
   PickedFile? _imageFile;
   final ImagePicker _piker = ImagePicker();

  static const keyDarkMode = 'key-dark-mode';
  String imagePath= "images/ksenia.jpg";

  @override
  Widget build(BuildContext context) => Scaffold(
    // backgroundColor: Color(0x393F8DFF),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          imageProfile(),
          const SizedBox(
            height: 2,
          ),
          SettingsGroup(
            title: '',
            children: [
            showInfo(),
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
    leading: const IconWidget( icon: Icons.logout, color: Colors.blueAccent,),
    subtitle: '',
    onTap: ()=> Utils.showSnackBar(context, 'Clicked Logout') ,
  );

  Widget bulidAccount() =>SimpleSettingsTile(
    leading: const IconWidget( icon:Icons.person,color: Colors.green,),
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
    leading: const IconWidget( icon: Icons.delete, color: Colors.pink,),
    onTap: ()=> Utils.showSnackBar(context,'Clicked Deleted'),
  );
  Widget bulidReportBug(BuildContext context) =>SimpleSettingsTile(
     title: 'Report A Bug',
      subtitle: '',
      leading: const IconWidget( icon: Icons.bug_report, color: Colors.teal,),
      onTap: ()=> Utils.showSnackBar(context,'Clicked Report A Bug'),

 );
 Widget bulidSendFeedback(BuildContext context) =>SimpleSettingsTile(
   title: 'Send Feedback',
   subtitle: '',
   leading: const IconWidget( icon:Icons.thumb_up, color: Colors.purple,),
   onTap: ()=> Utils.showSnackBar(context,'Clicked SendFeedBack'),

 );
 Widget buildDarkMode () =>SwitchSettingsTile(
    title: 'Dark Mode',
    settingKey: keyDarkMode,
    leading: const IconWidget(icon:Icons.dark_mode, color: Color(0xFF6422ef3),),
    onChange: (_){ },
  );

 Widget imageProfile() => Center(
   child: Stack(
     children: [
       CircleAvatar(
         radius: 100.0,
         backgroundImage:imaage(),

       ),
       Positioned(
         bottom: 20.0,
         right: 14.0,
           child: InkWell(
               child: const IconWidget(icon:Icons.camera_alt, color:Colors.teal),
             onTap:(){
                 showModalBottomSheet(
                     context: context,
                     builder:( (builder) =>buttonSheet()),
                 );
             },
           ),
       ),
     ],
   ),
 );
 void takePhone(ImageSource source) async{
   try{
     final pickedFile = await _piker.getImage(source: source);
     if(pickedFile== null) return;
     setState(() {
       _imageFile =pickedFile;
     });
   }catch(error){
     debugPrint(error.toString());
   }

   }


 Widget showInfo()=>Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children:  [
       FlatButton( onPressed: (){
         Navigator.of(context).push(
           MaterialPageRoute(
               builder: (context){
                 return SingUpPage();
               }
           ),
         );
       },
         child: Center(
           child: Column(

             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center ,
                 children: const [
                   Text("Fartash@421",
                     style:  TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         color: Colors.orange,
                         fontFamily: "Kurale"
                     ),),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center ,
                 children: const [
                 Text("09926027519",
                   style:  TextStyle(
                       fontSize: 16,
                       color: Colors.orange,
                   ),)
               ],
               ),
             ],
           ),
           ),
        ),
      ],
    ),
 );

 Widget buttonSheet()=> Container(
   height: 100,
   width: MediaQuery.of(context).size.width,
   margin: const EdgeInsets.symmetric(
     horizontal: 20,
     vertical: 20,
   ) ,
   child: Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Choose Profile Photo",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Kurale",
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
       const SizedBox(
         height: 20,
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
            FlatButton.icon(
                onPressed: () {  takePhone(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Camera",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Kurale",
                ),)
            ),

            FlatButton.icon(
                onPressed: () { takePhone(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text("Image",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Kurale",
                ),)
            ),
           ],
         ),
     ],
   ),
 );


 Widget logoutButton()=>Container(
   height: 100,
   width: MediaQuery.of(context).size.width,
   margin: const EdgeInsets.symmetric(
     horizontal: 20,
     vertical: 20,
   ) ,
   child: Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children:[
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: const [
           Text("Key",
             style: TextStyle(
                 fontSize: 18,
                 fontFamily: "Kurale",
                 fontWeight: FontWeight.bold
             ),),
         ],
       ),
       const SizedBox(
         height: 20,
       ),
     ],
   ),
 );

AssetImage imaage(){
  AssetImage n = AssetImage(imagePath);
  if(_imageFile != null) {
   n = AssetImage((_imageFile!.path));
   return n;
  }
  return n;
}

}

class Utils{
  static showSnackBar(BuildContext context, String s) => showModalBottomSheet(
    context: context,
    builder:( (builder) => Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ) ,
    child: Text(s,
      style: const TextStyle(
          fontSize: 18,
          fontFamily: "Kurale",
          fontWeight: FontWeight.bold
      ),),
  )
  ),
  );
}

