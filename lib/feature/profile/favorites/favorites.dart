import '../../auth/barrel.dart';
import '../common/lists.dart';
import '../components/custom_favorite_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: Transform.translate(
          offset: Offset(2.w, 0.8.h),
          child: Container(
            padding: EdgeInsets.only(left: 1.7.w),
            margin: EdgeInsets.all(2.2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.3.h),
              color: AppColors.pink.withAlpha(70),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 2.3.h),
                color: AppColors.darkPink,
                onPressed: (){
                  context.pop();
                },
              ),
            ),
          ),
        ),
        title: Transform.translate(
          offset: Offset(0, 0.8.h),
          child: Text("Favorites", style: AppTextStyles.appBarTextStyle),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: (value){},
                    decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          )
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: CommonListsFav.favouritesList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomFavoriteCard(
              key: ValueKey(index),
              favouritesList: CommonListsFav.favouritesList[index],
            );
          },
        ),
      ),
    );
  }
}
