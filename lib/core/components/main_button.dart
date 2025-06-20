import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class MainButton extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;
  final Function() onPressed;
  const MainButton({
    required this.color1,
    required this.color2,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [color1, color2],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColors.white
            ),
          ),
        ),
      ),
    );
  }
}