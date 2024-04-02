import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

abstract class CollegeRemoteDataSource {
  Future<Colleges> fetchCollegeData();
}

class CollegeRemoteDataSourceImpl implements CollegeRemoteDataSource {
  @override
  Future<Colleges> fetchCollegeData() async {
    //   await dio.request(
    // 'https://app.uoitc.edu.iq/__mobile_app_data_10122019/rest_api/colleges.php',
    // options: Options(
    //   method: 'POST',
    //   headers: headers,
    // ),
    try {
      final response = await NetworkManager.dio.request(
        'colleges.php',
        options: Options(
          method: 'POST',
        ),
      );

      Map<String, dynamic> result = json.decode(response.data);

      final Colleges colleges = Colleges.fromJson(result);

      return colleges;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
