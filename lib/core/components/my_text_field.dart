import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(5.h),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        focusNode: focusNode,
        validator: validator,
        readOnly: readOnly!,
        onTap: onTap,
        onChanged: onChanged,
        style: AppTextStyles.blackTextStyle16,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: AppColors.greyText, fontSize: 16.sp),
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.5.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppColors.textFieldBackground,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
