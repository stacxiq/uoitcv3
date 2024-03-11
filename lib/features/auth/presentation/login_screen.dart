import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_bloc.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_event.dart';
import 'package:uoitc_new_app/features/auth/presentation/widgets/login_submit_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
            top: 180.h,
            right: 30.w,
            left: 30.w,
            child: Container(
              height: 500.h,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    const VerticalSpacing(height: 30),
                    SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: Image.asset('assets/images/uoitc.png'),
                    ),
                    const VerticalSpacing(height: 35),
                    SizedBox(
                      height: 60.h,
                      child: TextFormField(
                        controller: codeController,
                        decoration: InputDecoration(
                          hintText: 'رمز المستخدم',
                          prefixIcon: Icon(
                            IconlyBroken.user_2,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacing(height: 15),
                    SizedBox(
                      height: 60.h,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          prefixIcon: Icon(
                            IconlyBroken.password,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacing(height: 20),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEvent.login(
                                codeController.text, passwordController.text),
                          );
                        },
                        child: Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    LoginSubmitButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
