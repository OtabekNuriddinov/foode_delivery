import '../../../../barrel.dart';

class OTPRichText extends StatelessWidget {
  const OTPRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Resend code in ",
            style: AppTextStyles.appBarBottomTextStyle,
          ),
          TextSpan(
            text: "56 ",
            style: GoogleFonts.sourceSans3(
              fontSize: 16.5,
              fontWeight: FontWeight.w400,
              color: AppColors.darkPink
            ),
          ),
          TextSpan(
            text: "s",
            style: AppTextStyles.appBarBottomTextStyle,
          )
        ]));
  }
}
