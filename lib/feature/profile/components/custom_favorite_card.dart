import 'package:flutter/material.dart';
import 'package:foode_delivery/feature/auth/barrel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

class CustomFavoriteCard extends StatefulWidget {
  final Map<String, dynamic> favouritesList;

  const CustomFavoriteCard({
    super.key,
    required this.favouritesList,
  });

  @override
  State<CustomFavoriteCard> createState() => _CustomFavoriteCardState();
}

class _CustomFavoriteCardState extends State<CustomFavoriteCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final favourite = widget.favouritesList;
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: SizedBox(
        height: 98,
        child: Card(
          color: AppColors.white,
          elevation: 2,
          child: ListTile(
            leading: Image.asset(favourite['iconUrl']),
            title: Text(
              favourite['name'],
              style: AppTextStyles.blackTextStyle16.copyWith(fontSize: 17.sp),
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favourite['type'],
                  style: AppTextStyles.textStyle16.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.black.withAlpha(70),
                  ),
                ),
                Text(
                  favourite['price'],
                  style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkPink,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: AppColors.darkPink,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
