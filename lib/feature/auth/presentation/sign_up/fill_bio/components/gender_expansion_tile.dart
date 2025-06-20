import '../../../../barrel.dart';

class GenderExpansionTile extends StatefulWidget {
  final Function(String) onChanged;

  const GenderExpansionTile({super.key, required this.onChanged});

  @override
  State<GenderExpansionTile> createState() => _GenderExpansionTileState();
}

class _GenderExpansionTileState extends State<GenderExpansionTile> {
  String? selectedGender;

  final List<String> genderOptions = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.4,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(5.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.h),
          border: Border.all(color: AppColors.textFieldBackground),
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 1.5.h),
          collapsedIconColor: AppColors.greyText,
          iconColor: AppColors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          title: Text(
            selectedGender ?? "Select Gender",
            style: AppTextStyles.blackTextStyle16.copyWith(
              color: selectedGender == null ? AppColors.greyText : AppColors.black,
              fontSize: 16.sp,
            ),
          ),
          children: genderOptions.map((gender) {
            return ListTile(
              title: Text(
                gender,
                style: AppTextStyles.blackTextStyle16,
              ),
              onTap: () {
                setState(() {
                  selectedGender = gender;
                });
                widget.onChanged(gender);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
