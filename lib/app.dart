import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uoitc_new_app/core/routing/app_router.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/core/static/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uoitc_new_app/core/static/constant_app.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UOITC',
          navigatorKey: navigatorKey,
          locale: const Locale('ar'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Spanish
          ],
          theme: appTheme,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
