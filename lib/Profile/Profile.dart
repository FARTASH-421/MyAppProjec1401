import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_pojects/constants.dart';
import 'package:my_pojects/Profile/icon_widget.dart';
class Profile extends StatelessWidget {
  // static const keyLanguage = 'key-language';
  // static const keyLocation = 'key-location';
  // static const keyPassword = 'key-password';
  //   var Language = {
  //     1: 'English',
  //     2: 'Persion',
  //     3: 'Chinese',
  //     4: 'Hindi'
  //   };
  @override
  Widget build(BuildContext context) {

    // Widget bulidDarkMoad() => SwitchSettingsTile(
    //     leading: IconWidget(icon: Icons.dark_mode,color: Color(0xFF642EF3)),
    //   settingKey: keyDarkMode,
      // title: 'Dark Mode',
      // onChange: (isDarkMode){ },
    // );
    //
    // Widget buildLogOut() =>SimpleSettingsTile(
    //   title: 'Logout',
    //   leading: IconWidget(icon:Icons.logout, color: Colors.blueAccent,),
    //   subtitle: '',
    //   onTap: (){ } ,
    //
    // );
    // Widget bulidAccount() =>SimpleSettingsTile(
    //   leading: IconWidget(icon:Icons.person,color: Colors.green,),
    //   title: 'Account Settings',
    //   subtitle: 'Privacy, Security, Language',
    //   child: Container(),
    //   onTap: () { },
    //
    //
    // );
    // Widget bulidLanguage() =>DropDownSettingsTile(
    //     title: 'Language',
    //     settingKey: keyLanguage,
    //     selected: 1,
    //     values: Language,
    // );
    // Widget bulidLocation() => TextInputSettingsTile(
    //     title: 'Location',
    //     settingKey: keyLocation,
    //     initialValue: 'Iran',
    //     onChange: (location){ },
    //
    // );

    var profileInfo = Expanded(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: kSpacingUint * 10,
            width:  kSpacingUint * 10,
            margin: EdgeInsets.only(top: kSpacingUint.w *3),
            child: Stack(
              children:[
                CircleAvatar(
                  radius: kSpacingUint.w * 5,
                  backgroundImage : AssetImage('images/PngItem.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: kSpacingUint.w * 2.5,
                      width: kSpacingUint.w * 2.5,
                      decoration:
                      BoxDecoration(color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarKPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUint.w *1.5),
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUint.w *2,),
          Text("Fartash", style: kTitleTextStyle,),
          SizedBox(height: kSpacingUint.w * 0.5,),
          Text("aq.fartash*gmail.com", style: kTitleTextStyle,),
          SizedBox(height: kSpacingUint.w * 2,
          ),
          Container(
            height: kSpacingUint.w * 4,
            width:  kSpacingUint.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUint * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text('Upgrade to PRO', style: kButtonTextStyle,),

            ),
          )

        ],
      ),
    );

    var header =  Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          LineAwesomeIcons.arrow_circle_left,
          size: ScreenUtil().setHeight(kSpacingUint.w * 3),
        ),
        profileInfo,
        Icon(
          LineAwesomeIcons.sun_1,
          size: ScreenUtil().setHeight(kSpacingUint.w * 3),
        ),
        SizedBox(width:kSpacingUint.w* 5),
      ],
    );

    return Scaffold(
      backgroundColor: kDarkSecondaryColor,
      body: Column(

        children: [

          SizedBox(width:kSpacingUint.w*5),
         header,
        ],
      ),
    );
  }
}
