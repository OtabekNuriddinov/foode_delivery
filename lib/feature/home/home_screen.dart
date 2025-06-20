import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foode_delivery/feature/auth/presentation/bloc/auth_bloc.dart';

import 'barrel.dart';
import 'common/lists.dart';
import 'components/custom_menu_card.dart';
import 'components/custom_restaurant_card.dart';
import 'components/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    String? nickName;
    if(state is AuthSignInSuccess){
      nickName = state.user.nickName;
    }
    print(nickName);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, right: 2.w),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyText.withAlpha(60),
              ),
              child: Icon(
                Icons.notifications_active,
                color: AppColors.darkPink,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: Transform.translate(
          offset: Offset(1.w, 0.8.h),
          child: Container(
            margin: EdgeInsets.all(2.2.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkPink,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.lunch_dining,
                  size: 2.3.h,
                  color: AppColors.white,
                ),
                color: AppColors.darkPink,
                onPressed: () {},
              ),
            ),
          ),
        ),
        title: Transform.translate(
          offset: Offset(-2.w, 0.8.h),
          child: Text(state is AuthLoading
              ? "Loading..."
              : "Hello, ${nickName ?? "Guest"}", style: AppTextStyles.appBarTextStyle),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: CustomSearchBar(
            onPressed: (){
              context.go('/home/find-ur-food');
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 180,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.pink, AppColors.darkPink],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.h, left: 3.w),
                        child: Image.asset(
                          fit: BoxFit.contain,
                          "assets/images/burger_image.png",
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Special Deal for\nDecember",
                            style: AppTextStyles.appBarTextStyle.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(120, 40),
                              backgroundColor: AppColors.orange,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy Now",
                              style: AppTextStyles.appBarBottomTextStyle.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 2.h)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Restaurant",
                      style: AppTextStyles.appBarTextStyle.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.go('/home/popular-restaurants');
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
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 1.h)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomRestaurantCard(
                      restaurant: CommonLists.restaurants[index],
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 2.h)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Menu",
                      style: AppTextStyles.appBarTextStyle.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.go('/home/popular-menus');
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
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 2.h)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 3, (
                  context,
                  index,
                ) {
                  return CustomMenuCard(menus: CommonLists.menus[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
