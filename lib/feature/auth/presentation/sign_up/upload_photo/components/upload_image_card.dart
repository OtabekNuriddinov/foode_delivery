import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/text_styles.dart';

class SetImageLocationCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;
  const SetImageLocationCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Card(
            color: AppColors.white,
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.pink.withAlpha(70),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 32,
                      color: AppColors.darkPink,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Text(text, style: AppTextStyles.blackTextStyle16.copyWith(
                    fontSize: 18.sp//
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}