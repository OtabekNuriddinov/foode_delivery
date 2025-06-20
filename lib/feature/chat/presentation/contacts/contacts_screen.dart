import 'package:flutter/material.dart';
import 'package:foode_delivery/feature/auth/barrel.dart';
import 'package:lottie/lottie.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat Screen – Coming Soon",
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
