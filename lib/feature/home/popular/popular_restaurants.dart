import '../barrel.dart';
import '../common/lists.dart';
import '../components/custom_restaurant_card.dart';

class PopularRestaurants extends StatefulWidget {
  const PopularRestaurants({super.key});

  @override
  State<PopularRestaurants> createState() => _PopularRestaurantsState();
}

class _PopularRestaurantsState extends State<PopularRestaurants> {

  final TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.customAppBar(
          context: context,
          onPressed: (){
            context.pop();
          },
          title: "Popular Restaurants",
        isHaveSearchbar: true,
        controller: _searchController,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: GridView.builder(
          itemCount: CommonLists.restaurants.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.85
            ),
            itemBuilder: (context, index){
              return CustomRestaurantCard(
                  restaurant: CommonLists.restaurants[index],
              );
            }
        ),
      ),

    );
  }
}
