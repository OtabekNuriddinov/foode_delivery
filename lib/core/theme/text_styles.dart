import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

sealed class AppTextStyles{

  static TextStyle aboveTextField = GoogleFonts.sourceSans3(
    fontWeight: FontWeight.w600,
    fontSize: 17.sp,
    color: AppColors.deepGreyText
  );

  static TextStyle textStyle16 = GoogleFonts.sourceSans3(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: AppColors.greyText
  );

  static TextStyle blackTextStyle16 = GoogleFonts.sourceSans3(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: AppColors.black
  );

  static TextStyle appBarTextStyle =  GoogleFonts.sourceSans3(
      fontWeight: FontWeight.w600,
      fontSize: 22.sp,
      color: AppColors.black
  );

  static TextStyle appBarBottomTextStyle = GoogleFonts.sourceSans3(
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 16.sp
  );
}