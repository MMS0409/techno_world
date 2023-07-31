import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';

class NamedCounteiner extends StatelessWidget {
  const NamedCounteiner({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      height: 23.h,
      width: 87.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.c_FDA429),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white,fontSize: 16),
        ),
      ),
    );
  }
}
