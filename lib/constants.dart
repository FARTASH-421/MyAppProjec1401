import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUint = 10;

const kDarKPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const KLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUint.w * 1.7),
    fontWeight: FontWeight.w600);

final kCaptionTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUint.w * 1.5),
    fontWeight: FontWeight.w100);

final kButtonTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUint.w * 1.5),
    fontWeight: FontWeight.w400);

final kDarkThem = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Kurale",
    primaryColor: kDarKPrimaryColor,
    canvasColor: kDarKPrimaryColor,
    backgroundColor: kDarkSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: kLightPrimaryColor,
        ),
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Kurale',
          bodyColor: KLightSecondaryColor,
          displayColor: KLightSecondaryColor,
        ));

final kLightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Kurale",
    primaryColor: kLightPrimaryColor,
    canvasColor: kLightPrimaryColor,
    backgroundColor: KLightSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData.light().iconTheme.copyWith(
          color: kDarkSecondaryColor,
        ),
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Kurale',
          bodyColor: kDarkSecondaryColor,
          displayColor: kDarkSecondaryColor,
        ));
