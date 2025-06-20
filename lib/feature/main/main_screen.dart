import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../core/components/custom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  const MainScreen({super.key, required this.child, required this.currentIndex,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
          onChanged: (index){
            print(index);
            if(currentIndex != index){
              String page = switch(index){
                0 => "/home",
                1 => "/order",
                2 => "/chat",
                3 => "/profile",
                _ => "/home",
              };
              context.go(page);
            }
          }
      ),
    );
  }
}
