import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import '../../feature/home/components/custom_search_bar.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class CommonMethods{

  static AppBar customAppBar({
    required BuildContext context,
    required Function() onPressed,
    required String title,
    bool isHaveSearchbar = false,
    TextEditingController? controller,
    void Function(String)? onChanged,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: Transform.translate(
        offset: Offset(2.w, 0.8.h),
        child: Container(
          padding: EdgeInsets.only(left: 1.7.w),
          margin: EdgeInsets.all(2.2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.3.h),
            color: AppColors.pink.withAlpha(70),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 2.3.h),
              color: AppColors.darkPink,
              onPressed: onPressed,
            ),
          ),
        ),
      ),
      title: Transform.translate(
        offset: Offset(0, 0.8.h),
        child: Text(title, style: AppTextStyles.appBarTextStyle),
      ),
      bottom: isHaveSearchbar
          ? PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: CustomSearchBar(
          controller: controller,
          onChanged: onChanged,
        ),
      )
          : PreferredSize(preferredSize: Size.zero, child: SizedBox.shrink()),
    );
  }
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}