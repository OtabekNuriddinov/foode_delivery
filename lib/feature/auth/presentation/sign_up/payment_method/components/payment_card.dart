import '../../../../barrel.dart';

class PaymentCard extends StatelessWidget {
  final Function() onPressed;
  final String imageUrl;
  final int selectedIndex;
  final int currentIndex;
  const PaymentCard({
    required this.imageUrl,
    required this.onPressed,
    required this.selectedIndex,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedIndex == currentIndex? AppColors.darkPink : Colors.transparent,
                width: 2
            ),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black,
                  blurRadius: 0.5
              )
            ]
        ),
        child: Center(
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}