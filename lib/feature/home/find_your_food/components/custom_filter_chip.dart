import '../../barrel.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      label: Text(
        label,
        style: AppTextStyles.blackTextStyle16.copyWith(
          color:
          isSelected ? AppColors.white : AppColors.darkPink,
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: Color(0xFFF43F5E),
      backgroundColor: AppColors.white,
      side: BorderSide(color: AppColors.darkPink, width: 1),
      showCheckmark: false,
    );
  }
}