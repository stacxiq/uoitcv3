import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uoitc_new_app/app.dart';
import 'package:uoitc_new_app/core/routing/app_router.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/core/services/authservice/auth_service.dart';
import 'package:uoitc_new_app/core/shared/functions/easy_loding.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    await Firebase.initializeApp();
    await Hive.initFlutter();

    await AuthService.impl().openAuthBox();

    await NetworkManager.initializeInterceptors();

    runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    );
    configLoading();
  }, (error, stackTrace) {
    print('Error: $error');
    print('Stack Trace: $stackTrace');
  });
}
