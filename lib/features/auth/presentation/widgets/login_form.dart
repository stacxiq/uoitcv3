import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_bloc.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: 400.w,
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
        child: Form(
          key: formKey,
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
                child: TextField(
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
                width: 290.w,
                height: 60.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
