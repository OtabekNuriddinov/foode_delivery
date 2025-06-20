import 'package:flutter/material.dart';
import 'package:foode_delivery/feature/auth/barrel.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Screen – Coming Soon",
          style: GoogleFonts.sourceSans3(fontSize: 20.sp),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 70.h,
          width: 60.w,
          child: Lottie.asset("assets/animation/on_progress_animation.json"),
        ),
      ),
    );
  }
}
