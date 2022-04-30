import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//0xff told flutter to use hexa with opacity 100%
Color kPrimaryColor = const Color(0xff5C40CC);
Color kBlackColor = const Color(0xff1F1449);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff9698A9);
Color kGreenColor = const Color(0xff0EC3AE);
Color kRedColor = const Color(0xffEB70A5);
Color kBackgroundColor = const Color(0xffFAFAFA);
Color kInactiveColor = const Color(0xffDBD7EC);
Color kUnavailableColor = const Color(0xffEBECF1);
Color kAvailableColor = const Color(0xffE0D9FF);

TextStyle blackTextStyle = GoogleFonts.poppins(color: kBlackColor);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);

TextStyle grayTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(color: kPrimaryColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

BorderRadius borderDefault = BorderRadius.circular(17);
double defaultMargin = 24.0;
