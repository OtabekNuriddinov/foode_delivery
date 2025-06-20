import '../barrel.dart';

class CustomRestaurantCard extends StatelessWidget {
  final Map<String, dynamic> restaurant;
  const CustomRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        width: 36.w,
        height: 30.h,
        child: Card(
          color: AppColors.white,
          elevation: 2,
          margin: EdgeInsets.only(right: 4.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(restaurant['iconUrl']),
                SizedBox(height: 1.h),
                Text(restaurant['name'], style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),),

                Text(restaurant['time'], style: AppTextStyles.textStyle16.copyWith(
                  fontSize: 15.5.sp,
                  color: AppColors.black.withAlpha(70)
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
