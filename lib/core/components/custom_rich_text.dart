import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;
  const CustomRichText({
    required this.text1,
    required this.text2,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: GoogleFonts.sourceSans3(
                    color: Colors.grey,
                    fontSize: 16.sp
                ),
              ),
              TextSpan(
                  text: text2,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPressed
              )
            ]
        )
    );
  }
}