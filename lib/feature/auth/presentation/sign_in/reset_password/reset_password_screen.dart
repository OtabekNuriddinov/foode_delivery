import '../../../barrel.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;


  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
          context: context,
          onPressed: (){
            context.pop();
          },
          title: "Reset password"
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create a new password", style: AppTextStyles.appBarBottomTextStyle),
              SizedBox(height: 3.h),
              LabelTextWithStar(text: "New Password"),
              SizedBox(height: 0.5.h),
              MyTextField(
                  controller: _passwordController,
                  hintText: "New Password",
                  focusNode: _passwordFocus,
                validator: Validation.validatePassword,
              ),
              SizedBox(height: 3.h),
              LabelTextWithStar(text: "Confirm New Password"),
              SizedBox(height: 0.5.h),
              MyTextField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm New Password",
                focusNode: _confirmPasswordFocus,
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
              Spacer(),
              MainButton(
                  color1: AppColors.pink,
                  color2: AppColors.darkPink,
                  text: "Save",
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    if (_confirmPasswordController.text != _passwordController.text) {
                      CommonMethods.showSnackBar(context, "Passwords do not match!");
                      return;
                    }
                    if(_formKey.currentState?.validate() ?? false){
                      context.go('/sign-in/forgot-password/otp/reset-password/congrats2');
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
