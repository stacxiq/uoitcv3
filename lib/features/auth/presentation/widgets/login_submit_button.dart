import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/features/auth/data/models/user.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_bloc.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_state.dart';

class LoginSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, AuthState current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, AuthState state) {
          state.when(
            initial: () {},
            loading: () {
              EasyLoading.show();
            },
            success: (User user) {
              EasyLoading.dismiss();
              if (user.is_updated == '0') {
                context.pushNamed(Routes.employeeFormScreen);
              } else {
                context.pushNamed(Routes.homeScreen);
              }
            },
            error: (error) {
              EasyLoading.dismiss();
              DelightToastBar(
                snackbarDuration: const Duration(seconds: 2),
                autoDismiss: true,
                builder: (context) => const ToastCard(
                  leading: Icon(
                    Icons.error,
                    size: 28,
                  ),
                  title: Text(
                    'رمز المستخدم او كلمة المرور غير صالحة',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ).show(context);
            },
          );
        },
        child: const SizedBox.shrink());
  }
}
