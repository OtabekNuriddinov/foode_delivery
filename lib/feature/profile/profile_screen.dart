import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/barrel.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:foode_delivery/feature/profile/common/lists.dart';
import 'package:foode_delivery/feature/profile/components/custom_favorite_card.dart';

import 'components/member_gold.dart';
import 'components/voucher_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final DraggableScrollableController controller =
      DraggableScrollableController();
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<AuthBloc>().add(GetUserFromFireStoreEvent(userId: user.uid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    final currentUser = FirebaseAuth.instance.currentUser;

    String? fullName;
    String? email;

    if (state is AuthSignInSuccess) {
      fullName = state.user.fullName;
      email = state.user.email;
    }

    if (email == null || email.isEmpty) {
      if (currentUser != null) {
        email = currentUser.email;
      }
    }
    if (fullName == null || fullName.isEmpty) {
      if (currentUser != null) {
        fullName = currentUser.displayName ?? currentUser.email?.split('@')[0];
      }
    }

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 410,
          child: Image.asset(
            width: double.infinity,
            "assets/images/profile_image.png",
            fit: BoxFit.cover,
          ),
        ),
        DraggableScrollableSheet(
          controller: controller,
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 55.w),
                        child: MemberGold(),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            fullName ?? "Guest",
                            style: AppTextStyles.blackTextStyle16.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pink.withAlpha(65),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: AppColors.darkPink,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        email ?? "a@gmail.com",
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black57,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      SizedBox(
                        height: 10.h,
                        width: double.infinity,
                        child: VoucherCard(),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Favorite",
                            style: AppTextStyles.appBarTextStyle.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              context.go('/profile/favorites');
                            },
                            child: Text(
                              "See all",
                              style: AppTextStyles.blackTextStyle16.copyWith(
                                color: AppColors.darkPink,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomFavoriteCard(
                            key: ValueKey(index),
                            favouritesList: CommonListsFav.favouritesList[index],
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}




