import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onChanged;
  const CustomBottomNavBar({super.key, required this.onChanged});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.onChanged(0);
  }

  void _onPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 90,
      color: Colors.transparent,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              IconData icon;
              String label;
              switch (index) {
                case 0:
                  icon = Icons.home;
                  label = "Home";
                  break;
                case 1:
                  icon = Icons.shopping_basket;
                  label = "Cart";
                  break;
                case 2:
                  icon = Icons.message;
                  label = "Chat";
                  break;
                case 3:
                  icon = Icons.person;
                  label = "Profile";
                  break;
                default:
                  icon = Icons.circle;
                  label = "";
              }
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onPressed(index),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 4.w : 0,
                          vertical: 0.6.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.pink.withAlpha(65)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds){
                                return LinearGradient(
                                    colors: [AppColors.pink, AppColors.darkPink],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight
                                ).createShader(bounds);
                              },
                              child: Icon(
                                  icon, color: AppColors.white,
                              ),
                            ),
                            if (isSelected) SizedBox(width: 1.w),
                            if (isSelected)
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [AppColors.pink, AppColors.darkPink],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  label,
                                  style: GoogleFonts.sourceSans3(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
