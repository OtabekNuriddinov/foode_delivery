import '../../../barrel.dart';
import 'components/contact_type_card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
          context: context,
          onPressed: (){
            context.pop();
          },
          title: "Forgot password?"
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
        child: Column(
          children: [
            Text(
                AppStrings.selectContact,
                style: AppTextStyles.appBarBottomTextStyle
            ),
            SizedBox(height: 3.h),
            ContactTypeCard(
                icon: Icons.message,
                onPressed: (){
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                selectedIndex: _selectedIndex,
                currentIndex: 0,
                via: "via SMS:",
                viaBottom: "+6282*******39"
            ),
            SizedBox(height: 3.h),
            ContactTypeCard(
                icon: Icons.email,
                onPressed: (){
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                selectedIndex: _selectedIndex,
                currentIndex: 1,
                via: "via Email:",
                viaBottom: "ex***le@yourdomain.com",
            ),
            Spacer(),
            MainButton(
                color1: AppColors.pink,
                color2: AppColors.darkPink,
                text: "Next",
                onPressed: (){
                  context.go('/sign-in/forgot-password/otp');
                }
            )
          ],
        ),
      ),
    );
  }
}
