import '../barrel.dart';
import '../common/lists.dart';
import '../components/custom_menu_card.dart';

class PopularMenus extends StatefulWidget {
  const PopularMenus({super.key});

  @override
  State<PopularMenus> createState() => _PopularMenusState();
}

class _PopularMenusState extends State<PopularMenus> {

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
            Navigator.pop(context);
          },
          title: "Popular Menu",
        controller: _searchController,
        isHaveSearchbar: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: ListView.builder(
          itemCount: CommonLists.menus.length,
            itemBuilder: (context, index){
            return CustomMenuCard(
                menus: CommonLists.menus[index]
            );
            }
        ),
      ),
    );
  }
}
