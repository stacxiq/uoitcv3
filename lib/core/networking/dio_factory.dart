import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uoitc_new_app/core/networking/network_constants.dart';
import 'package:uoitc_new_app/core/services/authservice/auth_service.dart';

class NetworkManager {
  static final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: false,
    ),
  );

  static Future<void> initializeInterceptors() async {
    // dio.interceptors.add(alice.getDioInterceptor());

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        // Box tokenBox = Get.find<Box>(tag: TOKEN);
        // Box settingBox = Get.find<Box>(tag: SETTINGS);

        // // var token = await GetStorage().read('login_token');
        var token = AuthService.impl().getToken();

        if (token != '') {
          print(token);
          request.headers['Authorization'] = 'Bearer $token';
        }
        var headers = {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        };

        request.headers.addAll(headers);

        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        print(response);
        return handler.next(response); // continue
      },
      onError: (error, handler) {
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor
}
