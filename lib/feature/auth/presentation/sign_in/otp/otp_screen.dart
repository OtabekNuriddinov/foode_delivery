import '../../../barrel.dart';
import 'components/otp_rich_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index){
    if(value.length == 1 && index < 3){
      FocusScope.of(context).requestFocus(_focusNodes[index+1]);
    }
    if(value.isEmpty && index > 0){
      FocusScope.of(context).requestFocus(_focusNodes[index-1]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
        context: context,
        onPressed: () {
          context.pop();
        },
        title: "Forgot password",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.h),
            Text(
              "Code has been send to +9989******08",
              style: AppTextStyles.appBarBottomTextStyle,
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index){
                return Padding(
                    padding: EdgeInsets.only(right: index < 3 ? 4.w : 0),
                    child: SizedBox(
                      width: 18.w,
                      height: 7.h,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: AppTextStyles.appBarTextStyle.copyWith(fontSize: 20.sp),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.h),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.1
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.h),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.1
                            )
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.h),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.1
                              )
                          ),
                        ),
                        onChanged: (value) => _onChanged(value, index),
                      )
                    ),
                );
              }),
            ),
            SizedBox(height: 5.h),
            OTPRichText(),
            SizedBox(height: 30.h),
            MainButton(
                color1: AppColors.pink,
                color2: AppColors.darkPink,
                text: "Next",
                onPressed: (){
                  final enteredOtp = _controllers.map((c) => c.text).join();
                  print("Kiritilgan OTP: $enteredOtp");
                  context.go('/sign-in/forgot-password/otp/reset-password');
                }
            )
          ],
        ),
      ),
    );
  }
}
