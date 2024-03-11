import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

abstract class UtiliyRemoteDataSource {
  Future<List<Utility>> fetchUtilities();
}

class UtiliyRemoteDataSourceImpl extends UtiliyRemoteDataSource {
  @override
  Future<List<Utility>> fetchUtilities() async {
    try {
      final requestData = {
        'operation': 'utilities',
      };
      final response =
          await NetworkManager.dio.post('utilities.php', data: requestData);

      Map<String, dynamic> result = json.decode(response.data);

      final utilityList = result["utilities"];

      List<Utility> utilities = [];
      for (var e in utilityList) {
        utilities.add(Utility.fromJson(e));
      }
      return utilities;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
