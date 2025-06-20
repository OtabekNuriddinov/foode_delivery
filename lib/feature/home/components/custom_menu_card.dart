

import '../barrel.dart';

class CustomMenuCard extends StatelessWidget {
  final Map<String, dynamic> menus;
  const CustomMenuCard({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: SizedBox(
        height: 88,
        child: Card(
          color: AppColors.white,
          elevation: 2,
          child: ListTile(
            leading: Image.asset(menus['imageUrl']),
            title: Text(
              menus['name'],
              style: AppTextStyles.blackTextStyle16.copyWith(fontSize: 17.sp),
            ),
            subtitle: Text(
              menus['type'],
              style: AppTextStyles.textStyle16.copyWith(
                fontSize: 15.sp,
                color: AppColors.black.withAlpha(70),
              ),
            ),
            trailing: Text(
              menus['price'],
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.w600,
                color: AppColors.darkPink,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
