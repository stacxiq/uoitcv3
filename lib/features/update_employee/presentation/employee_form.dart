import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/static/colors.dart';

import 'package:uoitc_new_app/features/update_employee/presentation/widgets/employee_form.dart';

class EmployeeFormScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  EmployeeFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.r),
                      bottomRight: Radius.circular(35.r),
                    ),
                  ),
                  height: size.height / 2,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: size.height / 2,
                ),
              ],
            ),
            Positioned(
              top: 60.h,
              right: 20.w,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: 42.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130.h,
              right: 30.w,
              left: 30.w,
              child: const EmployeeForm(),
            )
          ],
        ),
      ),
    );
  }
}
