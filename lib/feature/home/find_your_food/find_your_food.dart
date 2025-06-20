import '../barrel.dart';
import 'components/custom_filter_chip.dart';

class FindYourFood extends StatefulWidget {
  const FindYourFood({super.key});

  @override
  State<FindYourFood> createState() => _FindYourFoodState();
}

class _FindYourFoodState extends State<FindYourFood> {
  final TextEditingController _searchController = TextEditingController();

  String? selectedType;
  String? selectedLocation;
  String? selectedFood;

  final List<String> typeOptions = ['Restaurant', 'Menu'];
  final List<String> locationOptions = ['1 Km', '< 5 Km', '< 10 Km', '> 10 Km'];
  final List<String> foodOptions = [
    'Cake',
    'Salad',
    'Pasta',
    'Desert',
    'Main course',
    'Appetizer',
    'Soup',
  ];

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
        onPressed: () {
          context.pop();
        },
        title: "Find Your Food",
        controller: _searchController,
        isHaveSearchbar: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text(
              "Type",
              style: AppTextStyles.blackTextStyle16.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 2.h),
            Wrap(
              spacing: 2.w,
              children:
                  typeOptions.map((type) {
                    bool isSelected = selectedType == type;
                    return CustomFilterChip(
                        label: type,
                        isSelected: isSelected,
                        onSelected: (value){
                          setState(() {
                            selectedType = value ? type : null;
                            if(value){
                              print("Tanlandi: $type");
                            }
                            else{
                              print("Bekor qilindi: $type");
                            }
                          });
                        }
                    );
                  }).toList(),
            ),
            SizedBox(height: 3.h),
            Text(
              "Location",
              style: AppTextStyles.blackTextStyle16.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 2.h),
            Wrap(
              spacing: 2.w,
              children: locationOptions.map((location){
                bool isSelected = selectedLocation == location;
                return CustomFilterChip(
                    label: location,
                    isSelected: isSelected,
                    onSelected: (value){
                      setState(() {
                        selectedLocation = value ? location : null;
                        if(value){
                          print("Tanlandi: $location");
                        }
                        else{
                          print("Bekor qilindi: $location");
                        }
                      });
                    }
                );
              }).toList(),
            ),
            SizedBox(height: 3.h),
            Text(
              "Food",
              style: AppTextStyles.blackTextStyle16.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 2.h),
            Wrap(
              runSpacing: 2.h,
              spacing: 2.w,
              children: foodOptions.map((food){
                final isSelected = selectedFood == food;
                return CustomFilterChip(
                    label: food,
                    isSelected: isSelected,
                    onSelected: (value){
                      setState(() {
                        selectedFood = value ? food : null;
                        if(value){
                          print("Tanlandi: $food");
                        }
                        else{
                          print("Bekor qilindi: $food");
                        }
                      });
                    },
                );
              }).toList(),
            ),
            Spacer(),
            MainButton(
                color1: (selectedFood!=null && selectedLocation!=null && selectedType!=null)?AppColors.pink:AppColors.pink.withAlpha(120),
                color2: (selectedFood!=null && selectedLocation!=null && selectedType!=null)?AppColors.darkPink:AppColors.pink.withAlpha(120),
                text: "Search",
                onPressed: (){
                  if(selectedFood!=null&&selectedLocation!=null&&selectedType!=null){
                    /// Search qilish kerak
                  }
                  else{
                    CommonMethods.showSnackBar(context, "Please, Select All the Choices!");
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}


