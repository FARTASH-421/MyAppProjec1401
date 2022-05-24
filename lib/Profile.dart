import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_pojects/constants.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

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
