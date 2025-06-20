import '../../../../barrel.dart';

class ContactTypeCard extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final int selectedIndex;
  final int currentIndex;
  final String via;
  final String viaBottom;
  const ContactTypeCard({
    required this.icon,
    required this.onPressed,
    required this.selectedIndex,
    required this.currentIndex,
    required this.via,
    required this.viaBottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedIndex == currentIndex? AppColors.darkPink : Colors.transparent,
                width: 2
            ),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black,
                  blurRadius: 0.5
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(width: 2.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(via, style: GoogleFonts.sourceSans3(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.deepGreyText
                  ),),
                  SizedBox(height: 0.5.h),
                  Text(viaBottom, style: AppTextStyles.blackTextStyle16.copyWith(
                    fontSize: 16.5.sp
                  ),)
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}