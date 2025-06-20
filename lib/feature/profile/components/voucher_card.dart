import '../../auth/barrel.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/icons/voucher_icon.png"),
              SizedBox(width: 2.h),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  "You have 4 vouchers",
                  style: AppTextStyles.blackTextStyle16.copyWith(
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}