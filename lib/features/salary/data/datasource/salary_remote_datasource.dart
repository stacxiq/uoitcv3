import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/salary/data/models/salary.dart';

abstract class SalaryRemoteDataSource {
  Future<Salary> getSalary();
}

class SalaryRemoteDataSourceImpl implements SalaryRemoteDataSource {
  @override
  Future<Salary> getSalary() async {
    try {
      final response = await NetworkManager.dio.get('sal.php');
      final data = json.decode(response.data);
      return Salary.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
