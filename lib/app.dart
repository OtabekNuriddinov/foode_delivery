import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/router/app_router.dart';

class Foode extends StatelessWidget {
  const Foode({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, type){
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        }
    );
  }
}
