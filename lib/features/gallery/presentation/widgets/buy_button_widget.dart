import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyButtonWidget extends StatelessWidget {
  final VoidCallback ontap;
  const BuyButtonWidget({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        width: 200.w,
        height: 40.h,
        child: MaterialButton(
          onPressed: ontap,
          child: Text(
            'عرض المزيد',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      );
}
