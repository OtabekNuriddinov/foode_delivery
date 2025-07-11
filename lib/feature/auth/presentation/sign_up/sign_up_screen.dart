import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/validation.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/label_text_with_star.dart';
import '../../../../core/components/main_button.dart';
import '../../../../core/components/my_text_field.dart';
import '../../../../core/components/social_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }

  Future<void> handleSignUp() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthSignUpStep1RequestedEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    } else {
      print("Form validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthSignUpStep1Success) {
          Navigator.pop(context);
          context.go('/sign-up/fill-in-bio/${state.userId}');
        } else if (state is AuthFailure) {
          // Close loading indicator and show error
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 170,
                    width: 170,
                    "assets/icons/main_logo.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Sign up for free",
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  LabelTextWithStar(text: "Email"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                    controller: _emailController,
                    hintText: "Email or Phone Number",
                    focusNode: _emailFocus,
                    validator: Validation.validateEmail,
                  ),
                  SizedBox(height: 3.h),
                  LabelTextWithStar(text: "Password"),
                  SizedBox(height: 0.5.h),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () => toggleVisible(),
                      icon: Icon(!_isPasswordVisible ? Icons.visibility : Icons.visibility_off, size: 2.h,),
                    ),
                    focusNode: _passwordFocus,
                    validator: Validation.validatePassword,
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.h,
                        height: 2.h,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _rememberMe = newValue!;
                            });
                          },
                          activeColor: AppColors.pink,
                          side: BorderSide(color: AppColors.pink, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "Remember me",
                        style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  MainButton(
                      color1: !_rememberMe ? AppColors.pink.withAlpha(120):AppColors.pink,
                      color2: !_rememberMe ? AppColors.pink.withAlpha(120):AppColors.darkPink,
                      text: "Sign up",
                      onPressed: handleSignUp
                  ),
                  SizedBox(height: 3.h),
                  Text("Or continue with", style: AppTextStyles.aboveTextField),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialButton(
                        iconPath: "assets/icons/facebook_icon.png",
                        label: "Facebook",
                        backgroundColor: AppColors.white,
                        onPressed: () {},
                      ),
                      SocialButton(
                        iconPath: "assets/icons/google_icon.png",
                        label: "Google",
                        backgroundColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  CustomRichText(
                    text1: "Already have an account? ",
                    text2: "Sign in",
                    onPressed: (){
                      context.go('/sign-in');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggleVisible(){
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
