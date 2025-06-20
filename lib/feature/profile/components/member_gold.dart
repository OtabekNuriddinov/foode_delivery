import '../../auth/barrel.dart';

class MemberGold extends StatelessWidget {
  const MemberGold({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        border: Border.all(color: Color(0xFFFFB800), width: 2),
      ),
      child: Center(
        child: Text(
          "Member Gold",
          style: GoogleFonts.sourceSans3(
            color: Color(0xFFFFB800),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}