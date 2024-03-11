import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget(
      {super.key,
      required this.cmargin,
      required this.icon,
      required this.onTap});

  final EdgeInsetsGeometry cmargin;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 45.w,
        margin: cmargin,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15.r)),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
