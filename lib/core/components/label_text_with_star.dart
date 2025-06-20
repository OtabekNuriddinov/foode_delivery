
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/text_styles.dart';

class LabelTextWithStar extends StatelessWidget {
  final String text;
  const LabelTextWithStar({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              text,
              style: AppTextStyles.aboveTextField,
          ),
          Text("*", style: TextStyle(color: Color(0xFFDA1414))),
        ],
      ),
    );
  }
}