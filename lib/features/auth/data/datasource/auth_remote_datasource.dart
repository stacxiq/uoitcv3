import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/auth/data/models/user.dart';
import 'package:uoitc_new_app/features/auth/data/models/user_request.dart';

import 'dart:convert' show json, utf8;

abstract class AuthRemoteDataSource {
  Future<User> login(UserRequest user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<User> login(UserRequest userRequest) async {
    try {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      var bytes = utf8.encode(userRequest.password);
      var hashed = sha1.convert(bytes);
      Map<String, dynamic> formData = {
        'username': userRequest.username,
        'password': hashed.toString(),
        'token': await firebaseMessaging.getToken()
      };

      final response =
          await NetworkManager.dio.post('login.php', data: formData);

      Map<String, dynamic> result = json.decode(response.data);

      final userData = result['Login'][0];

      final User user = User.fromMap(userData);

      return user;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
